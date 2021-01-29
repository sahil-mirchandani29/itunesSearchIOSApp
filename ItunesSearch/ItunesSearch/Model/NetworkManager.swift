//
//  NetworkManager.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

struct NetworkManager {
    var session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    typealias JSON = [String : Any]
    typealias JSONHandler = (JSON?, HTTPURLResponse?, Error?) -> Void
    
    func downloadJSON(URLString: String, completion: @escaping JSONHandler)
    {
        let request = URLRequest(url: URL(string: URLString)!)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: "Networking Error", code: 1, userInfo: userInfo)
                completion(nil, nil, error as Error)
                return
            }
            if data == nil {
                if let error = error {
                    completion(nil, httpResponse, error)
                }
            }else {
                if(httpResponse.statusCode == 200){
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                        completion(json, httpResponse, nil)
                    } catch let error as NSError {
                        completion(nil, httpResponse, error)
                    }
                }else{
                    print(" HTTP response code was not accepted")
                }
            }
        }
        dataTask.resume()
    }
}
