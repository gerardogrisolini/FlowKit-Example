// The Swift Programming Language
// https://docs.swift.org/swift-book

public protocol FlowNetworkProtocol {
	var exampleRepository: ExampleRepositoryProtocol { get }
}

public class FlowNetwork: FlowNetworkProtocol {
    public lazy var exampleRepository: ExampleRepositoryProtocol = ExampleRepository()
	public init() { }
}
