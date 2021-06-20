//
//  VocabUI.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/16/21.
//

import SwiftUI


/**
   View for the vocab words

   Displays:
    Spanish : {Spanish word}
    English: {English translation}
 
    Arguments:
    Spanish (String) : Spanish word
    English (String): English word

*/
struct VocabUI: View {
    var spanish: String
    var english: String
    var body: some View {
        VStack{
            //Put words in vertical stack
        Text("Spanish: \(spanish)")
            .padding()
        Text("English: \(english)")
            .padding()
        }
    }
}

//struct VocabUI_Previews: PreviewProvider {
//    static var previews: some View {
//        VocabUI(vocab: SpanishVocab(spanish: "Hola", english: "Hello", index: 0))
//    }
//}
