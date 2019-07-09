//
//  Factura.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/3/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import Foundation


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


enum ProductType{
    case tools
    case electronic
    case food
}
