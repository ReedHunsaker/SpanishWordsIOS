//
//  Collections.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/18/21.
//

import Foundation

/**
   Struct to hold the list of spanish words
 
    ##TODO: implement it

*/
struct Collections : Codable {
    var vocabs : [SpanishVocab]
    
    func debugLen() -> String{
        /**
           function to debug the struct by finding the length of the list

        */
        return String(vocabs.count)
    }
}
