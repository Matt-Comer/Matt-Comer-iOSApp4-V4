//
//  LoginView.swift
//  Matt-Comer-iOSApp4
//
//  Created by matthew comer on 2026-07-18.
//

import SwiftUI

// Displays the ForgeFlow login screen.
struct LoginView:View {
    // Stores the email entered by the user.
    @State private var email=""
    // Stores the password entered by the user.
    @State private var password=""
    // Stores the login error message.
    @State private var errorMessage=""
    // Controls whether the login error alert is displayed.
    @State private var showError=false
    // Controls whether the registration screen opens.
    @State private var showRegisterView=false
    var body:some View {
        // Creates navigation for the registration screen.
        NavigationStack {
            // Creates the main ForgeFlow login screen.
            ZStack {
                // Displays the ForgeFlow black background.
                Color.black
                    .ignoresSafeArea()
                // Organizes the login screen vertically.
                VStack(spacing:23) {
                    Spacer()
                    // Displays the ForgeFlow icon.
                    Image(systemName:"hammer.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width:120,height:120)
                        .foregroundStyle(.purple)
                    // Displays the ForgeFlow title.
                    Text("ForgeFlow")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(.purple)
                    // Displays the login subtitle.
                    Text("Sign In To Continue")
                        .foregroundStyle(.white.opacity(0.70))
                    // Groups the login input fields together.
                    VStack(spacing:16) {
                        // Allows the user to enter an email address.
                        TextField("Email",text:$email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .padding()
                            .background(.white.opacity(0.10))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius:13))
                        // Allows the user to enter a password.
                        SecureField("Password",text:$password)
                            .padding()
                            .background(.white.opacity(0.10))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius:13))
                    }
                    // Signs the user into ForgeFlow.
                    Button {
                        signIn()
                    } label: {
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .frame(maxWidth:.infinity,minHeight:50,maxHeight:50)
                            .foregroundStyle(.black)
                            .background(.purple)
                            .clipShape(RoundedRectangle(cornerRadius:13))
                    }
                    // Opens the ForgeFlow registration screen.
                    Button {
                        showRegisterView=true
                    } label: {
                        Text("Create Your Account")
                            .foregroundStyle(.purple)
                    }
                    Spacer()
                }
                .padding()
            }
            // Opens the registration screen using the CookBookPro pattern.
            .navigationDestination(isPresented:$showRegisterView) {
                RegisterView()
            }
            // Displays Firebase login errors.
            .alert("Login Error",isPresented:$showError) {
                Button("OK") {
                }
            } message: {
                Text(errorMessage)
            }
        }
    }
    // Validates the information and signs the user into Firebase.
    private func signIn() {
        // Stops login when the email is empty.
        guard !email.isEmpty else {
            errorMessage="Please enter your email"
            showError=true
            return
        }
        // Stops login when the password is empty.
        guard !password.isEmpty else {
            errorMessage="Please enter your password"
            showError=true
            return
        }
        // Sends the login information through Firebase.
        AuthService.shared.signIn(
            email:email,
            password:password
        ) { result in
            DispatchQueue.main.async {
                switch result {
                // Confirms that the user signed in.
                case .success:
                    print("User signed in successfully")
                // Displays the Firebase login error.
                case .failure(let error):
                    errorMessage=error.localizedDescription
                    showError=true
                }
            }
        }
    }
}
