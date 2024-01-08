//
//  UIImageView+Extensions.swift
//  SwiftApiMVVM
//
//  Created by My Mac Mini on 08/01/24.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView{
    
    func setImage(with urlString : String){
        
        guard let url = URL(string: urlString) else { return }
        
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        
        self.kf.indicatorType = .activity
        
        self.kf.setImage(with : resource)
        
    }
}
