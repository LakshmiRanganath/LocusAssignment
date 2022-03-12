//
//  ImageExtensions.swift
//  Locus
//
//  Created by Lakshmi H R on 11/03/22.
//

import Foundation
import UIKit

//LRU cache with capacity 5 is initialised
let imageCache = LRUCache<String, Any>(Constants.maxLRUCacheSize)

class CacheImageView : UIImageView{
    //This is used  to cross check with urlstring before loading into imageview, to avoid mismatch of images on scroll etc...
    var imageUrlString  = String()
    
    func loadImageViewWithUrlString(urlString : String){
        imageUrlString = urlString
        let url = URL(string: urlString)
        image = nil
        
        //Check if the image with urlstring is present in cache, if present fetch from cache else, fetch image from urlString and save in lrucache
        if imageCache.isValid(key: urlString){
            self.image = imageCache.get(urlString) as? UIImage
            return
        }
        
        URLSession.shared.dataTask(with: url!){(data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? Constants.imageFetchErrorFromUrl)
                return
            }
            if data == nil{
                print(Constants.noDataFoundError)
                return
            }
            guard let imageToCache = UIImage(data: data!) else{
                print(Constants.imageFetchErrorFromUrl + urlString)
                return
            }
            imageCache.put(urlString, imageToCache)
        
            DispatchQueue.main.async {[weak self] in
                if self?.imageUrlString == urlString{
                    self?.image = imageToCache
                }
            }
        }.resume()
        
        
    }
}

