//
//  Notes.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/1/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import Foundation

let secondsPerMinute = 60.0

struct NoteGroup {
    let groupTitle: String
    var imageNames: [String]
}

var model: NotesModel{
    return NotesModel.shared
}

class NotesModel: NSObject {
    static let shared = NotesModel()
    
    let notesDict = [
        "Group1" : ["1","2","3","4","5"],
        "Group2" : ["6","7","8"],
        "Group3" : ["9","10","11","12","13"]
    ]
    
    var isPlay = false
    var isMetronomePlay = false
    var isNotesPlay = false
    var firstGroup = true
    var secondGroup = false
    var thirdGroup = false
    var tactSize = 8
    var tempo = 60
    
    var bitPerSecond: Double {
        return (1.0 / (Double(tempo) / secondsPerMinute))
    }
    
    var generatedNotesForPlay: [String] {
        return generateNotes()
    }
    
    var notesForSelect: [NoteGroup] {
        return fetchNotes()
    }
    
    private func fetchNotes() -> [NoteGroup] {
        var selectedGroups = [NoteGroup]()
        
        if firstGroup {
            selectedGroups.append(NoteGroup(groupTitle: "Group1", imageNames: notesDict["Group1"]!))
        }
        
        if secondGroup {
            selectedGroups.append(NoteGroup(groupTitle: "Group2", imageNames: notesDict["Group2"]!))
        }
        
        if thirdGroup {
            selectedGroups.append(NoteGroup(groupTitle: "Group3", imageNames: notesDict["Group3"]!))
        }
        
        return selectedGroups
    }
    
    private func generateNotes() -> [String] {
        let resultNoteGroup = fetchNotes()
        var arr = [String]()
        for item in resultNoteGroup {
            arr += item.imageNames
        }
        var generatedArray = [String]()
        for _ in 0..<tactSize{
            generatedArray.append(arr[Int.random(in: 0..<arr.count)])
        }
        return generatedArray
    }
}
