//
//  CollectionUI.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/17/21.
//

import SwiftUI

/**
   Ui to display saved words at random

    Arguments:
    indexList ([Int]) = Lis tof saved words
    words [getWords()) = getWords class

*/
struct CollectionUI: View {
    @State var indexList : [Int]
    var words : getWords
    
    //Intialize new word variable to handle new word
    
    @State var new : SpanishVocab = SpanishVocab(spanish: "", english: "", index: 0)
    
    var body: some View {
        
        ScrollView(.vertical){
            Text("Collection")
                .font(.title)
            
            //Display the Spanish and English words
            
            VocabUI(spanish: self.new.spanish, english: self.new.english)
                .padding()
            
            //Button to get a new random word 1 is set as defualt index if none is found
            
            Button( action: {
                self.new = self.words.get(cardNumber: self.indexList.randomElement() ?? 1)
            })
            {
                Text("Press Me!")
                    .padding()
                    .font(.title)
            }
//             ForEach(0..<indexList.count){index in
//                VocabUI(spanish: self.words.get(cardNumber: indexList[index]).spanish, english: self.words.get(cardNumber: indexList[index]).english)
//                Text(String(indexList[index]))
//                Text("\(String(index))")
//                Text(indexList.vocabs[index].spanish)
//                Text(indexList.vocabs[index].english)
//                Text(String(indexList.vocabs[index].index))
        }
    }
        
    }
    

//struct CollectionUI_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionUI(indexList: Collections(vocabs: [SpanishVocab(spanish: "Hola", english: "Hello", index: 1)]), words: getWords())
//    }
//}

