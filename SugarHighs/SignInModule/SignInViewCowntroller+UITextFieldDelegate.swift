//
//  SignInViewCowntroller+UITextFieldDelegate.swift
//  SugarHighs
//
//  Created by Mark Golubev on 24/04/2023.
//

import UIKit

extension SignInViewController: UITextFieldDelegate {
    
    func setupTextField() {
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
        self.loginTextField.returnKeyType = .next
        self.passwordTextField.returnKeyType = .done
    }
    
    func closeKeyboard() {
        self.passwordTextField.endEditing(true)
        self.loginTextField.endEditing(true)
    }
    
    // handle return button at user keybord
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.loginTextField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.passwordTextField.endEditing(true)
            
        }
        return true
    }

    
    // validate input by emty string
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != "" {
//            return true
//        } else {
//            textField.placeholder = "Type the city"
//            return false
//        }
//    }
    
    // clear the text when user end edeting
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        // here I will be search weather by textField.text
//        if let city = textField.text {
//
//        }
//
//        textField.text = ""
//        textField.placeholder = "Search"
//    }
}
