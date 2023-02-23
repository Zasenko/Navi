//
//  LoginView.swift
//  Navigay
//
//  Created by Dmitry Zasenko on 16.02.23.
//

import SwiftUI
import AuthenticationServices

import LocalAuthentication


struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme

        var body: some View {
          if colorScheme.self == .dark {
              SignInButton(SignInWithAppleButton.Style.whiteOutline)
          }
          else {
              SignInButton(SignInWithAppleButton.Style.black)
          }
        }

        func SignInButton(_ type: SignInWithAppleButton.Style) -> some View{
            return SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Authorisation successful \(authResults)")
                case .failure(let error):
                    print("Authorisation failed: \(error.localizedDescription)")
                }
            }
            .frame(width: 280, height: 60, alignment: .center)
            .signInWithAppleButtonStyle(type)
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
