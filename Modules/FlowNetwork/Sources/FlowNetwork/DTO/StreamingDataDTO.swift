//
//  StreamingDataDTO.swift
//
//
//  Created by Gerardo Grisolini on 16/12/23.
//

import Foundation

extension StreamingRepository {

	public struct StreamingDataDTO: Codable {
		public var results: [ResultDTO]
		public let total_pages: Int
		public init(results: [ResultDTO], total_pages: Int) {
			self.results = results
			self.total_pages = total_pages
		}
	}

	public struct ResultDTO: Codable {
		public let imdbID, tmdbID: String
		public let imdbRating, imdbVoteCount, tmdbRating: Int
		public let backdropPath: String
		public let originalTitle: String
		public let genres: [Int]
		public let countries: [String]
		public let year, runtime: Int
		public let cast, significants: [String]
		public let title, overview, tagline, video: String
		public let posterPath: String
		public let posterURLs: PosterURLsDTO
		public let age: Int
		public let streamingInfo: StreamingInfoDTO
		public let originalLanguage: String
	}

	public struct PosterURLsDTO: Codable {
		public let the92, the154, the185, the342: String
		public let the500, the780, original: String

		enum CodingKeys: String, CodingKey {
			case the92 = "92"
			case the154 = "154"
			case the185 = "185"
			case the342 = "342"
			case the500 = "500"
			case the780 = "780"
			case original
		}
	}

	public enum ProvidersDTO: String, Codable {
		case netflix, prime, disney, hbo, hulu, peacock, paramount, starz, showtime, apple, mubi
	}

	public enum TypesDTO: Codable {
		case movie, series
	}

	public struct StreamingLinkDTO: Codable {
		let link: String
		let added: Int
		let leaving: Int
	}

	public struct StreamingInfoDTO: Codable {
		let netflix: StreamingDTO?
		let prime: StreamingDTO?
		let disney: StreamingDTO?
		let apple: StreamingDTO?
	}

	public struct StreamingDTO: Codable {
		let it: StreamingLinkDTO
	}

}
