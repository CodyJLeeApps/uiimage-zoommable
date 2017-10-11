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
    
    func getImages() -> [TestImage] {
        return images
    }
    
}
