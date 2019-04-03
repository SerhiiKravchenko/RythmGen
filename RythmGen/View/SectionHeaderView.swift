//
//  SectionHeaderView.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/3/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var groupTitleLabel: UILabel!
    
    var groupTitle: String! {
        didSet {
            groupTitleLabel.text = groupTitle
        }
    }
    
}
