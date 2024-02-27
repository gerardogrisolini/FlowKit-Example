//
//  StreamingRepository.swift
//  
//
//  Created by Gerardo Grisolini on 15/12/23.
//

import Foundation

public protocol StreamingRepositoryProtocol {
	func fetchData(country: String, service: Providers, type: Types, page: Int) async -> StreamingRepository.StreamingDataDTO?
}

public class StreamingRepository: StreamingRepositoryProtocol {
	private let url = "https://streaming-availability.p.rapidapi.com/search/basic"
	private let headers = [
		"X-RapidAPI-Key": "6b792be8f9msh3c0b10f7930e6afp1fb17ajsn96f1985c1019",
		"X-RapidAPI-Host": "streaming-availability.p.rapidapi.com"
	]

	public init() { }

	public func fetchData(country: String = "it", service: Providers, type: Types = .movie, page: Int = 1) async -> StreamingDataDTO? {
		let url = "\(url)?country=\(country)&service=\(service)&type=\(type)&page=\(page)"
		debugPrint(url)
		var request = URLRequest(
			url: URL(string: url)!,
			cachePolicy: .useProtocolCachePolicy,
			timeoutInterval: 10.0
		)
		request.httpMethod = "GET"
		request.allHTTPHeaderFields = headers

		let response = try? await URLSession.shared.data(for: request)
		let httpResponse = response?.1 as? HTTPURLResponse
		debugPrint(httpResponse?.statusCode ?? "")
		if httpResponse?.statusCode == 200, let data = response?.0 {
			do {
				print(String(data: data, encoding: .utf8)!)
				return try JSONDecoder().decode(StreamingDataDTO.self, from: data)
			} catch {
				debugPrint(error)
			}
		}
		return nil
	}
}
