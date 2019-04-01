//
//  SettingsVC.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/1/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var tempoLabel: UILabel!
    @IBOutlet weak var tempoSlider: UISlider!
    
    var model: NotesModel{
        return NotesModel.shared
    }
    
    private func setValueOfSliderLabel() {
        tempoLabel.text = "\(NotesModel.shared.tempo) Bit/s"
        tempoSlider.setValue(Float(NotesModel.shared.tempo), animated: true)
    }

    @IBAction func decrimentTempoButton(_ sender: Any) {
        if model.tempo == 30 {
            return
        } else {
            NotesModel.shared.tempo -= 1
            setValueOfSliderLabel()
        }
    }
    
    @IBAction func incrementTempoButton(_ sender: Any) {
        if model.tempo == 120 {
            return
        } else {
            NotesModel.shared.tempo += 1
            setValueOfSliderLabel()
            print(NotesModel.shared.tempo)
        }
    }
    
    @IBAction func tempoSliderAction(_ sender: UISlider) {
        let val = Int(sender.value)
        NotesModel.shared.tempo = val
        tempoLabel.text = "\(val) Bit/s"
    }
    
    @IBAction func firstGroupAction(_ sender: Any) {
        if(NotesModel.shared.firstGroup){
            NotesModel.shared.firstGroup = false
        } else {
            NotesModel.shared.firstGroup = true
        }
    }
    @IBAction func secondGroupAction(_ sender: Any) {
        if(!NotesModel.shared.secondGroup){
            NotesModel.shared.secondGroup = true
        } else {
            NotesModel.shared.secondGroup = false
        }
    }
    @IBAction func thirdGroupAction(_ sender: Any) {
        if(!NotesModel.shared.thirdGroup){
            NotesModel.shared.thirdGroup = true
        } else {
            NotesModel.shared.thirdGroup = false
        }
    }
    
    @IBAction func metronomAction(_ sender: Any) {
        if(!NotesModel.shared.isMetronomePlay){
            NotesModel.shared.isMetronomePlay = true
        } else {
            NotesModel.shared.isMetronomePlay = false
        }
    }
    
    @IBAction func playNotesAction(_ sender: Any) {
        if(!NotesModel.shared.isNotesPlay){
            NotesModel.shared.isNotesPlay = true
        } else {
            NotesModel.shared.isNotesPlay = false
        }
    }
    
    
    

}
