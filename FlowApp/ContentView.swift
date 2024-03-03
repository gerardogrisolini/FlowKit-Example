//
//  ContentView.swift
//  FlowApp
//
//  Created by Gerardo Grisolini on 09/01/24.
//

import SwiftUI
import FlowShared

struct ContentView: View {
    @Injected var navigation: NavigationProtocol

    var body: some View {
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

                Button(action: { navigate(route: .example) }) {
                    VStack(spacing: 4) {
                        Text("SwiftUI").font(.caption2)
                        Image(systemName: "list.bullet.rectangle")
                    }
                    .foregroundColor(.offWhite)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(DarkButtonStyle())

                Button(action: { navigate(route: .exampleUIKit) }) {
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
        .edgesIgnoringSafeArea(.all)
    }

    private func navigate(route: Routes) {
        Task {
            do {
                let model = try await navigation.flow(route: route).start()
                print(model)
            } catch {
                navigation.present(view: ErrorView(error: "\(error)"))
            }
        }
    }
}

#Preview {
    ContentView()
}
