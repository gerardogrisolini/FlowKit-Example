//
//  ExampleFlow.swift
//
//
//  Created by Gerardo Grisolini on 03/02/23.
//

import FlowShared
import FlowNetwork

// Your flow must implement FlowProtocol.
public final class ExampleFlow: FlowProtocol {

    // The route variable is mandatory and must be an enum that implements Routable.
    public static var route: ExampleRoutes = .example

    // The model variable is mandatory, it is an object that implements InOutProtocol 
    // and is the return value you have at the closure or completion of the flow.
    public var model = InOutModel()

    // The node variable is mandatory and represents the root node of your flow.
    // You can use the builder to construct your flow declaratively.
    // For each defined navigation event, you must reconnect the corresponding node or flow.
    // This way the builder will automatically build your flow.
    public let node = Page1View.node {
        $0.page2 ~ Page2View.node {
            $0.page3 ~ Page3View.node
            $0.page4 ~ Page4View.node {
                $0.page5 ~ Page5View.node
            }
            $0.uikit(InOutEmpty()) ~ Routes.exampleUIKit
        }
        $0.page5 ~ Page5View.node
    }

    public init() { }
}

extension ExampleFlow {

    // The onStart function is optional and is called when the flow starts.
    // You can use it to carry out checks before the flow starts, to manage settings or more.
    public func onStart(model: some InOutProtocol) async throws -> any InOutProtocol {
        let networkService = NetworkService()
        let user = try await networkService.getUserInfo()
        guard user.isAdmin else {
            throw FlowError.generic
        }
        return model
    }
}

/*
extension ExampleFlow {

    // The behavior variable is optional and customizes the behavior of your flow.
    // You can use the builder to build your behavior declaratively.
    public var behavior: FlowBehavior {
        .init {
            // With Localizables you can replace localized keys with the ones you want to use in your flow.
            Localizables {
                ExampleKeys.page1 ~ ExampleKeys.page5
                ExampleKeys.page2 ~ ExampleKeys.page4
                ExampleKeys.page4 ~ ExampleKeys.page2
                ExampleKeys.page5 ~ ExampleKeys.page1
            }
            // With Outs you can set the functions to be performed between the navigation of one node and another.
            Outs {
                Page2View.Out.page3 ~ runOut
            }
            // With Events you can set the functions to be performed in the flow instead of on the page.
            Events {
                Page2View.Event.update(Date()) ~ runEvent
            }
        }
    }

    // Out type function that is executed between the navigation of one node and another.
    private func runOut(_ out: any InOutProtocol) async throws -> Results {
        do {
            let num = Int.random(in: 0..<5)
            switch num {
            case 0: throw FlowError.generic
            case 1: throw FlowError.invalidModel(String(describing: model))
            default: break
            }
        } catch FlowError.generic {
            return .node(Page5View.node, model)
        } catch {
            throw error
        }

        return .model(model)
    }

    // Event type function that is executed in the flow instead of on the page.
    private func runEvent(_ event: any FlowEventProtocol) async throws -> any InOutProtocol {
        InOutEmpty()
    }
}
*/
