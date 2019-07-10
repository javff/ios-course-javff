//
//  Factura.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/3/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import Foundation
import UIKit


struct Invoice{
    
    let code:String
    let amount:Double
    let tax: Double
    let products:[Product]
    
}



struct Product{
    let name:String
    let price:Double
    let type:ProductType
}


enum ProductType: CaseIterable{
    
    case tool
    case electronic
    case food
    
    func getReuseIdentifier() -> String{

        switch self{
            
        case .electronic:
            return "ElectronicCell"
        case .food:
            return "FoodCell"
            
        case .tool:
            return "ToolCell"
        }
    }
        
    func cellForPRoductType(in tableView: UITableView,
                            with product:Product) -> UITableViewCell{
            
            switch product.type {
    
            case .electronic:
    
                let cell = tableView.dequeueReusableCell(withIdentifier: product.type.getReuseIdentifier()) as!  ElectronicCell
    
                cell.productLabel.text =  "\(product.name) \(product.price)$"
                return cell
    
            case .food:
    
                let cell = tableView.dequeueReusableCell(withIdentifier: product.type.getReuseIdentifier()) as! FoodCell
                cell.foodNameLabel.text = "\(product.name) \(product.price)$"
                return cell
    
            case .tool:
    
                let cell = tableView.dequeueReusableCell(withIdentifier: product.type.getReuseIdentifier()) as! ToolCell
                cell.productLabel.text = "\(product.name) \(product.price)$"
                return cell
            }
            
        }
    
    func heightForCell(in tableView:UITableView, with product:Product) -> CGFloat{
        
        switch  self {
        case .electronic:
            return 100
        case .food:
            return 200
        case .tool:
            return 300
        }
    }
}
