//
//  HomePageTableViewCell.swift
//  Challenge_2_iOS
//
//  Created by Jason on 2020-06-11.
//  Copyright © 2020 Game of Apps. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                cellImage.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                cellImage.addConstraint(aspectConstraint!)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }
    
    //set imageview constraits to match aspect ratio of source image
    func setCustomImage(image : UIImage) {
        
        let aspect = image.size.width / image.size.height
        
        let constraint = NSLayoutConstraint(item: cellImage as Any, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: cellImage, attribute: NSLayoutConstraint.Attribute.height, multiplier: aspect, constant: 0.0)
        constraint.priority = UILayoutPriority(rawValue: 999)
        
        aspectConstraint = constraint
        
        cellImage.image = image
    }
    
}
