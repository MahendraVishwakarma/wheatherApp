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
    
    // creates request from fetch data from server.
    class func requestHttp<T:Decodable>(urlString:String,method:HttpsMethod, param:Dictionary<String, Any>?, decode:@escaping(Decodable) -> T?, completion: @escaping (Result<T?,APIError>)->()) {
        print(urlString)
       
        let url = urlString
        guard let request = HeaderRequest.requestWithHeaders(httpMethod: method, url: url, parameters: param) else{
            completion(Result.failure(APIError.failedRequest("https issue")))
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(Result.failure(APIError.failedRequest(error?.localizedDescription)))
                
            } else {
                guard let serverData = data, error == nil else {
                  completion(Result.failure(APIError.failedRequest(error?.localizedDescription)))
                  return
                }
                
                do {
                 //   let string = String(data: serverData, encoding: .utf8)
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(T.self, from: serverData)
                    
                    completion(Result.success(object))
                } catch let parsingError {
                    completion(Result.failure(APIError.failedRequest(parsingError.localizedDescription)))
                }
            }
        })
        dataTask.resume()
    }
    
    
}

//MARK: - header request
public class HeaderRequest{
    
    class func requestWithHeaders(httpMethod: HttpsMethod, url: String,parameters:Dictionary<String, Any>?) -> URLRequest? {
        
        guard let validURL = URL(string: url) else{
            return nil
        }
        let postData = try? JSONSerialization.data(withJSONObject: parameters ?? [:], options: [])
        
        var request = URLRequest(url: validURL)
        request.httpMethod = httpMethod.localization
        request.timeoutInterval = 60
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        if(parameters != nil){
            request.httpBody = postData
        }
        
        return request
    }
    
    
}
