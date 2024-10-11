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
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "movieclapper")
                        .padding(-8).foregroundColor(.button)
                    Text("Movie.me")
                }.font(.largeTitle).padding(.top, 20)
                HStack {
                    
                    ZStack {
                        TextField("  Pesquise seu filme", text: $movieWritten)
                            .font(.system(size: 25))
                            .frame(height: 50)
                            .background(.findField)
                        
                        Button("🔍") {
                            movieQuery = movieWritten
                            movieQuery = movieQuery.replacingOccurrences(of: " ", with: "+")
                            viewModel.fetch(nome: movieQuery)
                        }.padding(.leading, 300)
                    }
                }
                .padding([.leading, .trailing], 20)
                ScrollView {
                    ZStack {
                        Color.white
                        VStack {
                            ForEach(viewModel.ranks, id: \.self) { r in
                                HStack {
                                    Text(r.title).font(.subheadline).padding(.leading, 20)
                                    Spacer()
                                    AsyncImage(url: URL(string: r.poster)) { Image in
                                        Image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100)
                                            .padding()
                                            
                                            
                                    } placeholder: {
                                        Rectangle()
                                            .frame(width: 500)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear() {
            viewModel.fetch(nome: "Car")
        }
    }
}

#Preview {
    ContentView()
}
