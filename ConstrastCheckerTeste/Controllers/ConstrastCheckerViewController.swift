//
//  ViewController.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 30/01/23.
//

import UIKit

class ButtonContrastCheckerViewController: UIViewController {
    
    var contrastCheckerView: ButtonContrastCheckerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contrastCheckerView = ButtonContrastCheckerView(frame: view.frame)
        contrastCheckerView.delegate = self
        self.title = "Button Contrast Checker"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        view.addSubview(contrastCheckerView)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetchContrast(foregroundColor: String, backgroundColor: String, completion: @escaping (ContrastChecker) -> Void) {
        let urlString = "https://webaim.org/resources/contrastchecker/?fcolor=\(foregroundColor)&bcolor=\(backgroundColor)&api"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let contrastChecker = try JSONDecoder().decode(ContrastChecker.self, from: data)
                completion(contrastChecker)
            } catch let error {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}

extension ButtonContrastCheckerViewController: ContrastCheckerViewDelegate {
    @objc func checkContrast(sender: UIButton) {
        var frontColor = String()
        var backColor = String()
        
        if let buttonColor = sender.backgroundColor {
            frontColor = sender.currentTitleColor.toHex
            backColor = buttonColor.toHex
        }
        
        fetchContrast(foregroundColor: frontColor, backgroundColor: backColor) { (contrast) in
            print("Ratio: \(contrast.ratio)")
            print("AA: \(contrast.aa)")
            print("AA Large: \(contrast.aaLarge)")
            print("AAA: \(contrast.aaa)")
            print("AAA Large: \(contrast.aaaLarge)")
        }
    }
    
    
}
