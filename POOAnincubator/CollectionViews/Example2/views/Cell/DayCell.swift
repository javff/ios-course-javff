//
//  DayCell.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/11/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    let reuseIdentifierNote = "NoteCell"
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.backgroundColor = .white
        return collection
    }()
    
    var notes:[Note] = []{
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupCell()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    private func setupView(){
        self.contentView.addSubview(collectionView)
    }
    
    private func setupCell(){
        
        let nib = UINib(nibName: reuseIdentifierNote, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifierNote)
    }
    
}

extension DayCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierNote, for: indexPath) as! NoteCell
        
        let note = notes[indexPath.item]
        
        cell.imageview.image = note.image
        cell.titleLabel.text = note.name
        cell.contentLabel.text = note.content
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    
    
}
