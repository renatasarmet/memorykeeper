//
//  MemoriaViewController.swift
//  Memory Keeper 2.0
//
//  Created by Student on 8/17/16.
//  Copyright © 2016 Grupo1. All rights reserved.
//

import UIKit

class Memorias{
    let memoriaTitulo: String
    let memoriaImagem: String
    let memoriaDesc: String
    let memoriaData: String
    let memoriaHora: String
    
    init(memoriaTitulo: String, memoriaImagem: String, memoriaDesc: String, memoriaData: String, memoriaHora: String){
        self.memoriaTitulo = memoriaTitulo
        self.memoriaImagem = memoriaImagem
        self.memoriaDesc = memoriaDesc
        self.memoriaData = memoriaData
        self.memoriaHora = memoriaHora
    }
}


class MemoriaViewController: UIViewController {

    @IBOutlet weak var memoriaTitulo: UILabel!
    @IBOutlet weak var memoriaImagem: UIImageView!
    @IBOutlet weak var memoriaDesc: UITextView!
    @IBOutlet weak var memoriaData: UILabel!
    @IBOutlet weak var memoriaHora: UILabel!


    var memoria: Memoria?// = Memoria()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if memoria != nil {
            self.memoriaTitulo.text = self.memoria!.titulo
            //O codigo da imagem está errado
            //self.memoriaImagem.image = self.memoria!.imagem
            self.memoriaImagem.image = UIImage(named: "Ibirapuera")
            self.memoriaDesc.text = self.memoria!.descricao
            self.memoriaData.text = self.memoria!.data
            self.memoriaHora.text = self.memoria!.hora
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
        
}
