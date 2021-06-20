//
//  SpanishVocab.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/15/21.
//

import Foundation

/**
   Struct to hold the flash card data
 
 
    parameters:
    spanish (String) : holds spanish word or phrase
    english (string) : holds english translation
    index(int) : index of flash card

*/
struct SpanishVocab : Codable {
    var spanish: String
    var english: String
    var index: Int
    
    func debug() {
        /**
           Function to debug the contents of the sturct


        */
        print("Spanish : \(spanish) English : \(english) Index : \(index)")
    }
}
