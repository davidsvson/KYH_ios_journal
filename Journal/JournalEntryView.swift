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
    
    var journal : Journal
    
    @State var content : String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
           
            
        }.navigationBarItems(trailing:  Button(action: { saveEntry() }, label: { Text("Save") }))
            .onAppear(perform: setContent)
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
        let newEntry = JournalEntry(content: content)
        journal.entries.append(newEntry)
        print("save: \(newEntry.content)")
    }
    
}

//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView()
//    }
//}
