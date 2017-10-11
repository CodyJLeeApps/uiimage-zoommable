//
//  ImageCollectionViewVC.swift
//  uiimage-zoomable
//
//  Created by Lee, Cody J. on 10/11/17.
//  Copyright © 2017 BGEA. All rights reserved.
//

import UIKit

class ImageCollectionViewVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // ********** @IBOutlets **********
    @IBOutlet weak var testImageCollectionView: UICollectionView!
    
    private(set) public var images = [TestImage]()
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testImageCollectionView.dataSource  = self
        testImageCollectionView.delegate    = self
        
        initImageLibrary()
    }
    
    // ********** @IBActions **********
    
    
    // ********** Custom Methods **********
    func initImageLibrary() {
        images = DataService.instance.getImages()
    }
    
    // ********** Swift Methods **********
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ZoomImageVC" {
            guard let zoomImageVC = segue.destination as? ZoomImageVC else {return}
            zoomImageVC.passedImage = selectedImage
        } else {
            
        }
    }
    
    // UICollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = testImageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageLibraryCell", for: indexPath) as? TestImageLibraryCollectionViewCell {
            let image = images[indexPath.row]
            cell.updateView(testImage: image)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let testImage = images[indexPath.row]
        selectedImage = UIImage(named: testImage.image)!
        performSegue(withIdentifier: "ZoomImageVC", sender: self)
    }
    
    
}
