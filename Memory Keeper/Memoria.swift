//
//  Memoria.swift
//  Memory Keeper 2.0
//
//  Created by Student on 8/12/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Memoria: NSManagedObject {
    
     //Insert code here to add functionality to your managed object subclass
    
    convenience init() {
        // obtendo quem é o contexto de banco deste app, para fazer acesso ao banco
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // criando um objeto NSEntityDescription para informar  qual tabela esta classe vai acessar
        let entityDescription = NSEntityDescription.entityForName("Memoria", inManagedObjectContext: context)
        
        // chamando o init original da classe, e passando as informaçoes que obtivemos
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
    }
}
