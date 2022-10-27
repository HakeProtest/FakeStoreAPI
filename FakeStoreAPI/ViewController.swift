//
//  ViewController.swift
//  FakeStoreAPI
//
//  Created by Hafizh Caesandro Kevinoza on 24/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Do any additional setup after loading the view.
        let nib = UINib(nibName: "itemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "itemTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        dowloadJSON {
            print("success")
//            print(self.products)
//            print(self.products.count)
            self.tableView.reloadData()
        }
        
    }
 
    func dowloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://fakestoreapi.com/products/")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                    self.products = try JSONDecoder().decode([Product].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("failed to fetch data")
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView , cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableViewCell", for: indexPath) as! itemTableViewCell
        let product = products[indexPath.row]
        
        cell.titleLabel.text = product.title
        cell.descriptionLabel.text = product.productDescription
        cell.ratingLabel.text = String(product.rating.rate)
        cell.itemImageView.backgroundColor = .red
        print(product.title)
        print(cell)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
