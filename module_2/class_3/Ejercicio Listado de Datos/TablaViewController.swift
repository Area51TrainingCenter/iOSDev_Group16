//
//  TablaViewController.swift
//  Ejercicio Listado de Datos
//
//  Created by Macbook Pro on 3/2/17.
//  Copyright © 2017 Area 51. All rights reserved.
//

import UIKit

class TablaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items = Array<Item>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in 0...7 {
            let item = Item()
            
            item.nombre = "Item \(i)"
            item.precio = 10.00 * Float(i)
            item.imagen = UIImage(named: "image_\(i)")
            
            items.append(item)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "celdaTabla", for: indexPath) as! TablaCell
        
        let item = items[indexPath.row]
        
        cell.lblNombre.text = item.nombre
        cell.lblPrecio.text = "S/. \(item.precio!)"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
