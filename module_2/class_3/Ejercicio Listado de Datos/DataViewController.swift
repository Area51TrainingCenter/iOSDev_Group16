//
//  DataViewController.swift
//  Ejercicio Listado de Datos
//
//  Created by Macbook Pro on 3/2/17.
//  Copyright © 2017 Area 51. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    var dataObject: Item!

    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblNombre.text = dataObject.nombre
        lblPrecio.text = "S/. \(dataObject.precio!)"
        imgItem.image = dataObject.imagen
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

