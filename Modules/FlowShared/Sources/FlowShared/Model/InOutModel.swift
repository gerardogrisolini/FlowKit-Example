//
//  InOutModel.swift
//  
//
//  Created by Gerardo Grisolini on 02/04/23.
//

import Foundation

@Observable
public class InOutModel: InOutProtocol, @unchecked Sendable {
    public var time: String = Date().description
    public required init() {}
    public convenience init(time: String) {
        self.init()
        self.time = time
    }
}
