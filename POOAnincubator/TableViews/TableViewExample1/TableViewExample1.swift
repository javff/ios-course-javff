//
//  TableViewExample1.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/3/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit


class FirstTableViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    let reuseIdentifier = "MyCell"
    
    let tableView: UITableView = UITableView(frame: .zero, style: UITableView.Style.plain)
    
    var myData:[String] = ["asdsad","qwewqewqe","xzczxczx"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCell()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func setupView() {
        super.setupView()
        
        view.addSubview(tableView)
        self.view.backgroundColor = .blue
        self.navigationItem.title = "second view"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCell(){
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)! as! MyCell
        let data = myData[indexPath.row]
        
        cell.myLabel.text = data
        return cell
    }
    
}
