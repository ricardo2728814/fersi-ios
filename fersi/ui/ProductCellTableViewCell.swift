//
//  ProductCellTableViewCell.swift
//  fersi
//
//  Created by Ricardo Romero on 3/21/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import UIKit

class ProductCellTableViewCell: UITableViewCell {
    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    func set(product: Product) {
        labelName.text = product.name
        labelPrice.text = String(format: "%f", product.price)
    }
}
