//
//  InterestViewController.swift
//  fersi
//
//  Created by Ricardo Romero on 5/11/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import UIKit

class InterestViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btSend: UIButton!
    @IBAction func onSendMessage(_ sender: Any) {
    }
    
    var product: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if product != nil {
            lblName.text = product?.name
        }
    }
    

}
