//
//  RegistratiViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 02/11/21.
//

import UIKit
import Firebase

class RegistratiViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelErrore: UILabel!
    
    
    @IBAction func bottoneRegistrati(_ sender: UIButton) {
        
        // Uso binding opzionale per evitare errori con i valori
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error { // Uso di nuovo optional binding per errore
                    self.labelErrore.text = e.localizedDescription
                } else {
                    // Naviga alla pagina successiva qui
                    self.performSegue(withIdentifier: "registratiAHome", sender:self)
                }
            }
        }

    }

}
