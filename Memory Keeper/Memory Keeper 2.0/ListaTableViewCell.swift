//
//  ListaTableViewCell.swift
//  Memory Keeper
//
//  Created by Student on 8/16/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//

import UIKit

class ListaTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    @IBOutlet weak var listaTitulo: UILabel!
    
    
    @IBOutlet weak var listaData: UILabel!
    
    

}
