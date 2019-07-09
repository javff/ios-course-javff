//
//  Cars.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/1/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import Foundation
import UIKit

 public class Rueda{
    
    var marca : String = ""
    
    init(marca:String) {
        self.marca = marca
    }
}

open class Cars{
    
    fileprivate var ruedas:[Rueda] = []
    private var marca:String = ""
    public var modelo:String = ""
    open var date: Date = Date()
    
    var color:UIColor = .red
    
    var serial:String = UUID.init().uuidString
    
    
   
    /// constructor basico para crear un carro
    ///
    /// - Parameters:
    ///   - ruedas: cantidad de ruedas que tendra el carro
    ///   - marca: la marca del carro
    ///   - modelo: el modelo del carro
    ///   - date: fecha de compra del carro
    public init(ruedas:[Rueda], marca:String,modelo:String,date:Date){
        self.ruedas = ruedas
        self.marca = marca
        self.modelo = modelo
        self.date = date

    }
    
    
    public func calculoDePoliza() -> Double{
        if serial.count > 100{
            return 200
        }else{
            return 300
        }
    }
    
    convenience init(cars:Cars){
        self.init(ruedas: cars.ruedas, marca: cars.marca, modelo: cars.modelo, date: cars.date)
    }
    
}


var car1 :Cars = Cars(
    ruedas: [Rueda(marca: "perili"),Rueda(marca: "adasdasd")],
    marca: "asdasdsa",
    modelo: "asdasdasd",
    date: Date()
)


var e = car1.calculoDePoliza()



class Ford: Cars{
    
    override func calculoDePoliza() -> Double {
        let genericPoliza = super.calculoDePoliza()
        return genericPoliza + (genericPoliza + 100)
    }
    
}


