//
//  ProductListCell.swift
//  SwiftApiMVVM
//
//  Created by My Mac Mini on 08/01/24.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
     
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDesc: UILabel!
    
    @IBOutlet weak var lblCategory: UILabel!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
     
    @IBOutlet weak var btnRate: UIButton!
    
    var product : Product?{
        didSet{
            configureProductDetails()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 15
        imgProduct.layer.cornerRadius = 15
        bgView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  
    }
    
    
     func configureProductDetails(){
        
        guard let product else { return }
         
        lblTitle.text = product.title
        lblCategory.text = product.category
        lblPrice.text = "$ \(product.price)"
        lblDesc.text = product.description
        btnRate.setTitle(String(product.rating.rate), for: .normal)
         imgProduct.setImage(with: product.image)
    }
    
}
