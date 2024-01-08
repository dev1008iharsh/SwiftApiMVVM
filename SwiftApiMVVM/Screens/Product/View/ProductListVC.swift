//
//  ProductListVC.swift
//  SwiftApiMVVM
//
//  Created by My Mac Mini on 08/01/24.
//

import UIKit

class ProductListVC: UIViewController {
    
    @IBOutlet weak var tblProductList: UITableView!
    
    private var viewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
     
}
extension ProductListVC{
    
    // this is work like viewDidLoad
    func configuration(){
        tblProductList.register(UINib(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                print("data loading")
            case .stopLoading:
                print("loading finished")
                
            case .dataLoaded:
                print(viewModel.products)
                DispatchQueue.main.async {
                    self.tblProductList.reloadData()
                }
                
            case .network(let error):
                print(error ?? "Error at ObserEvnt")
            }
            
        }
    }
}


extension ProductListVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as? ProductListCell else {
            return UITableViewCell()
        }
        
        cell.product = viewModel.products.reversed()[indexPath.row]
        //cell.configureProductDetails() I used Did set property, we can also use this
         
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}
