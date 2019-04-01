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
    
    private func setValueOfSliderLabel() {
        tempoLabel.text = "\(model.tempo) Bit/s"
        tempoSlider.setValue(Float(model.tempo), animated: true)
    }

    @IBAction func decrimentTempoButton(_ sender: Any) {
        if model.tempo == 30 {
            return
        } else {
            model.tempo -= 1
            setValueOfSliderLabel()
        }
    }
    
    @IBAction func incrementTempoButton(_ sender: Any) {
        if model.tempo == 120 {
            return
        } else {
            model.tempo += 1
            setValueOfSliderLabel()
        }
    }
    
    @IBAction func tempoSliderAction(_ sender: UISlider) {
        let val = Int(sender.value)
        model.tempo = val
        tempoLabel.text = "\(val) Bit/s"
    }
    
    @IBAction func firstGroupAction(_ sender: Any) {
        if(model.firstGroup){
            model.firstGroup = false
        } else {
            model.firstGroup = true
        }
    }
    
    @IBAction func secondGroupAction(_ sender: Any) {
        if(!model.secondGroup){
            model.secondGroup = true
        } else {
            model.secondGroup = false
        }
    }
    
    @IBAction func thirdGroupAction(_ sender: Any) {
        if(!model.thirdGroup){
            model.thirdGroup = true
        } else {
            model.thirdGroup = false
        }
    }
    
    @IBAction func metronomAction(_ sender: Any) {
        if(!model.isMetronomePlay){
            model.isMetronomePlay = true
        } else {
            model.isMetronomePlay = false
        }
    }
    
    @IBAction func playNotesAction(_ sender: Any) {
        if(!model.isNotesPlay){
            model.isNotesPlay = true
        } else {
            model.isNotesPlay = false
        }
    }
}
