//
//  LabelContrastViewController.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 01/02/23.
//

import UIKit

class LabelContrastViewController: UIViewController {
   
    let labelContrastView = LabelContrastView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
   
    private func setupUI() {
        view.addSubview(labelContrastView)
        labelContrastView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelContrastView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelContrastView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelContrastView.widthAnchor.constraint(equalToConstant: view.frame.width),
            labelContrastView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
    }
   
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
