//
//  ViewController.swift
//  Less7HW
//

//

import UIKit

class YellowImagePreviewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imageDownloader = ImageDownloaderBasedOnProtocol()
    
    var imageUrls: [String] = []
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

    func setupInitialState() {
        let dataProvider = DataProvider()
        imageUrls = dataProvider.loadImageUrls()
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        loadImageForCurrentIndex()
        increaseImageIndex()
    }
    
    @IBAction func previousButtonAction(_ sender: UIButton) {
        loadImageForCurrentIndex()
        decreaseImageIndex()
    }
}

extension YellowImagePreviewViewController {
    
    func loadImageForCurrentIndex() {
        let urlString = imageUrls[imageIndex]
        imageDownloader.downloadImageData(for: urlString)
    }
    
    func increaseImageIndex() {
        imageIndex += 1
        if imageIndex > imageUrls.count - 1 {
            imageIndex = 0
        }
    }
    
    func decreaseImageIndex() {
        imageIndex -= 1
        if imageIndex < 0 {
            imageIndex = imageUrls.count - 1
        }
    }
}
