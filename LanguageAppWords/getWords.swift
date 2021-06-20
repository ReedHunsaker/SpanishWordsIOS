//
//  getWords.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/14/21.
////
//
import UIKit
import Firebase


/**
     Class to get the words from database

    Runs the get function from getWords and uses Int.Random

*/
class getWords{
    
    //Member Data

    let db: Firestore
    
    @Published var vocab: SpanishVocab
    
    
    //Collection to use list of words Unused
    //TODO: implement it in the code
    @Published var collections : Collections
    
    @Published var indexes: [Int]
    
    init() {
        FirebaseApp.configure()

        db = Firestore.firestore()
        
        vocab = SpanishVocab(spanish: "a", english: "b", index: 2)
        
        collections = Collections(vocabs: [])
        
        indexes = []
        
    }
    
    
    func get(cardNumber: Int) -> SpanishVocab{
        /**
           Function get word from the database

            Gives an integer and returns a SpanishVocab struct
        */
        
        let docRef =
            
            //Paths to the cards in the database
            
            self.db.collection("Vocabulary").document("\(cardNumber)")
        docRef.getDocument { (document, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }
            
            //formats the document recieved into a dictioary
            if let document = document, document.exists {
                let dataDescription = document.data()
                print(dataDescription!)
//                dataDescription = stringValueDic(dataDescription)
//                let decoder = PropertyListDecoder()
//                let _ = try? decoder.decode(SpanishVocab.self, from: document.data())
                
                // seperate the spanish and english words from the dictionary as a string
                
                let spanish = dataDescription!["spanish"] as? String ?? ""
                let english = dataDescription!["english"] as? String ?? ""
                
                //Set to struct and debug it by printing the object
                
                self.vocab = SpanishVocab(spanish: spanish, english: english, index: cardNumber)
                self.vocab.debug()
                }
            
                
                
            }
        return self.vocab
        }
    
    
    func save(cardNumber: Int, userName: String = "User"){
        /**
          Function to save the card to the database
         
            Parameters:
            cardNumber (Int): index number of card
            userName (String) : Name of user defaulted to user
        
        */
        let _ = self.db.collection("Users").document(String(cardNumber)).setData(["cardNumber \(cardNumber)": cardNumber], merge: true)
    }

    func getId() -> [Int]{
        /**
           Function used to get the list of Indexes that have been saved

           Returns them as a list

        */
        
        //Clear the Indexes
        self.clearIndexes()
        
        let docRef = self.db.collection("Users")
        docRef.getDocuments() { (querySnapshot, err) in
            if let err = err
            {
                print("Error getting documents: \(err)")
            } else{
            for document in querySnapshot!.documents {
                let docData = document.data()
                let docDataValues = Array(docData.values)
                print("Get Id debug \(String(docDataValues[0] as! Int))")
                self.indexes.append(docDataValues[0] as! Int)
                print("indexes length in getId: \(String(self.indexes.count))")
                    }

                
            }
                            
        }
        return self.indexes
    
        }
    
    func removeId(cardNumber: Int){
        /**
           Function used to remove an id from the saved list

            ##Untested, and not implemented

        */
        let _ = db.collection("Users").document(String(cardNumber)).delete()
         { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    func returnVocab() -> SpanishVocab{
        /**
           Function used to return the vocab variable holding the SpanishVocab struct

        */
        return self.vocab
    }
    
    func returnIndexes() -> [Int]{
        /**
           Function used to return the list of indexes


        */
        return self.indexes
    }
    func clearIndexes() {
        /**
           Function to clear the list of indexes


        */
        self.indexes = []
    }
    
    func setCollections(){
        /**
           Function to set the collection struct to the list of saved cards
         
            ##Work in progress
         
         TODO: get it to return each of the cards for the associated indexes not just 1

        */
        
        // Make a variable to hold the list of spanish words
        
        // maybe change this to an instance of a collections struct
        var newList : [SpanishVocab] = []
        
        
        print("index length in set collections: \(String(self.indexes.count))")
        
        //Loop through each index
        for i in 0..<self.indexes.count{
            print("Card numbers \(String(self.indexes[i]))")
            
            //Get the SpanishVocab struct with database information
            
            vocab = self.get(cardNumber: self.indexes[i])
            
            //apend to the newLost
            
            //TODO: try appending it to the collection struct directly
            
            newList.append(SpanishVocab(spanish: vocab.spanish, english: vocab.english, index: indexes[i]))
            print("Set collection debug: \(vocab.debug())")
            
        }
        //Initialize collections
        self.collections = Collections(vocabs: newList)
    }
    
    func returnCollections() -> Collections{
        /**
           Function used to return the collections struct


        */
        print("return collection degub: \(self.collections.debugLen())")
        return self.collections
    }


    
    
    /**
       ##Extra code including implementing the firebase with completion code

    */
    

//func makeCollectionCards(completion: @escaping (_ Collections: [SpanishVocab]) -> Void) {
//    self.clearIndexes()
//    self.indexes = self.getId()
//    var collectionList : [SpanishVocab] = []
//    for i in 0..<self.indexes.count{
//
//
//        let docRef = self.db.collection("Vocabulary").document("\(self.indexes[i])")
//    print(String(i))
//    docRef.getDocument { (document, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//            return
//        }
//        if let document = document, document.exists {
//            let dataDescription = document.data()
//            print(dataDescription!)
////                dataDescription = stringValueDic(dataDescription)
////                let decoder = PropertyListDecoder()
////                let _ = try? decoder.decode(SpanishVocab.self, from: document.data())
//            let spanish = dataDescription!["spanish"] as? String ?? ""
//            let english = dataDescription!["english"] as? String ?? ""
//            collectionList.append(SpanishVocab(spanish: spanish, english: english, index: self.indexes[i]))
//            }
//
//
//    }
//    }
//    completion(collectionList)
//
//
//    }
//
//
//func getCollectionCards() -> [SpanishVocab]{
//    var response : [SpanishVocab] = []
//    self.makeCollectionCards { Collections in
//        response = Collections
//        response.forEach { SpanishVocab in
//            print(SpanishVocab.english)
//        }
//    }
//    return response
//}
}
