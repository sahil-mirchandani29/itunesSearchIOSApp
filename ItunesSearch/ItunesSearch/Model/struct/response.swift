//
//  response.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

struct Response: Codable{
    var statusCode: Int
    var numberOfItems: Int
    var items: [item]
    
    func getItemAtIndex(index: Int) -> item?{
        if(index < self.numberOfItems){
            return items[index]
        }
        return nil
    }
}
