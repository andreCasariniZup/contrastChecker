//
//  ConstrastCheckerView.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 30/01/23.
//

import Foundation
import UIKit

class ButtonContrastCheckerView: UIView {
    
    private let redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Red", for: .normal)
        return button
    }()
    
    private let greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Green", for: .normal)
        return button
    }()
    
    private let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Blue", for: .normal)
        return button
    }()
    
    weak var delegate: ContrastCheckerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        redButton.addTarget(self, action: #selector(checkContrast(sender:)), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(checkContrast(sender:)), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(checkContrast(sender:)), for: .touchUpInside)
    }
    
    @objc private func checkContrast(sender: UIButton) {
        delegate?.checkContrast(sender: sender)
    }
    
}

protocol ContrastCheckerViewDelegate: class {
    func checkContrast(sender: UIButton)
}

