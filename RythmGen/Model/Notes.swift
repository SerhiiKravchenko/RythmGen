//
//  Notes.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/1/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import Foundation

enum LevelGroups {
    case Group1
    case Group2
    case Group3
}

let rythmicFirst = [LevelGroups.Group1 : ["1","2","3","4","5"]]
let rythmicSecond = [LevelGroups.Group2 : ["6","7","8"]]
let rythmicThird = [LevelGroups.Group3 : ["9","10","11","12","13"]]
let secondsPerMinute = 60.0

var model: NotesModel{
    return NotesModel.shared
}

class NotesModel: NSObject {
    static let shared = NotesModel()

    var isPlay = false
    var isMetronomePlay = false
    var isNotesPlay = false
    var firstGroup = true
    var secondGroup = false
    var thirdGroup = false
    var tactSize = 8
    var tempo = 60
    var modifiedArr: [String] {
        return resultArrayFromSelectedGroups()
    }
    
    var bitPerSecond: Double {
        return (1.0 / (Double(tempo) / secondsPerMinute))
    }
    
    var resultArr: [String] {
        return generate()
    }
    
    private func resultArrayFromSelectedGroups() -> [String] {
        var resultArr = [String]()
        if(firstGroup){
            resultArr += rythmicFirst[LevelGroups.Group1] ?? [""]
        }
        if(secondGroup){
            resultArr += rythmicSecond[LevelGroups.Group2] ?? [""]
        }
        if(thirdGroup){
            resultArr += rythmicThird[LevelGroups.Group3] ?? [""]
        }
        return resultArr
    }
    
    private func generate() -> [String] {
        let resultArr = resultArrayFromSelectedGroups()
        var generatedArray = [String]()
        for _ in 0..<tactSize{
            generatedArray.append(resultArr[Int.random(in: 0..<resultArr.count)])
        }
        return generatedArray
    }
    
}

