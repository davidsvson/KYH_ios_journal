//
//  ContentView.swift
//  Journal
//
//  Created by David Svensson on 2022-02-25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var journal = Journal()
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(journal.entries) { entry in
                    NavigationLink(destination: JournalEntryView(entry: entry)) {
                        Text(entry.content)
                    }
                }
            }
                .navigationTitle("Journal")
                .navigationBarItems(trailing: NavigationLink(destination: JournalEntryView()) {
                    Image(systemName: "plus.circle")
                })
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
