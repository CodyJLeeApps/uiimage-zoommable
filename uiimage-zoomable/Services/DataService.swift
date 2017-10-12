//
//  DataService.swift
//  uiimage-zoomable
//
//  Created by Lee, Cody J. on 10/11/17.
//  Copyright © 2017 BGEA. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService() // singleton
    
    private let images = [
        TestImage(image: "ice-mountain.png"),
        TestImage(image: "mountain.png"),
        TestImage(image: "prairie.png"),
        TestImage(image: "sky.png"),
        TestImage(image: "waterfall-bridge.png")
    ]
    
    private let imageURLs = [
        URL(string: "https://ae01.alicdn.com/kf/HTB1wNilQFXXXXaXXVXXq6xXFXXX3/SHENGYONGBAO-Vinyl-Photography-Backdrops-font-b-Nature-b-font-font-b-scene-b-font-theme-Prop.jpg"),
        URL(string: "https://i.ytimg.com/vi/vtqfnp4sWhU/maxresdefault.jpg"),
        URL(string: "https://images.unsplash.com/photo-1495100793874-7f94aecae1fb?dpr=1&auto=compress,format&fit=crop&w=1950&h=&q=80&cs=tinysrgb&crop="),
        URL(string: "https://images.unsplash.com/photo-1500335340127-8900b7080b2a?dpr=1&auto=compress,format&fit=crop&w=1950&h=&q=80&cs=tinysrgb&crop="),
        URL(string: "https://images.unsplash.com/photo-1496309732348-3627f3f040ee?dpr=1&auto=compress,format&fit=crop&w=1950&h=&q=80&cs=tinysrgb&crop="),
        URL(string: "https://images.unsplash.com/photo-1478479405421-ce83c92fb3ba?dpr=1&auto=compress,format&fit=crop&w=2134&h=&q=80&cs=tinysrgb&crop=")
    ]
    
    func getImages() -> [TestImage] {
        return images
    }
    
    func getImageURLs() -> [URL?] {
        return imageURLs
    }
    
}
