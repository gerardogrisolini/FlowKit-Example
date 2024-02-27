//
//  UIKitPage2Controller.swift
//  Flow
//
//  Created by Gerardo Grisolini on 07/08/23.
//

import UIKit
import FlowShared

final class UIKitPage2View: UIViewController, FlowViewProtocol {
    enum Out: FlowOutProtocol {
        case page4
    }

    let model: InOutEmpty
    init(model: InOutEmpty = InOutEmpty()) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
		title = ExampleUIKitKeys.page2.localized
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0
        
        let label = UILabel(frame: .zero)
        label.text = "Completed"
        label.backgroundColor = .red
        label.textColor = .white
        stackView.addArrangedSubview(label)

        let value = UILabel()
        value.text = Date().description
        value.backgroundColor = .yellow
        stackView.addArrangedSubview(value)
        
        stackView.addArrangedSubview(UIView.spacer)

        let button = UIButton(type: .roundedRect)
		button.setTitle(ExampleUIKitKeys.page4.localized, for: .normal)
        button.addTarget(self, action: #selector(pressed(_ :)), for: .touchUpInside)
        stackView.addArrangedSubview(button)

        view.addSubview(stackView)
		stackView.anchoringTo(boundsOf: view, top: 48, bottom: -48)
    }
    
    @objc func pressed(_ sender: UIButton) {
        out(.page4)
    }
}

#if DEBUG
import SwiftUI

#Preview {
	UIKitPage2View()
		.toSwiftUI()
		.edgesIgnoringSafeArea(.all)
}
#endif

