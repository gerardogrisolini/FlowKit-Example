//
//  ContentView.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 09/01/24.
//

import SwiftUI
import FlowShared

@FlowView(InOutEmpty.self)
public struct ContentView: View, FlowViewProtocol {
    @FlowCases
    public enum Out: FlowOutProtocol {
        case example(InOutModel)
        case exampleUIKit
    }

    public var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)

            VStack(spacing: 48) {
                Image(systemName: "tortoise")
                    .foregroundColor(.offWhite)
                    .imageScale(.large)
                Text("FlowApp").font(.title)
                    .foregroundColor(.offWhite)
                    .fontWeight(.ultraLight)

                Spacer()

                Button(action: { out(.example(InOutModel())) }) {
                    VStack(spacing: 4) {
                        Text("SwiftUI").font(.caption2)
                        Image(systemName: "list.bullet.rectangle")
                    }
                    .foregroundColor(.offWhite)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(DarkButtonStyle())

                Button(action: { out(.exampleUIKit) }) {
                    VStack(spacing: 4) {
                        Text("UIKit").font(.caption2)
                        Image(systemName: "lines.measurement.horizontal")
                    }
                    .foregroundColor(.offWhite)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(DarkButtonStyle())

                Spacer()
            }
            .padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
        }
#if os(iOS)
        .navigationBarHidden(false)
#endif
        .edgesIgnoringSafeArea(.all)
    }

    public func onCommit(model: some InOutProtocol) async {
        print("onCommit: \(model)")
    }
}

#Preview {
    ContentView()
}
