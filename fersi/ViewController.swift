//
//  ViewController.swift
//  fersi
//
//  Created by Ricardo Romero on 3/21/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        initProducts()
    }

    func initProducts() {
        products.append(Product(
            name: "Collar fino", description: "", price: 300, images: []
        ))
        
        products.append(Product(
            name: "Collar fino", description: "", price: 300, images: []
        ))
        
        products.append(Product(
            name: "Collar fino", description: "", price: 300, images: []
        ))
        
        products.append(Product(
            name: "Collar fino", description: "", price: 300, images: []
        ))
        
        products.append(Product(
            name: "Collar fino", description: "", price: 300, images: []
        ))
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCellTableViewCell
        cell.set(product: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcPDetails = storyboard?.instantiateViewController(withIdentifier: "ProductDetail") as? ProductDetail
        vcPDetails?.product = products[indexPath.row]
        self.navigationController?.pushViewController(vcPDetails!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}
