//
//  ContentView.swift
//  Journal
//
//  Created by David Svensson on 2022-02-25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var journal = Journal()
    
    @State var showInfo : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(journal.entries) { entry in
                        NavigationLink(destination: JournalEntryView(entry: entry)) {
                            Text(entry.content)
                        }
                    }.onDelete(perform: { indexSet in
                        journal.entries.remove(atOffsets: indexSet)
                    })
                }
                .navigationTitle("Journal")
                .navigationBarItems(trailing: NavigationLink(destination: JournalEntryView()) {
                    Image(systemName: "plus.circle")
                })
                Spacer()
                Button(action: {
                    showInfo = true
                }, label: {
                    Text("Open Sheet")
                    
                }).sheet(isPresented: $showInfo) {
                    SheetView(isPresented: $showInfo)
                }
            }
        }.environmentObject(journal)
    }
}

struct SheetView :View {
    @Binding var isPresented : Bool
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                isPresented = false
            }, label: {
                Text("close")
            })
            Spacer()
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
