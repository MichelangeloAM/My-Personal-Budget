//
//  LoginViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var erroreLogin: UILabel!
    
    @IBAction func bottoneLogin(_ sender: UIButton) {
        
        // Uso binding opzionale per evitare errori con i valori
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error { // Uso ancora optional binding
                    self.erroreLogin.text = e.localizedDescription
                } else {
                    // Naviga alla pagina successiva qui
                    self.performSegue(withIdentifier: "loginAWelcome", sender:self)
                }
            }
        }
    }
}
