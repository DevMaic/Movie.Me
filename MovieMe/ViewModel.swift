//
//  ViewModel.swift
//  MovieMe
//
//  Created by Turma02-18 on 04/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var ranks: [Search] = []
    
    func fetch(nome: String) {
        let task = URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?s=\(nome)&apikey=325db8f")!){data, _, error in
            do {
                let ranking = try JSONDecoder().decode(Filmes.self, from: data!)
                DispatchQueue.main.async {
                    self.ranks = ranking.search
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
