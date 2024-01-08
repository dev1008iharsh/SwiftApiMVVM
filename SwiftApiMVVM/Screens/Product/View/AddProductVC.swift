//
//  AddProductVC.swift
//  SwiftApiMVVM
//
//  Created by My Mac Mini on 08/01/24.
//

import UIKit
//Encode + Decodable ae banne no typealias Codeable che
struct AddProduct : Codable {
    var id : Int? = nil // aa karvathi aa param ma nahi nakhiye to pan chalse
    let title : String
}

/*
 banne mate ke j struct use karyu
struct ProductResponse : Decodable {
    let id : Int
    let title : String
}*/

class AddProductVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addProduct()
        
    }
    
 
    func addProduct(){
        
        guard let url = URL(string: "https://dummyjson.com/products/add") else { return }
        
        
        let parameters = AddProduct(title: "Harsh Darji")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
         
        // http body ae data form ma che ane apdi pase param ae model form ma che -> Model to Data Convert
        request.httpBody = try? JSONEncoder().encode(parameters)
        
        request.allHTTPHeaderFields = ["Content-Type" : "application/json"]
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            
            do{
                let productResponse = try JSONDecoder().decode(AddProduct.self, from: data)
                print(productResponse)
            }catch{
                
            }
        }.resume()
    }

}
