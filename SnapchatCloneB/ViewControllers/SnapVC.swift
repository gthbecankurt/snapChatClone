//
//  SnapVC.swift
//  SnapchatCloneB
//
//  Created by Emirhan Cankurt on 17.02.2023.
//

import UIKit
import ImageSlideshow
import SDWebImage

class SnapVC: UIViewController {
    
    var inputArray = [KingfisherSource]()


    @IBOutlet weak var timeLeftLabel: UILabel!
    
    
    var selectedSnap : Snap?
    
    override func viewDidLoad() {
        super.viewDidLoad()	

        if let selectedA = selectedSnap {
            timeLeftLabel.text = "Time Left: \(selectedA.timeDifference)"
            print(selectedA.imageUrlArray)
            
            for image in selectedA.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: image)!)
                
                
            }
        }
        let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.9))
        imageSlideShow.backgroundColor = UIColor.white
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        imageSlideShow.pageIndicator = pageIndicator
        
        
        imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
        imageSlideShow.setImageInputs(inputArray)
        self.view.addSubview(imageSlideShow)
        self.view.bringSubviewToFront(timeLeftLabel)
        
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
