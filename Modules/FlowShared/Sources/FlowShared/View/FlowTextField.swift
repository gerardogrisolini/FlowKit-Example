//
//  FlowTextField.swift
//  Shared
//
//  Created by Gerardo Grisolini on 09/10/24.
//

import SwiftUI

public protocol TextFieldValueProtocol: Equatable {
    var isEmpty: Bool { get }
    var keyboardType: UIKeyboardType { get }
    mutating func clear()
}

public struct FlowTextField<V: TextFieldValueProtocol, F: ParseableFormatStyle>: View where V == F.FormatInput, F.FormatOutput == String {
    @Environment(\.isMandatory) var isMandatory
    @Environment(\.clearButton) var clearButton
    @Environment(\.validationHandler) var validationHandler
    @State private var isValid: Bool = false
    @State private var validationMessage: String = ""

    private let title: String
    @Binding private var text: F.FormatInput
    private let keyboardType: UIKeyboardType
    private let format: F?

    public init(title: String = "", text: Binding<F.FormatInput>) where F == StringFormatStyle {
        self.title = title
        self._text = text
        self.keyboardType = text.wrappedValue.keyboardType
        self.format = nil
    }

    public init(title: String = "", text: Binding<F.FormatInput>, format: F) {
        self.title = title
        self._text = text
        self.keyboardType = text.wrappedValue.keyboardType
        self.format = format
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.placeholder, .primary)
                .offset(y: text.isEmpty && format == nil ? 0 : -26)
                .scaleEffect(text.isEmpty && format == nil ? 1 : 0.8, anchor: .leading)

            TextField("", value: $text, format: format ?? StringFormatStyle() as! F)
                .keyboardType(keyboardType)
                .onChange(of: text) { _, newValue in
                    validate(newValue)
                }
                .padding(.trailing, 10)
                .overlay(clearButtonView)

            if !isValid {
                Text(validationMessage)
                    .foregroundColor(.red)
                    .offset(y: 26)
                    .scaleEffect(0.8, anchor: .leading)
            }
        }
        .padding(.vertical, 15)
        .animation(.snappy, value: text.isEmpty)
    }

    private var clearButtonView: some View {
        HStack {
            if clearButton {
                Spacer()
                Button(action: { text.clear() }) {
                    Image(systemName: "xmark.circle.fill")
                }
            } else {
                EmptyView()
            }
        }
    }

    private func validate(_ value: V) {
        isValid = !isMandatory || !value.isEmpty
        validationMessage = isValid ? "" : "This field is mandatory"
        if isValid, let validationResult = validationHandler?() {
            switch validationResult {
            case .success:
                isValid = true
                validationMessage = ""
            case .failure(let error):
                isValid = false
                validationMessage = error.localizedDescription
            }
        }
    }
}

public enum ValidationError: LocalizedError {
    case generic(message: String)

    public var errorDescription: String? {
        switch self {
        case .generic(let message):
            return NSLocalizedString("\(message)", comment: "Message for generic validation error")
        }
    }
}

extension EnvironmentValues {
    @Entry var clearButton: Bool = false
    @Entry var isMandatory: Bool = false
    @Entry var validationHandler: (() -> Result<Void, ValidationError>)?
}

extension View {
    public func clearButton(_ value: Bool = true) -> some View {
        environment(\.clearButton, value)
    }

    public func isMandatory(_ value: Bool = true) -> some View {
        environment(\.isMandatory, value)
    }

    public func onValidate(validationHandler: @escaping () -> Result<Void, ValidationError>) -> some View {
        environment(\.validationHandler, validationHandler)
    }
}

extension Result where Success == Void {
    public static var success: Result { .success(()) }
}

public struct StringStrategy: ParseStrategy {
    public typealias ParseInput = String
    public typealias ParseOutput = String
    public func parse(_ value: String) throws -> String {
        value
    }
}

public struct StringFormatStyle: ParseableFormatStyle {
    public var parseStrategy: StringStrategy { StringStrategy() }
    public func format(_ value: String) -> String {
        value
    }
}

extension String: TextFieldValueProtocol {
    public var keyboardType: UIKeyboardType { .default }

    public mutating func clear() {
        removeAll()
    }
}

extension Decimal: TextFieldValueProtocol {
    public var keyboardType: UIKeyboardType { .decimalPad }

    public var isEmpty: Bool {
        self == 0
    }

    public mutating func clear() {
        self = 0
    }
}

#Preview(traits: .navEmbedded) {
    @Previewable @State var text: String = ""
    @Previewable @State var value: Decimal = 0
    @Previewable @State var decimal: Decimal = 0
    @Previewable @State var percent: Decimal = 0

    VStack(spacing: 30) {
        FlowTextField(title: "String", text: $text)
            .onValidate {
                text.count > 4
                ? .success
                : .failure(.generic(message: "Text is too short"))
            }
            .isMandatory()
            .clearButton()
            .autocorrectionDisabled()

        FlowTextField(title: "Currency", text: $value, format: .currency(code: "EUR"))
            .onValidate {
                value > 4
                ? .success
                : .failure(.generic(message: "Value is too low"))
            }
            .isMandatory()
            .clearButton()

        FlowTextField(title: "Decimal", text: $decimal, format: .number.precision(.fractionLength(1)))
            .onValidate {
                value < 10
                ? .success
                : .failure(.generic(message: "Value is too big"))
            }
            .isMandatory()
            .clearButton()

        FlowTextField(title: "Percentage", text: $percent, format: .percent)
            .onValidate {
                value > 20
                ? .success
                : .failure(.generic(message: "Value is too low"))
            }
            .isMandatory()
            .clearButton()

        Spacer()
    }
    .padding(32)
    .navigationTitle("FlowTextField")
}
