//
//  TablaCell.swift
//  Ejercicio Listado de Datos
//
//  Created by Macbook Pro on 3/2/17.
//  Copyright © 2017 Area 51. All rights reserved.
//

import UIKit

class TablaCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
