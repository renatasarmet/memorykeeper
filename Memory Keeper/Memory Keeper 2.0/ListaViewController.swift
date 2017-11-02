//
//  MusicViewController.swift
//  IGeaoMusic
//
//  Created by Student on 8/8/16.
//  Copyright © 2016 Jean - UFSCar. All rights reserved.
//

import UIKit


class ListaViewController : UITableViewController{
    
    var lista: [Memoria]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        self.lista = MemoriaDAO.buscarTodos()
    
        return self.lista.count
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
           
            let memoria = lista[indexPath.row]
             lista.removeAtIndex(indexPath.row)
            MemoriaDAO.deletar(memoria)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listaIdentifier", forIndexPath: indexPath) as! ListaTableViewCell
        
        
        cell.listaTitulo.text = self.lista[indexPath.row].titulo
        cell.listaData.text = self.lista[indexPath.row].data
        
    
        return cell
    }

    
    
    
    override func viewWillAppear(animated: Bool) {
        self.lista = MemoriaDAO.buscarTodos()

        self.tableView.reloadData()
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "memoriaDetailSegue"
        {
            if let novaView = segue.destinationViewController as? MemoriaViewController
            {
                let item = self.lista[(self.tableView.indexPathForSelectedRow?.row)!]
                print(item.descricao)
                print(item.titulo)
                novaView.memoria = item
                
            }
            
        }
    }
    
    
    

    
    
}

