//
//  FavouritesManager.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/27/21.
//

import Foundation

struct FavouritesManager{
    var favourites: [item?] = []
    
    mutating func addFavourites(_ item: item){
        self.favourites.append(item)
    }
    
    func getFavourites() ->[item?]{
        return self.favourites
    }
    
    func getCount() ->Int {
        return self.favourites.count
    }
    
    func getFavouriteAtIndex( index : Int) -> item?{
        return favourites[index] ?? nil
    }
    
//    func removeFavourites(_ response: Response){
//        if self.favourites != nil {
//            if self.favourites.contains(response){
//
//            }
//        }
//    }
}
