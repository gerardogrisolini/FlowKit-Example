//
//  UIKitView3.swift
//  Flow
//
//  Created by Gerardo Grisolini on 07/08/23.
//

import UIKit
import FlowShared

@FlowView(InOutEmpty.self)
final class UIKitView3: UIKitBaseView, FlowViewProtocol {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init?(coder: NSCoder, model: InOutEmpty) {
        self.model = model
        super.init(coder: coder)
    }

    static func factory(model: some InOutProtocol) async throws -> Self {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: .module)
        let vc = storyboard.instantiateViewController(identifier: "UIKitView3") { coder in
            UIKitView3(coder: coder, model: model as! InOutEmpty)
        }
        vc.title = "Page 3"
        return vc as! Self
    }
    
    @IBAction func commitAction(_ sender: Any) {
        let callBack = { [weak self] in
            self?.commit(InOutModel(info: "Committed information from UIKit")) ?? ()
        }
        let view = CommitView.factory(callBack: callBack)
        present(.sheet(view))
    }
}

final class CommitView: UIViewController {
    let callBack: () -> Void

    init?(coder: NSCoder, callBack: @escaping () -> Void) {
        self.callBack = callBack
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static func factory(callBack: @escaping () -> Void) -> Self {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: .module)
        let vc = storyboard.instantiateViewController(identifier: "CommitView") { coder in
            CommitView(coder: coder, callBack: callBack)
        }
        return vc as! Self
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func commitAction(_ sender: Any) {
        callBack()
        dismiss(animated: true)
    }
}

