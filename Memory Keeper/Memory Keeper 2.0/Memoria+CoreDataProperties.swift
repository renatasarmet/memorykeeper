//
//  Memoria+CoreDataProperties.swift
//  Memory Keeper 2.0
//
//  Created by Student on 8/18/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Memoria {

    @NSManaged var data: String?
    @NSManaged var descricao: String?
    @NSManaged var hora: String?
    @NSManaged var imagem: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var local: String?
    @NSManaged var longitude: NSNumber?
    @NSManaged var titulo: String?

}
