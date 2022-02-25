//
//  JournalEntry.swift
//  Journal
//
//  Created by David Svensson on 2022-02-25.
//

import Foundation

struct JournalEntry : Identifiable {
    var id = UUID()
    
    var content : String
    var date : Date = Date()
    
}
