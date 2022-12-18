//
//  LoginPageModel.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    
    // Login properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Register properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    // Log status
    @AppStorage("log_status") var log_status: Bool = false
    
    // Login call
    func Login() {
        withAnimation {
            log_status = true
        }
    }
    
    func Register() {
        withAnimation {
            log_status = true
        }
    }
    
    func ForgotPassword() {
        // do action here...
    }
}
