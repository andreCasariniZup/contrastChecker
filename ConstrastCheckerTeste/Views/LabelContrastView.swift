//
//  LabelContrastView.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 01/02/23.
//

import UIKit

class LabelContrastView: UIView {
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()

    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Label 1"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Label 2"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    private let label3: UILabel = {
        let label = UILabel()
        label.text = "Label 3"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

    private func setUpView() {
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(label1)
        labelsStackView.addArrangedSubview(label2)
        labelsStackView.addArrangedSubview(label3)

        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
