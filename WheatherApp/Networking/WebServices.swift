//
//  WebServices.swift
//  WheatherApp
//
//  Created by Mahendra Vishwakarma on 17/12/21.
//  Copyright © 2021 Mahendra. All rights reserved.
//

import Foundation
import UIKit

public class WebServices {
    
    let session: URLSession
    private var socket: URLSessionWebSocketTask!
    typealias listenHAndler = (Result<URLSessionWebSocketTask.Message, Error>) -> Void
    
    init() {
        self.session = URLSession(configuration: .default)
        self.connect()
    }
    
    func connect() {
        if let url = URL(string: Utils.websocketURL){
            self.socket = session.webSocketTask(with: url)
            self.socket.resume()
        }
        
    }
    
    func listen(completionHandler: @escaping listenHAndler) {
        self.socket.receive {(result) in
            
            switch result {
            case .failure(let error):
                print(error)
                completionHandler(.failure(error))
            case .success(let message):
                
                completionHandler(.success(message))
            }
            
        }
        
    }
    
    func fetchResponse<T: Decodable>(_ objectType: T.Type, completion:  @escaping (Result<T?,APIError>)->()) {
        
        listen { (response) in
            switch response{
            case .failure(let error):
                completion(Result.failure(APIError.failedRequest(error.localizedDescription)))
            case .success(let response):
                let decoder = JSONDecoder()
                switch response {
                case .data(let data):
                    do {
                        let object = try decoder.decode(T.self, from: data)
                        completion(Result.success(object))
                        
                    } catch let parsingError {
                        completion(Result.failure(APIError.failedRequest(parsingError.localizedDescription)))
                    }
                    
                case .string(let str):
                    if let data = str.data(using: .utf8) {
                        do {
                            let object = try decoder.decode(T.self, from: data)
                            completion(Result.success(object))
                            
                        } catch let parsingError {
                            completion(Result.failure(APIError.failedRequest(parsingError.localizedDescription)))
                        }
                    }
                    else {
                        completion(Result.failure(APIError.invalidData))
                    }
                    
                @unknown default:
                    completion(Result.failure(APIError.invalidData))
                }
                
            }
        }
    }
}
