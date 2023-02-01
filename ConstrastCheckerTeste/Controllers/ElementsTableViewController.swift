//
//  ElementsTableViewController.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 01/02/23.
//

import UIKit

enum Screen: String, CaseIterable  {
    case buttonContrast
    case labelContrast
}

class ElementsTableViewController: UITableViewController {
   
    let elements = ["Buttons", "Labels"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationController = UINavigationController(rootViewController: self)
        UIApplication.shared.windows.first?.rootViewController = navigationController
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "elementCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Screen.allCases.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = Screen.allCases[row].rawValue
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let contrastCheckerVC = ButtonContrastCheckerViewController()
            
            navigationController?.pushViewController(contrastCheckerVC, animated: false)
        } else {
            let labelContrastVC = LabelContrastViewController()
            navigationController?.pushViewController(labelContrastVC, animated: false)
        }
    }
}
