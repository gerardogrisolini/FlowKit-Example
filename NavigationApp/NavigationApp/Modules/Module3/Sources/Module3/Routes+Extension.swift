//
//  Routes+Extension.swift
//  Module3
//
//  Created by Gerardo Grisolini on 05/02/25.
//

import Shared

extension Routes {

    @FlowCases
    enum Module3 {
        case one
        case two(InOutModel)
    }
}

extension Routes.Module3: Routable {

    var view: RouteView? {
        switch self {
        case .one:
            return Module3OneView()
        case .two(let model):
            return Module3TwoView(model: model)
        }
    }
}
