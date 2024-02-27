//
//  GenericErrorView.swift
//  
//
//  Created by Gerardo Grisolini on 13/09/23.
//

import UIKit
import FlowKit
import FlowShared


class GenericErrorView: UIViewController, Presentable {
    var number: Int = 0
    
    init(number: Int) {
        self.number = number
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onDismiss() {
        dismiss()
    }
    
    override func viewDidLoad() {
        setupView()
    }
    
    private func setupView() {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0
        
        let label = UILabel(frame: .zero)
        label.text = "Error"
        label.backgroundColor = .red
        label.textColor = .white
        stackView.addArrangedSubview(label)

        let value = UILabel()
        value.text = number.description
        value.backgroundColor = .yellow
        stackView.addArrangedSubview(value)
        
        stackView.addArrangedSubview(UIView.spacer)

        let button = UIButton(type: .roundedRect)
		button.setTitle("Ok", for: .normal)
        button.addTarget(self, action: #selector(onDismiss), for: .touchUpInside)
        stackView.addArrangedSubview(button)

        view.addSubview(stackView)
        view.backgroundColor = .cyan

        stackView.anchoringTo(boundsOf: view, top: 48, bottom: -48)
    }
}
