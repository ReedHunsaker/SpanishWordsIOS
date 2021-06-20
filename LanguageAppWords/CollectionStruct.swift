//
//  CollectionStruct.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/17/21.
//

import Foundation

/**
   Struct to hold the list of indexes
 
 
    ##TODO: implement it

*/
struct CollectionStruct : Codable{
    var indexes: [Int]
    
    func debug(){
        /**
           Function to degub contents of the struct

        */
        for i in indexes{
            print(String(i))
        }
}
}

