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
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)

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
        activityIndicator.center = tableView.center
    }
    
    private func setupCell(){
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        // registramos todo //
        
        for type in ProductType.allCases{
            let identifier =  type.getReuseIdentifier()
            let nib = UINib(nibName: identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    override func setupView() {
        super.setupView()
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        tableView.tableFooterView = UIView()
        self.view.backgroundColor = .blue
        activityIndicator.hidesWhenStopped = true
        self.navigationItem.title = "InvoicesViewController"
    }
    
    private func connectWithServices(){
        
        self.activityIndicator.startAnimating()
        
        InvoicesServices.getInvoices { (result) in
            
            self.activityIndicator.stopAnimating()
            
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
        
        let product = invoices[indexPath.section].products[indexPath.row]
        return product.type.cellForPRoductType(in: tableView, with: product)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let product = invoices[indexPath.section].products[indexPath.row]
        return product.type.heightForCell(in: tableView, with: product)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let invoice = invoices[section]
        return "Codigo de invoices: \(invoice.code)"
        
    }
}
