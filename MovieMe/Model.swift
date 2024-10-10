//
//  Model.swift
//  MovieMe
//
//  Created by Turma02-18 on 04/10/24.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filmes = try? JSONDecoder().decode(Filmes.self, from: jsonData)

import Foundation

// MARK: - Filmes
struct Filmes: Codable, Hashable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable, Hashable {
    let title, year, imdbID: String
    let type: TypeEnum?
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}

