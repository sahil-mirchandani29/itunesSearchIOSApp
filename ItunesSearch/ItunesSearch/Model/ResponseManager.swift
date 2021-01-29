//
//  ResponseManager.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

let itunesClient = ItunesClient()

func sortUsingKind(items: [item]) -> [item]{
    var itemsVar = items
    for _ in 0..<itemsVar.count{
        for j in 1..<itemsVar.count{
            if(itemsVar[j].kind < itemsVar[j-1].kind){
                let temp = itemsVar[j-1]
                itemsVar[j-1] = itemsVar[j]
                itemsVar[j] = temp
            }
        }
    }
    return itemsVar
}

func getResults(keyword: String, completion: @escaping (Response) -> Void){
    itunesClient.search(keyword: keyword, completion: {result in
        completion(result)
    })
}
