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
    private(set) public var imageURLs = [URL?]()
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testImageCollectionView.dataSource  = self
        testImageCollectionView.delegate    = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initImageLibrary()
    }
    
    // ********** @IBActions **********
    
    
    // ********** Custom Methods **********
    func initImageLibrary() {
        imageURLs = DataService.instance.getImageURLs()
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
        //return images.count
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = testImageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageLibraryCell", for: indexPath) as? TestImageLibraryCollectionViewCell {
            let imageURL = imageURLs[indexPath.row]
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: imageURL)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? TestImageLibraryCollectionViewCell
        selectedImage = cell?.imageView.image
        performSegue(withIdentifier: "ZoomImageVC", sender: self)
    }
    
    
}

/*
extension ImageCollectionViewVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemsPerRow = 1
        let deviceName = utsname().machine
        
        return CGSize(width: 5, height: 5)
    }
}
*/
