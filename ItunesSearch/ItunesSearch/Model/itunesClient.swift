//
//  itunesClient.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

class ItunesClient{
    
    var baseURL:String = "https://itunes.apple.com/search?term="
    let networkManager = NetworkManager()
    private func URLgenerator(keyword: String) -> String{
        var url: String = baseURL
        let keywordArray = keyword.split(separator: " ")
        for keys in keywordArray{
            url.append(contentsOf: keys+"+")
        }
        url = String(url.dropLast())
        return url
    }
    func search(keyword: String, completion: @escaping (Response)->Void){
        getresults(keyword: keyword, completion: {Response in
            if(Response == nil){
                return
            }
            else{
                var sortedResponse = Response
                if(sortedResponse?.numberOfItems != 0){
                    sortedResponse?.items = sortUsingKind(items: Response!.items)
                }
                completion(sortedResponse!)
            }
        })
    }
    
    func getresults(keyword: String, completion: @escaping (Response?)->Void){
        
        let url = URLgenerator(keyword: keyword)
        print(url)
        networkManager.downloadJSON(URLString: url, completion: {(jsonResponse, httpResponse, error) in
            var response: Response = Response(statusCode: 200, numberOfItems: 0, items: [])
            if(jsonResponse == nil){
                response.statusCode = 220
                return
            }
            guard let json = jsonResponse, let resultDictionaries = json["results"] as? [[String: Any]] else{
                completion(nil)
                return
            }
            response.numberOfItems = resultDictionaries.count
            var items: [item] = []
            for itemDictionary in resultDictionaries{
                if(itemDictionary["trackId"] != nil){
                    if let item_ = item(dictionary: itemDictionary){
                        items.append(item_)
                    }
                }
            }
            response.items = items
            completion(response)
        }
        )
    }
    
}
