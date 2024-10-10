//
//  ContentView.swift
//  MovieMe
//
//  Created by Turma02-18 on 04/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var movieWritten = ""
    @State var movieQuery = ""
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack {
                HStack {
                    TextField("  Pesquise seu filme", text: $movieWritten)
                        .font(.system(size: 25))
                        .frame(height: 50)
                        .background(.gray)
                    Button("🔍") {
                        movieQuery = movieWritten
                        movieQuery = movieQuery.replacingOccurrences(of: " ", with: "+")
                        viewModel.fetch(nome: movieQuery)
                    }
                    .foregroundColor(.gray)
                }
                .padding(.top, 120)
                .padding(.bottom, -110)
                .padding([.leading, .trailing], 20)
                List {
                    VStack {
                        Color.blue
                            .ignoresSafeArea()
                        ForEach(viewModel.ranks, id: \.self) { r in
                            HStack {
                                Text(r.title)
                                Spacer()
                                AsyncImage(url: URL(string: r.poster)) { Image in
                                    Image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                } placeholder: {
                                    Rectangle()
                                        .frame(width: 100, height: 150)
                                    
                                }
                            }
                            //                        .background()
                        }
                        .listRowBackground(Color.gray)
                    }
                    .frame(height: 800)
                    .ignoresSafeArea()
                }
                .padding(.top, 130)
                .listStyle(.plain)
            }
        }
        .ignoresSafeArea()
        .onAppear() {}
    }
}

#Preview {
    ContentView()
}
