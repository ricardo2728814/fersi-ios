//
//  ProductDetail.swift
//  fersi
//
//  Created by Ricardo Romero on 3/21/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import UIKit

class ProductDetail: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btContact: UIButton!
    @IBAction func onClickContact(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InterestViewController") as? InterestViewController
        vc?.product = product
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    var product: Product? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if product != nil {
            lblName.text = product?.name
            lblPrice.text = String(format: "Costo: $%.2f", product!.price)
        }
        
    }


}
