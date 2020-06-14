//
//  HomePageViewController.swift
//  Challenge_2_iOS
//
//  Created by Jason on 2020-06-11.
//  Copyright © 2020 Game of Apps. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    //Struct for storing information on all images
    struct imageStruct {
        var image = UIImage()
        var title = String() //Name of image
    }
    
    var imageArray = [imageStruct]() //list of all images
    
    //variables that store info about the image user tapped on, values will be passed on to EnlargedImageViewController
    var selectedImage = UIImage()
    var imageTitle = String()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1; //only one section needed for this app
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellTableViewCell") {
                return cell
            } else {
                return UITableViewCell()
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell") as? HomePageTableViewCell {
                cell.cellImage.image = imageArray[indexPath.row].image //fill cells with images from imageArray
                cell.setCustomImage(image: imageArray[indexPath.row].image) //call cell method that sets constraint for the imageview. This also adjusts the cell's size.
                return cell
            } else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //set variables to proper values before being passed on to next screen (EnlargedImageViewController)
        selectedImage = imageArray[indexPath.row].image
        imageTitle = imageArray[indexPath.row].title
        
        performSegue(withIdentifier: "homeToLargeImage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScreen = segue.destination as! EnlargedImageViewController
        
        //pass on information about the image the user tapped on to the next scene (EnlargedImageViewController)
        nextScreen.image = selectedImage
        nextScreen.imageTitle = imageTitle
    }
    
    //hide navigation bar when rotated to landscape mode, unhide when in portrait mode
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set navigation bar visuals
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.title = "Home"
        
        //define images and their properties, also add them to the imageArray
        let imageOne = imageStruct(image: #imageLiteral(resourceName: "background_PaintSplash"), title: "Paint Splash")
        imageArray.append(imageOne)
        
        let imageTwo = imageStruct(image: #imageLiteral(resourceName: "background_Spectre"), title: "The Spectre")
        imageArray.append(imageTwo)
        
        let imageThree = imageStruct(image: #imageLiteral(resourceName: "Background_Space"), title: "Space")
        imageArray.append(imageThree)
        
        let imageFour = imageStruct(image: #imageLiteral(resourceName: "background_Be_Linspired"), title: "Be Linspired")
        imageArray.append(imageFour)
        
        let imageFive = imageStruct(image: #imageLiteral(resourceName: "Background_Pastel_Leaves"), title: "Pastel Leaves")
        imageArray.append(imageFive)
        
        let imageSix = imageStruct(image: #imageLiteral(resourceName: "Background_Defocused_Christmas"), title: "Christmas Lights")
        imageArray.append(imageSix)
        
        let imageSeven = imageStruct(image: #imageLiteral(resourceName: "Background_Space_Pink"), title: "Pink Space")
        imageArray.append(imageSeven)
        
        let imageEight = imageStruct(image: #imageLiteral(resourceName: "Background_Forest_Sunset"), title: "Forest Sunset")
        imageArray.append(imageEight)
    }
    
}
