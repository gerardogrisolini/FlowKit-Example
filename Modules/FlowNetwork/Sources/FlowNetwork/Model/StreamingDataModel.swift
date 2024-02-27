//
//  StreamingDataModel.swift
//
//
//  Created by Gerardo Grisolini on 15/12/23.
//

import Foundation

public struct StreamingDataModel {
	public var results: [Result]
	public let total_pages: Int
	public init(results: [Result], total_pages: Int) {
		self.results = results
		self.total_pages = total_pages
	}
}

public struct Result {
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
	public let posterURLs: PosterURLs
	public let age: Int
	public let streamingInfo: StreamingInfo
	public let originalLanguage: String

	public var url: URL? {
		URL(string:
				streamingInfo.netflix?.it.link
			?? streamingInfo.prime?.it.link
			?? streamingInfo.disney?.it.link
			?? streamingInfo.apple?.it.link
			?? ""
		)
	}

	public init(imdbID: String, tmdbID: String, imdbRating: Int, imdbVoteCount: Int, tmdbRating: Int, backdropPath: String, originalTitle: String, genres: [Int], countries: [String], year: Int, runtime: Int, cast: [String], significants: [String], title: String, overview: String, tagline: String, video: String, posterPath: String, posterURLs: PosterURLs, age: Int, streamingInfo: StreamingInfo, originalLanguage: String) {
		self.imdbID = imdbID
		self.tmdbID = tmdbID
		self.imdbRating = imdbRating
		self.imdbVoteCount = imdbVoteCount
		self.tmdbRating = tmdbRating
		self.backdropPath = backdropPath
		self.originalTitle = originalTitle
		self.genres = genres
		self.countries = countries
		self.year = year
		self.runtime = runtime
		self.cast = cast
		self.significants = significants
		self.title = title
		self.overview = overview
		self.tagline = tagline
		self.video = video
		self.posterPath = posterPath
		self.posterURLs = posterURLs
		self.age = age
		self.streamingInfo = streamingInfo
		self.originalLanguage = originalLanguage
	}
}

public struct PosterURLs {
	public let the92, the154, the185, the342: String
	public let the500, the780, original: String

	public init(the92: String = "", the154: String = "", the185: String = "", the342: String = "", the500: String = "", the780: String = "", original: String = "") {
		self.the92 = the92
		self.the154 = the154
		self.the185 = the185
		self.the342 = the342
		self.the500 = the500
		self.the780 = the780
		self.original = original
	}
}

public enum Providers: String, Codable {
	case netflix, prime, disney, hbo, hulu, peacock, paramount, starz, showtime, apple, mubi
}

public enum Types {
	case movie, series
}

public struct StreamingLink {
	public let link: String
	public let added: Int
	public let leaving: Int

	public init(link: String, added: Int, leaving: Int) {
		self.link = link
		self.added = added
		self.leaving = leaving
	}
}

public struct StreamingInfo {
	let netflix: Streaming?
	let prime: Streaming?
	let disney: Streaming?
	let apple: Streaming?

	public init(netflix: Streaming? = nil, prime: Streaming? = nil, disney: Streaming? = nil, apple: Streaming? = nil) {
		self.netflix = netflix
		self.prime = prime
		self.disney = disney
		self.apple = apple
	}
}

public struct Streaming {
	public let it: StreamingLink

	public init(it: StreamingLink) {
		self.it = it
	}
}

public protocol Media: Identifiable {
	var id: Int { get }
	var provider: Providers { get }
	var content: StreamingDataModel { get set }
	var page: Int { get set }
}

public struct MediaGroup: Media {
	public var id: Int { provider.hashValue }
	public let provider: Providers
	public let type: Types
	public var content: StreamingDataModel
	public var page: Int = 1

	public init?(provider: Providers, type: Types, content: StreamingDataModel?) {
		guard let content = content else { return nil }

		self.provider = provider
		self.type = type
		self.content = content
	}
}

// MARK: Mapping DTO

public extension StreamingDataModel {
	init?(from dto: StreamingRepository.StreamingDataDTO?) {
		guard let dto else { return nil }
		results = dto.results.map { Result(from: $0) }
		total_pages = dto.total_pages
	}
}

extension Result {
	init(from dto: StreamingRepository.ResultDTO) {
		imdbID = dto.imdbID
		tmdbID = dto.tmdbID
		imdbRating = dto.imdbRating
		imdbVoteCount = dto.imdbVoteCount
		tmdbRating = dto.tmdbRating
		backdropPath = dto.backdropPath
		originalTitle = dto.originalTitle
		genres = dto.genres
		countries = dto.countries
		year = dto.year
		runtime = dto.runtime
		cast = dto.cast
		significants = dto.significants
		title = dto.title
		overview = dto.overview
		tagline = dto.tagline
		video = dto.video
		posterPath = dto.posterPath
		posterURLs = PosterURLs(from: dto.posterURLs)
		age = dto.age
		streamingInfo = StreamingInfo(from: dto.streamingInfo)
		originalLanguage = dto.originalLanguage
	}
}

extension PosterURLs {
	init(from dto: StreamingRepository.PosterURLsDTO) {
		the92 = dto.the92
		the154 = dto.the154
		the185 = dto.the185
		the342 = dto.the342
		the500 = dto.the500
		the780 = dto.the780
		original = dto.original
	}
}

extension StreamingLink {
	init(from dto: StreamingRepository.StreamingLinkDTO) {
		link = dto.link
		added = dto.added
		leaving = dto.leaving
	}
}

extension Streaming {
	init?(from dto: StreamingRepository.StreamingDTO?) {
		guard let dto else { return nil }
		it = StreamingLink(from: dto.it)
	}
}

extension StreamingInfo {
	init(from dto: StreamingRepository.StreamingInfoDTO) {
		netflix = Streaming(from: dto.netflix)
		prime = Streaming(from: dto.prime)
		disney = Streaming(from: dto.disney)
		apple = Streaming(from: dto.apple)
	}
}
