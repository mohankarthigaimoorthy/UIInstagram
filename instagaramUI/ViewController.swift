//
//  ViewController.swift
//  instagaramUI
//
//  Created by Mohan K on 27/02/23.
//

import UIKit
struct Model {
    var ring : String
    var text : String
    var company: String
    var image : UIImage
    
}

class ViewController: UIViewController {
    var model = [Model(ring: "mani", text: "This error occurs when the identifier name of the Tablecell is different in the Swift file and in the Storyboard.", company: "pentagon", image: UIImage(named: "img1")!), Model(ring: "mithun", text: "One more reason for this issue to happen is an earlier problem. When showing a new ViewController, instantiating the target ViewController directly will of course not load the prototype cells from the StoryBoard. ", company: "rane", image: UIImage(named: "img2")!), Model(ring: "meera", text:  "The correct solution should always be to instantiate the view controller through the story board like this:", company: "tik", image:  UIImage(named: "img3")!), Model(ring: "meenu", text: "I had the same problem. This issue worked for me. In storyboard select your table view and change it from static cells into dynamic cells.", company: "hindustan unilever", image: UIImage(named: "img4")!), Model(ring:  "mervin", text: "Make sure you binded the cell with an actual class you created, and very important, that you checked Inherit module from target", company: "zoo zoo", image: UIImage(named: "img5")!)]
  
    var type = ["Text", "Image", "Text", "Image", "Text"]
    
  
    
    @IBOutlet weak var dashBoard: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dashBoard.register(UINib.init(nibName: "textTableViewCell", bundle: .main), forCellReuseIdentifier: "textTableViewCell")
        dashBoard.register(UINib(nibName: "imageTableViewCell", bundle: .main), forCellReuseIdentifier: "imageTableViewCell")
        tableViewsetUp()
    }

    func tableViewsetUp() {
        dashBoard.dataSource = self
        dashBoard.delegate = self
        DispatchQueue.main.async {
            self.dashBoard.reloadData()
            self.dashBoard.contentInset.bottom = 100
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (type[indexPath.row] == "Text")
        {
            let cell:textTableViewCell = tableView.dequeueReusableCell(withIdentifier: "textTableViewCell", for: indexPath) as! textTableViewCell
            cell.view.layer.cornerRadius = 10
            cell.view.clipsToBounds = true
            cell.profileImg.layer.cornerRadius = 20
            cell.profileImg.clipsToBounds = true
            
            cell.selectionStyle = .none
           
            cell.text1.text = model[indexPath.row].ring
            cell.text2.text = model[indexPath.row].company
            cell.text3.text = model[indexPath.row].text
            return cell
        }
        else {
            let cells:imageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "imageTableViewCell", for: indexPath) as! imageTableViewCell
            
            cells.viewUI.layer.cornerRadius = 10
            cells.viewUI.clipsToBounds = true
            cells.profilePic.layer.cornerRadius = 20
            cells.profilePic.clipsToBounds = true
            
            cells.selectionStyle = .none
            cells.label1.text = model[indexPath.row].ring
            cells.label2.text = model[indexPath.row].company
            cells.images.image = model[indexPath.row].image
            return cells
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
}
