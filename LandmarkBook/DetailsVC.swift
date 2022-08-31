//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Fahriye Zeynep Çakır on 31.08.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var lanmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkLabel = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lanmarkLabel.text = selectedLandmarkLabel
        imageView.image = selectedLandmarkImage
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
