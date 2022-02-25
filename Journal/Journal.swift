//
//  Journal.swift
//  Journal
//
//  Created by David Svensson on 2022-02-25.
//

import Foundation

class Journal : ObservableObject {
   
    @Published var entries = [JournalEntry]()
    
    init() {
        addMockData()
    }
    
    func addMockData() {
        entries.append(JournalEntry(content: "Dag 1"))
        entries.append(JournalEntry(content: "Jag åt mat"))
        entries.append(JournalEntry(content: "Sov mest"))
        entries.append(JournalEntry(content: "Jobbade hårt"))
        entries.append(JournalEntry(content: "Programmerade hela dagen"))
    }
}
