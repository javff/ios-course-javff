//
//  ViewController.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/3/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class InvoicesViewController: BaseViewController {

    //MARK: - UI Vars
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)

    //MARK: - Vars
    let reuseIdentifier = "MyCell"
    var invoices:[Invoice] = []
    
    //MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCell()
        self.connectWithServices()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupCell(){
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func setupView() {
        super.setupView()
        
        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        self.view.backgroundColor = .blue
        self.navigationItem.title = "InvoicesViewController"
    }
    
    private func connectWithServices(){
        
        InvoicesServices.getInvoices { (result) in
            
            switch result{
                
            case .success(invoices: let data):

                self.invoices = data

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .error(error: let error):
                let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                self.present(alert, animated: true)
            }
        }
    }
}

//MARK: - UITableView implementations
extension InvoicesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return invoices.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let invoice = invoices[section]
        return invoice.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! MyCell
        let product = invoices[indexPath.section].products[indexPath.row]
        cell.myLabel.text = "\(product.name) \(product.price)$"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let invoice = invoices[section]
        return "Codigo de invoices: \(invoice.code)"
        
    }

}
