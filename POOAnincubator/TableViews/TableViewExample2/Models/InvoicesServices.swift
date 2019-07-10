//
//  InvoicesServices.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/8/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import Foundation



enum Result{
    case success(invoices:[Invoice])
    case error(error:String)
}

class InvoicesServices{
    
    class func getInvoices(completion:@escaping(Result) -> Void){
        
        let products1:[Product] = [
            Product(name: "reloj", price: 1000, type: .electronic),
            Product(name: "hamburguesa", price: 1000, type: .food),
            Product(name: "martillo", price: 1000, type: .tool),
            Product(name: "pc", price: 1000, type: .electronic),
            Product(name: "destornillador", price: 1000, type: .tool)
        ]
        
        let products2:[Product] = [
            Product(name: "TV", price: 2345, type: .electronic),
            Product(name: "navaja", price: 12334500,type:.tool),
        ]

        
        let invoice1 = Invoice(
            code: "asasdasd",
            amount: 1232,
            tax: 213,
            products: products1
        )
        
        let invoice2 = Invoice(
            code: "codigo3",
            amount: 1231,
            tax: 3446,
            products: products2
        )

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            completion(Result.success(invoices: [invoice1,invoice2]))
        }

      //  completion(Result.error(error: "servidor caido"))
    
    }
    
}
