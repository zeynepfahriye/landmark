//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Fahriye Zeynep Çakır on 25.08.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImage = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmakImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Bürüksel")
        landmarkNames.append("Eyfel")
        landmarkNames.append("İtalya")
        landmarkNames.append("Japonya")
        landmarkNames.append("Venedik")
        
        
        landmarkImage.append(UIImage(named: "brksl.jpeg")!)
        landmarkImage.append(UIImage(named: "eyfel.jpeg")!)
        landmarkImage.append(UIImage(named: "italya.jpeg")!)
        landmarkImage.append(UIImage(named: "japonya.jpeg")!)
        landmarkImage.append(UIImage(named: "venedik.jpeg")!)
       
        
    }
    //numberOfInSection kaç girdi olacağını soruyor
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    //ne göstereceğini soruyor burada hücre oluşturmamız gerekiyor
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    //didselect bir hücrenin bir sırası seçildiğinde ne yapacağını soruyor performseque yapacak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmakImage = landmarkImage[indexPath.row]
      performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
//preapare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkImage = chosenLandmakImage
            destinationVC.selectedLandmarkLabel = chosenLandmarkName
        }
    }
    //commit bize editingStyle verir bu da bize delete,insert gibi şeyler veriyor
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

