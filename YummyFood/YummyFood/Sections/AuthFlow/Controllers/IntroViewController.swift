//
//  IntroViewController.swift
//  YummyFood
//
//  Created by User on 6/25/18.
//  Copyright © 2018 ProfunsProduction. All rights reserved.
//

import UIKit

final class IntroViewController: UIViewController {
    
    @IBOutlet private var imagesScrollView: UIScrollView!
    
    private var numberOfImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeScrollViewWithImages()
    }
}

private extension IntroViewController {
    
    func initializeScrollViewWithImages() {
        
        var frame = imagesScrollView.bounds
        frame.size.width = UIScreen.main.bounds.width
        frame.size.height = UIScreen.main.bounds.height
        var num = 0
        for image in LoginIntroImages.images {
            frame.origin.x = CGFloat(num) * frame.width
            let imgView = UIImageView(frame: frame)
            imgView.image = image
            imgView.contentMode = .scaleAspectFill
            imagesScrollView.addSubview(imgView)
            num += 1
        }
        
        imagesScrollView.contentSize = CGSize(width: CGFloat(num) * frame.width, height: frame.height)
        
        initScrollingImages()
    }
    
    func changeBackGroundImage() {
        numberOfImage = (numberOfImage + 1) % LoginIntroImages.images.count
        let width = imagesScrollView.frame.width
        
        imagesScrollView.scrollRectToVisible(CGRect(x: CGFloat(numberOfImage) * width, y: 0, width: width, height: imagesScrollView.frame.height), animated: true)
        initScrollingImages()
    }
    
    func initScrollingImages() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 10) { [weak self] in
            guard let sself = self else { return }
            DispatchQueue.main.async {
                sself.changeBackGroundImage()
            }
        }
    }
}
