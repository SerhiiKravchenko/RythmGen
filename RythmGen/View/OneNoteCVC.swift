//
//  OneNoteCVC.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/1/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import UIKit

class OneNoteCVC: UICollectionViewCell {

    @IBOutlet weak var oneNoteImageOutlet: UIImageView!
    
    func setImage(imageName: String) {
        self.oneNoteImageOutlet.image = UIImage(named: imageName)
        self.backgroundColor = .orange
    }

}
