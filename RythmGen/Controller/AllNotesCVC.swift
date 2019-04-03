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
        setupGridViewAllNotes()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupGridViewAllNotes() {
        let flow = allNotesOutlet.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(5)
        flow.minimumLineSpacing = CGFloat(25)
        flow.sectionInset.top = CGFloat(19)
        flow.sectionInset.left = CGFloat(10)
        flow.sectionInset.right = CGFloat(10)
    }
}

extension AllNotesCVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return model.notesForSelect.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.notesForSelect[section].imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allNotesOutlet.dequeueReusableCell(withReuseIdentifier: "OneNote", for: indexPath) as! OneNoteCVC
        let noteGroup =  model.notesForSelect[indexPath.section]
        let noteImageName = noteGroup.imageNames[indexPath.row]
        cell.imageName = noteImageName
        return cell
    }
}

extension AllNotesCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 5
        return CGSize(width: width, height: width)
    }
}
