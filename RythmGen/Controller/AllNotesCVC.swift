//
//  AllNotesCVC.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/1/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import UIKit


class AllNotesCVC: UIViewController {
    @IBOutlet weak var allNotesOutlet: UICollectionView!
    
    var receivedNote = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allNotesOutlet.delegate = self
        allNotesOutlet.dataSource = self
        
        allNotesOutlet.register(UINib(nibName: "OneNoteCVC", bundle: nil), forCellWithReuseIdentifier: "OneNote")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
}

extension AllNotesCVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.modifiedArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allNotesOutlet.dequeueReusableCell(withReuseIdentifier: "OneNote", for: indexPath) as! OneNoteCVC
        cell.setImage(imageName: model.modifiedArr[indexPath.row])
        return cell
    }
}

extension AllNotesCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 5
        return CGSize(width: width, height: width)
    }
}
