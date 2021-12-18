//
//  WebServices.swift
//  XMMPAuth
//
//  Created by Mahendra Vishwakarma on 25/10/21.
//  Copyright © 2021 Mahendra. All rights reserved.
//

import Foundation
import UIKit


public class WebServices {
    //var socket:WebSocket?
    private let session: URLSession
    var socket: URLSessionWebSocketTask!
    
    init() {
      self.session = URLSession(configuration: .default)
      self.connect()
    }
    func connect() {
      self.socket = session.webSocketTask(with: URL(string: "ws://city-ws.herokuapp.com/")!)
      self.listen()
      self.socket.resume()
       
    }
    
    func listen() {
     
      self.socket.receive { [weak self] (result) in
        
        switch result {
        case .failure(let error):
          print(error)
         
             return
          case .success(let message):
          
          switch message {
          case .data(let data):
             break
          case .string(let str):
             guard let data = str.data(using: .utf8) else { return }
           break
          @unknown default:
            break
          }
        }
       
        self?.listen()
      }
    }
    func decodeData<T : Decodable>(from data : Data) throws -> (Result<T?,APIError>)
    {
        
        let decoder = JSONDecoder()
        let object = try decoder.decode(T.self, from: Data())
        
        return Result.success(object)
    }
    func gettResponse<T:Decodable>(model:T,completion: @escaping (Result<T?,APIError>)->()) {
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: Data())
            
            completion(Result.success(object))
        } catch let parsingError {
            completion(Result.failure(APIError.failedRequest(parsingError.localizedDescription)))
        }
    }
   
}
