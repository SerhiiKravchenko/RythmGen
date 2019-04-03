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
        setupGridView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AllNotesCVC" {
            let AllNotesCVC = segue.destination as! AllNotesCVC
            AllNotesCVC.receivedNote = selectedNote
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedNote = indexPath.row.description
        performSegue(withIdentifier: "AllNotesCVC", sender: nil)
    }
    
    func setupGridView() {
        let flow = notesCVOutlet.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(5)
        flow.minimumLineSpacing = CGFloat(25)
        flow.sectionInset.top = CGFloat(19)
        flow.sectionInset.left = CGFloat(10)
    }
}

extension PlayVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.generatedNotesForPlay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = notesCVOutlet.dequeueReusableCell(withReuseIdentifier: "OneNote", for: indexPath) as! OneNoteCVC
        cell.imageName = model.generatedNotesForPlay[indexPath.row]
        cell.tag = indexPath.row + 1
        return cell
    }
}

extension PlayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 5
        return CGSize(width: width, height: width)
    }
}
