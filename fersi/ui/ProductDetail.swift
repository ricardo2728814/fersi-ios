//
//  ProductDetail.swift
//  fersi
//
//  Created by Ricardo Romero on 3/21/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import UIKit
import Firebase
import Nuke

class ProductDetail: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivPicture: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var tvDesc: UITextView!
    @IBOutlet weak var btContact: UIButton!
    @IBAction func onClickContact(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InterestViewController") as? InterestViewController
        vc?.product = product
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    var product: Product? = nil
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if product != nil {
            lblName.text = product?.name
            lblPrice.text = String(format: "Costo: $%.2f", product!.price)
            loadProductImage(withIndex: 0)
            tvDesc.text = product?.description
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            ivPicture.isUserInteractionEnabled = true
            ivPicture.addGestureRecognizer(tapGestureRecognizer)
        }
        
        
    }
    
    @objc
    func imageTapped(){
        currentIndex += 1
        if currentIndex >= product!.images.count {
            currentIndex = 0
        }
        loadProductImage(withIndex: currentIndex)
    }
    
    func loadProductImage(withIndex index: Int) {
        Storage.storage().reference(withPath: "products").child(product!.images[index]).downloadURL { (url, err) in
            
            let options = ImageLoadingOptions(
                contentModes: .init(
                    success: .scaleAspectFit,
                    failure: .center,
                    placeholder: .center
                )
            )
            
            Nuke.loadImage(with: url!, options:options, into: self.ivPicture)
        }
    }

}
