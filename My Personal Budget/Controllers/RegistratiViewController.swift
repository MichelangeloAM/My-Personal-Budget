//
//  RegistratiViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class RegistratiViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cognomeTextField: UITextField!
    @IBOutlet weak var labelErrore: UILabel!
    
    
    // Controllo che tutti i campi siano validi e che i dati siano correttamente
    // inseriti, se tutto va bene ritorna un valore nil
    func validazioneCampi() -> String? {
        
        // Controlliamo che ii campi del nome e cognome siano compilati
        if nomeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            cognomeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "inserisci_all_data"
        }
        
        return nil
    }
    
    @IBAction func bottoneRegistrati(_ sender: UIButton) {
        
        // Verifico nome e cognome
        
        let erroreNome_Cognome = validazioneCampi()
        
        if erroreNome_Cognome != nil {
            // In caso non fossero compilati i campi do errore.
            mostraErrore(erroreNome_Cognome!)
        } else if let email = emailTextField.text, let password = passwordTextField.text {   // Uso binding opzionale per evitare errori con i valori
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error { // Uso di nuovo optional binding per errore
                        self.labelErrore.text = e.localizedDescription
                    } else {
                        // Pulisco i dati per il DB - Uso .trimmingCharacters per rimuovere, usando whitespacesAndNewlines, spazi e punti a capo
                        let nome = self.nomeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                        let cognome = self.cognomeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        // Quello che ho appena fatto, è possibile anche per la verifica dei dati svolta prima con erroreNome_Cognome. Infatti, senza di esso non potrei spacchettare il
                        // dato con "!".
                        
                        // Qui creo l'utente nel database
                        let db = Firestore.firestore()
                        
                        let user = Auth.auth().currentUser
                        let userData = [
                            "nome": nome,
                            "cognome": cognome,
                            "email": user?.email ?? "",
                            "uid": user?.uid ?? ""
                        ]
                        db.collection("utenti").document(user!.uid).setData(userData) { err in
                            if let err = err {
                                print("Errore durante l'aggiunta del documento: \(err)")
                            } else {
                                print("Documento aggiunto con successo!")
                            }
                        }
                        // Naviga alla pagina successiva qui
                        self.performSegue(withIdentifier: "registratiAWelcome", sender:self)
                    }
                }
            }
        


    }
    
    func mostraErrore(_ message:String) {
        labelErrore.text = K.Generic_Text.messaggioErrore
    }

}
