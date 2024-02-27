//
//  InOutModel.swift
//  
//
//  Created by Gerardo Grisolini on 02/04/23.
//

import Foundation
import FlowShared

@Observable
public class InOutModel: InOutProtocol {
    public var time: String = Date().description
    public required init() {}
    public convenience init(time: String) {
        self.init()
        self.time = time
    }
}
