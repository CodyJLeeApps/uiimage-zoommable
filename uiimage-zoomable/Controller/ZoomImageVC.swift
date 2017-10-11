//
//  ViewController.swift
//  uiimage-zoomable
//
//  Created by Lee, Cody J. on 10/10/17.
//  Copyright © 2017 BGEA. All rights reserved.
//

import UIKit

class ZoomImageVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var zoomUIImage: UIImageView!
    var passedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        scrollView.delegate = self
        zoomUIImage.image = passedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return zoomUIImage
    }

}

