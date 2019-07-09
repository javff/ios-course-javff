//
//  BaseViewController.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/1/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView(){
        self.navigationBar.backgroundColor = .green
        self.navigationBar.isTranslucent = false
    }
}

open class BaseViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    
   func setupView(){
        print("holaaa")
        self.view.backgroundColor = .red
    }
}
