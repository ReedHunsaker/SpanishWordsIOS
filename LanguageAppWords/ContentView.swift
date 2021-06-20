//
//  ContentView.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/7/21.
//

import SwiftUI


struct ContentView: View {
    
    //Initalize the get words class to pull words from the database
    
    var words = getWords()
    
    // Set a base value for the variables to keeps trac of saved words and the new randomized word/flashcard
    @State var new = SpanishVocab(spanish: "empezar", english: "To start", index: 7740)
    @State var indexList : [Int] = []
    
    init(){
        //initalize it with a new word
        new = self.randomVocab()
    }
    
    var body: some View {
        
        //Add the navigation view with button to the next page Collections
        NavigationView{
        VStack{
            NavigationLink(destination:CollectionUI(indexList: indexList, words: words)){
                
                //Put in a Text button
                
                    Text("collection")
                        .padding()
                        .font(.title)
                        .onAppear(perform: {
                            
                            //Get the list of saved cards and clear the old one to aviod multiple
                            
                            indexList = []
                            for items in words.getId(){
                                indexList.append(items)
                                print("content view debug list: \(String(items))")
                        }

            })
            }
            
            //Add the view for the new flashcard
           
            VocabUI(spanish: self.new.spanish, english: self.new.english)
                .padding()
            
            //Button to get a new flashcard
            
            Button(action: {self.new = self.randomVocab()
            })
            {
                Text("Press Me!")
                    .padding()
                    .font(.title2)
            }
            
            //Button to save current flash card to collection
            
            Button(action: {words.save(cardNumber: self.new.index)})
            {
                Text("Save")
            }
            
            
        }
        }
        
    }
    func randomVocab() -> SpanishVocab{
        /**
           Function used to get random word

            Runs the get function from getWords and uses Int.Random

        */
        return words.get(cardNumber: Int.random(in: 0...7740))
    }
    func getCollections(){
        /**
           Function used to get list and clear the old one

        */
        words.clearIndexes()
        for items in words.getId(){
            indexList.append(items)
            print("content view debug list: \(String(items))")
        }
    }
    
}
//struct contentViewPreview: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}








