//
//  CollectionRowView.swift
//  LanguageAppWords
//
//  Created by Reed hunsaker on 6/18/21.
//

import SwiftUI


/**
   View of the row in the collection view
 
    ##TODO: implement it

*/
struct CollectionRowView: View {
    var spanishVocab : SpanishVocab
    var body: some View {
            HStack {
                Text(spanishVocab.spanish)

                Spacer()
            }
}
}

//struct CollectionRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CollectionRowView()
//    }
//}
