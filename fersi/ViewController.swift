//
//  ViewController.swift
//  fersi
//
//  Created by Ricardo Romero on 3/21/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import UIKit
import Firebase
import Nuke

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //initProducts()
        self.products = []
        db = Firestore.firestore()
        db.collection("products").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    self.products.append(
                        Product(
                            id: document.documentID,
                            name: document.data()["name"] as! String,
                            description: document.data()["description"] as! String,
                            price: document.data()["price"] as! Double,
                            images: document.data()["images"] as! Array<String>
                        )
                    )
                }
                self.tableView.reloadData()
            }
        }
    }



}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCellTableViewCell
        Storage.storage().reference(withPath: "products").child(products[indexPath.row].images[0]).downloadURL { (url, err) in
            
            let options = ImageLoadingOptions(
                contentModes: .init(
                    success: .scaleAspectFill,
                    failure: .center,
                    placeholder: .center
                )
            )
            
            Nuke.loadImage(with: url!, options:options, into: cell.ivPicture)
        }
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
