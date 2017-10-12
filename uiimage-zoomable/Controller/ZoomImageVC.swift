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
        
        //zoomUIImage.image = passedImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // attemp to download image, otherwise show the image that was passed in.
        imageURL = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png")
        zoomUIImage.kf.indicatorType = .activity
        zoomUIImage.kf.setImage(with: imageURL)
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


/*
 MTAPIClient.downloadData(url: imageURL) { data, response, error in
 if let error = error {
 completion(nil, error)
 
 } else if let data = data, let image = UIImage(data: data) {
 imageCache.setObject(image, forKey: url.absoluteString as NSString)
 completion(image, nil)
 } else {
 completion(nil, NSError.generalParsingError(domain: url.absoluteString))
 }
 */
