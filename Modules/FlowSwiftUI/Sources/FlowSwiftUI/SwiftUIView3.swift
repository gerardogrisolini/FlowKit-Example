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
        }
        .navigationTitle(FlowSharedKeys.page3.localized)
        .backgroundShared()
    }

    func commit() {
        let callBack = { commit(InOutModel(info: "Committed information from SwiftUI")) }
        let view = CommitView(callBack: callBack)
        present(.sheet(view))
    }
}

struct CommitView: View {
//    @Environment(\.dismiss) var dismiss
//    @Environment(\.presentationMode) var presentationMode
    let callBack: () -> Void

    var body: some View {
        VStack {
            Text(FlowSharedKeys.commitInfo.localized)
            Spacer()
            HStack(spacing: 50) {
                Button(FlowSharedKeys.cancel.localized) {
//                    presentationMode.wrappedValue.dismiss()
                    dismiss()
                }
                Button(FlowSharedKeys.commit.localized) {
                    callBack()
//                    dismiss.callAsFunction()
                    dismiss()
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
