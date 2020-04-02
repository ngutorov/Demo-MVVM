//
//  UIImageView+ThumbImage.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/26/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func setImage(withImageId imageId: String, placeholderImage: UIImage) {
        
        let baseURL = Domain.assest
        let urlString = String(format: "%@%@", baseURL, imageId)
        
        cacheImage(urlString: urlString, placeholder: placeholderImage)
    }
    
    func cacheImage(urlString: String, placeholder: UIImage) {
        
        self.showActivityIndicator()
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            self.hideActivityIndicator()
            return
        }
        
        let urlwithPercent = urlString.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        var urlRequest = URLRequest(url: URL(string: urlwithPercent!)!)
        
        urlRequest.setValue(ContentType.ENUS.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptLangauge.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        self.image = placeholder
        
        URLSession.shared.dataTask(with: urlRequest) {data, _, _ in
            if data != nil {
                
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    if imageToCache != nil {
                        imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                        self.image = imageToCache
                    }
                    self.hideActivityIndicator()
                }
            }
        }.resume()
    }
}
