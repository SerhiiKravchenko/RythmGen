//
//  PlayVC.swift
//  RythmGen
//
//  Created by Serhii Kravchenko on 4/1/19.
//  Copyright © 2019 Serhii Kravchenko. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {
    
    @IBOutlet weak var notesCVOutlet: UICollectionView!
    var selectedNote = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesCVOutlet.delegate = self
        notesCVOutlet.dataSource = self
        notesCVOutlet.register(UINib(nibName: "OneNoteCVC", bundle: nil), forCellWithReuseIdentifier: "OneNote")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let position = indexPath.row.description
        selectedNote = position
        performSegue(withIdentifier: "allNotesCVC", sender: nil)
    }
    
    func setupGridView() {
        let flow = notesCVOutlet.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(1)
        flow.minimumLineSpacing = CGFloat(25)
    }
}

extension PlayVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NotesModel.shared.resultArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = notesCVOutlet.dequeueReusableCell(withReuseIdentifier: "OneNote", for: indexPath) as! OneNoteCVC
        cell.setImage(imageName: NotesModel.shared.resultArr[indexPath.row])
        cell.tag = indexPath.row + 1
        print(cell.tag)
        return cell
    }
}

extension PlayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 5
        return CGSize(width: width, height: width)
    }
}
