//
//  MenuViewController.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/11/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {
    
    //MARK: - UIVars
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.isPagingEnabled = true
        collection.backgroundColor = .white
        return collection
    }()
    
    let menuCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection =  UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.isPagingEnabled = true
        collection.backgroundColor = .white
        return collection
    }()
    
    
    //MARK: - Vars
    let reuseIdentifier = "DayCellIdentifier"
    let menuReuseIdentifier = "MenuCell"
    
    var days:[Day] = [
    
         Day.init(
            name: "lunes",
            notes: [
                Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),
                Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil),Note.init(name: "ir a la escuela", content: "entregar la tarea lunes", image: nil)
                ]),
         
          Day.init(name: "martes", notes: [Note.init(name: "ir a la escuela", content: "entregar la tare martes", image: nil)]),
          
          Day.init(name: "miercoles", notes: [Note.init(name: "ir a la escuela", content: "entregar la tare miercoles", image: nil)]),
          
          Day.init(name: "jueves", notes: [Note.init(name: "ir a la escuela", content: "entregar la tare jueves", image: nil)]),
          
          Day.init(name: "viernes", notes: [Note.init(name: "ir a la escuela", content: "entregar la tare viernes", image: nil)])



    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let menuHeight:CGFloat = 100
        let nochHeight: CGFloat = 0
        
        menuCollectionView.frame = CGRect(x: 0, y: nochHeight, width: view.bounds.width, height: menuHeight)
        
        collectionView.frame =  CGRect(x: 0, y: menuHeight + nochHeight, width: view.bounds.width , height: view.bounds.height - menuHeight - nochHeight)
    
    }

    override func setupView() {
        super.setupView()
        view.addSubview(collectionView)
        view.addSubview(menuCollectionView)
    }
    
    private func setupCell(){
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let nib = UINib(nibName: menuReuseIdentifier, bundle: nil)
        
        menuCollectionView.register(nib, forCellWithReuseIdentifier: menuReuseIdentifier)
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == menuCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuReuseIdentifier, for: indexPath) as! MenuCell
            let day = days[indexPath.item]
            cell.menuLabel.text = day.name
            return cell
        }
        
        // default case  //
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DayCell
        let day = days[indexPath.item]
        cell.notes = day.notes
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == menuCollectionView{
            
            self.collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == menuCollectionView{
            
            return CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height)
        }
        
        // default case //
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    
    
}
