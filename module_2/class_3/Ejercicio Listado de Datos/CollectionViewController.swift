//
//  CollectionViewController.swift
//  Ejercicio Listado de Datos
//
//  Created by Macbook Pro on 3/2/17.
//  Copyright © 2017 Area 51. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaCollection", for: indexPath) as! CollectionCell
        
        let item = items[indexPath.row]
        
        cell.lblNombe.text = item.nombre
        cell.lblPrecio.text = "S/. \(item.precio!)"
        cell.imgItem.image = item.imagen
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
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
