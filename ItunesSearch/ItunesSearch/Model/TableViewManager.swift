//
//  TableViewManager.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/27/21.
//

import Foundation

class TableViewManager{
    
    var isSearchpressed: Bool = false
    var isSearchCompleted: Bool = false
    var isHomePressed: Bool = true
    var favouritesManager: FavouritesManager = FavouritesManager()
    var response:Response? = nil
    
    func getCount() -> Int {
        if(isHomePressed){
            let count = favouritesManager.getCount()
            if count == 0 {
                return 1
            }
            return count
        }
        if(isSearchpressed) {
            return 0
        }
        if (isSearchCompleted){
            if let response = response{
                return response.numberOfItems
            }
        }
        return 0
    }
    
    func changeState(_ state: States, _ keyword: String? = nil){
        switch state {
        case .isHomePressed:
            self.isHomePressed = true
            self.isSearchCompleted = false
            self.isSearchpressed = false
        case .isSearchPressed:
            self.isHomePressed = false
            self.isSearchCompleted = false
            self.isSearchpressed = true
        case .isSearchCompleted:
            self.isHomePressed = false
            self.isSearchCompleted = true
            self.isSearchpressed = false
            if let keyword = keyword{
                getResults(keyword: keyword) { (result) in
                    print("Found items : \(result.numberOfItems)")
                    self.response = result
                }
            }
        }
    }
    
    
    func getData(index : Int) -> String{
        if(isSearchpressed){
            return ""
        }
        if(isHomePressed){
            let count = favouritesManager.getCount()
            if count == 0 {
                return "No Data"
            }
            return favouritesManager.getFavouriteAtIndex(index: index)?.name ?? "No Data"
        }
        if( isSearchCompleted){
            if let response = response{
                if let currentItem = response.getItemAtIndex(index: index){
                    return currentItem.name
                }
            }
        }
        return ""
    }
    func getLabel() -> String{
        if(isHomePressed){
            return "Favourites"
        }
        if(isSearchpressed){
            return "Searching"
        }
        if(isSearchCompleted){
            return "Results"
        }
        return "Favourites"
    }
}
