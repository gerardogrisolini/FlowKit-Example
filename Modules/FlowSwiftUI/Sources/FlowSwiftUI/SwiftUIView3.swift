//
//  SwiftUIView3.swift
//  FlowSwiftUI
//
//  Created by Gerardo Grisolini on 10/11/24.
//

import SwiftUI
import FlowShared

@FlowView(InOutEmpty.self)
struct SwiftUIView3: View, FlowViewProtocol {
    var body: some View {
        VStack {
            Button(FlowSharedKeys.commit.localized) {
                commit()
            }
            .buttonStyle(.plain)
        }
        .navigationTitle(FlowSharedKeys.page3.localized)
        .backgroundShared()
    }

    func commit() {
        let callBack = { commit(InOutModel(info: "Committed information")) }
        present(CommitView(callBack: callBack))
    }
}

struct CommitView: View, Presentable {
    let callBack: () -> Void

    var body: some View {
        VStack {
            Text(FlowSharedKeys.commitInfo.localized)
            Spacer()
            HStack(spacing: 50) {
                Button(FlowSharedKeys.cancel.localized) {
                    dismiss()
                }
                Button(FlowSharedKeys.commit.localized) {
                    dismiss()
                    callBack()
                }
            }
        }
        .padding(.top, 50)
        .padding(.horizontal, 50)
    }
}

#Preview(traits: .navEmbedded) {
    SwiftUIView3().preview()
}
