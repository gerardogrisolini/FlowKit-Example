//
//  DataFlow.swift
//  FlowData
//
//  Created by Gerardo Grisolini on 21/09/24.
//

import FlowShared

@Flow(InOutEmpty.self, route: Routes.data)
public final class DataFlow: FlowProtocol {
    public let node = DataListView.node {
        $0.detail ~ DataDetail.node
    }
}

//@Flow(ItemModel.self, route: Routes.item(ItemModel()))
//public final class DataItemFlow: FlowProtocol {
//    public let node = DataDetail.node
//}
