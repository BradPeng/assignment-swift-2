//
//  EnlargedImageViewController.swift
//  Challenge_2_iOS
//
//  Created by Jason on 2020-06-11.
//  Copyright © 2020 Game of Apps. All rights reserved.
//

import UIKit

class EnlargedImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //stores variables passed on from previous screen (HomePageViewController)
    var image = UIImage() //stores image file
    var imageTitle = String() //stores name of image to be displayed as viewController title
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        self.title = imageTitle
    }
    
    
}
