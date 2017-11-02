//
//  MemoriaDAO.swift
//  Memory Keeper 2.0
//
//  Created by Student on 8/12/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MemoriaDAO {
    
    // utilizaremos o "static" nestes métodos para poder chamá-los diretamente, sem necessidade de instantciar a classe MemoriaDAO
    static func inserir(memoria: Memoria) {
        
        // em 2 passos, estamos buscando o objeto managedObjectContext
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // preparando o banco para inserir um novo objeto
        context.insertObject(memoria)
        
        do {
            // confirmando a inclusão do novo objeto no banco
            // para o CoreData, qualquer alteração que seja feita no banco pode ser confirmada com o método save()
            try context.save()
            print("Salvooooou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func alterar() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            // estamos trabalhando com contexto, então, ao alterar um objeto que foi buscado anteriormente no banco, não precisamos especificar o objeto para salvar
            try context.save()
            print("Alterooou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func deletar(memoria: Memoria) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // informar que a operação é um "delete"
        context.deleteObject(memoria)
        
        do {
            try context.save()
            print("Deletou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    
    static func buscarTodos() -> [Memoria] {
        // obtendo AppDelegate onde esta a Core Data stack
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // obtendo o context, que utilizaremos sempre que realizarmos operações com banco
        let context = appDelegate.managedObjectContext
        
        // lista de memorias que será retornada pelo método
        var memorias: [Memoria] = []
        
        // cria a busca que faremos no banco, informando nome da tabela
        let request: NSFetchRequest = NSFetchRequest(entityName: "Memoria")
        // informa por quais campos o resultado será ordenado, e se será em ordem crescente ou decrescente
        //request.sortDescriptors = [NSSortDescriptor(key: "data", ascending: true)]
        
        // para definir critério de busca (cláusula "where"), utilize NSPredicate
        
        do {
            // obtendo memorias do banco e preenchendo o array de Memoria
            memorias = try context.executeFetchRequest(request) as! [Memoria]
            print("Total de memorias: ", memorias.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        
        return memorias
    }
    
}
