//
//  ViewController.swift
//  TableCellApp
//
//  Created by Andy Hong on 2019-08-28.
//  Copyright © 2019 triOS College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if(cell == nil) {
            cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = mainArray[indexPath.row]
        cell?.detailTextLabel?.text = detailArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imageArray[indexPath.row])
        return cell!
    }
    
    let mainArray = ["Red purse", "Bikini", "Long skirt", "Suit" ]
    let detailArray = ["6am - 10pm", "Acme corporation", "Ideas worth sharing", "Access denied"]
    let imageArray=["icons8-red-purse-30.png", "icons8-bikini-30.png", "icons8-long-skirt-30.png", "icons8-suit-30.png"]
    let cellId = "cellId"
    
   
    
    @IBOutlet var tableData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData.delegate = self
        tableData.dataSource = self
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedItem = mainArray[indexPath.row]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: .default, handler:{action -> Void in})
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

}

