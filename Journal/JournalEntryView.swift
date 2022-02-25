//
//  JournalEntryView.swift
//  Journal
//
//  Created by David Svensson on 2022-02-25.
//

import SwiftUI

struct JournalEntryView: View {
    var entry : JournalEntry? = nil
    let defaultContent = "Today I..."
    @EnvironmentObject var journal : Journal
    @Environment(\.presentationMode) var presentationMode
    
    @State var content : String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
                .onTapGesture {
                    clearText()
                }
           
            
        }.navigationBarItems(trailing:  Button(action: {
            saveEntry()
            presentationMode.wrappedValue.dismiss()
        },label: { Text("Save") }))
            .onAppear(perform: setContent)
        
        
    }
    
    
    func clearText() {
        if entry == nil {
            content = ""
        }
    }
    
    
    func setContent() {
        // guard let entry = entry else { return }
        
        if let entry = entry {
            content = entry.content
        } else {
            content = defaultContent
        }
    }
    
    func saveEntry() {
        if let entry = entry {
            // uppdatera den gammal entry
            journal.update(entry: entry, with: content)
        } else {
            //skapa en ny entry
            let newEntry = JournalEntry(content: content)
            journal.entries.append(newEntry)
        }
    }
    
}

//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView()
//    }
//}
