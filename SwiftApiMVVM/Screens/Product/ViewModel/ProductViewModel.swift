//
//  ProductViewModel.swift
//  SwiftApiMVVM
//
//  Created by My Mac Mini on 08/01/24.
//

import Foundation


final class ProductViewModel{
    
    var products : [Product] = []
    
    var eventHandler : ((_ event : Event) -> Void)?
    
    func fetchProducts(){
        
        eventHandler?(.loading)
        
        ApiManager.shared.fetchProductList { [ weak self ] response in
            
            guard let self else { return }
            eventHandler?(.stopLoading)
            
            switch response{
            case .success(let productsFromApi):
                
                self.products = productsFromApi
                eventHandler?(.dataLoaded)
                
            case .failure(let error):
                
                print(error)
                eventHandler?(.network(error))
                
            }
        }
    }
}

extension ProductViewModel{
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case network(Error?)
    }

}
