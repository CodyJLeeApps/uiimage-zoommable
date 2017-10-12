//
//  ViewController.swift
//  uiimage-zoomable
//
//  Created by Lee, Cody J. on 10/10/17.
//  Copyright © 2017 BGEA. All rights reserved.
//

import UIKit
import Kingfisher

class ZoomImageVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var zoomUIImage: UIImageView!
    var passedImage: UIImage?
    
    let imageCache = NSCache<NSString, UIImage>()
    var imageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.delegate = self
        
        zoomUIImage.image = passedImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomUIImage
    }
    
    func downloadImageFromURL(imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: imageURL.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            
            }
        }
}

