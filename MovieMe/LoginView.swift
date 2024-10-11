//
//  LoginView.swift
//  MovieMe
//
//  Created by Turma02-20 on 10/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var senha: String = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "movieclapper")
                    .padding(-8).foregroundColor(.button)
                Text("Movie.me")
            }.font(.largeTitle).padding(.top, 60)
            Text ("Acesse sua conta")
            Spacer()
            VStack {
                Text("E-mail").frame(width: 300, alignment: .leading).padding(.bottom, -5)
                TextField ("", text: $email).frame(width: 300, height: 50).background(.textField).cornerRadius(3).opacity(0.1).padding(.bottom)
                
                Text("Senha").frame(width: 300, alignment: .leading).padding(.bottom, -5)
                TextField ("", text: $senha).frame(width: 300, height: 50).background(.textField).cornerRadius(3).opacity(0.1)
            }
            Button (action: {
                
            }) {
            Text("Acessar")
                .frame(width: 300, height: 50)
                .foregroundStyle(.white)
                .background(.button)
        } .padding(30)
            Spacer()
            Button("Criar uma conta") {
                
            }.padding(.bottom, 50)
            
            
        }.ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
