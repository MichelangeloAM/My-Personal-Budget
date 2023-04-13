//
//  ProfiloViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase
import FirebaseAnalytics

class ProfiloViewController: UIViewController {

    @IBOutlet weak var labelProfilo: UILabel!
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldCognome: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var labelErrore: UILabel!
    
    
    let db = Firestore.firestore()
    let userID = Auth.auth().currentUser!.uid

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profilo"
        navigationItem.hidesBackButton = true
        
        labelProfilo.text = K.Generic_Text.scrittaProfilo
        
        
        // Accedo ai dati dell'utente
        db.collection("utenti").whereField("uid", isEqualTo: userID).getDocuments { querySnapshot, error in
            if let error = error {
               print(error)
            } else {
                let document = querySnapshot!.documents.first
                let dataDescription = document?.data()
                // Qui mi trovo nei dati dell'utente corrente e devo descrivere cosa voglio
                
                // Nome
                let nome = dataDescription?["nome"]
                self.textFieldNome.text = nome as? String
                
                // Cognome
                let cognome = dataDescription?["cognome"]
                self.textFieldCognome.text = cognome as? String
                
                // Email
                let email = dataDescription?["email"]
                self.textFieldEmail.text = email as? String
                
                }
            }
        }
      
    


    // Bottone modifica

    @IBAction func bottoneModifica(_ sender: UIButton) {
        
        // Accedo alla collection dell'utente corrente e modifico i 3 valori facendo una updateData con il testo nuovo o non che si trova nelle textField della view
        db.collection("utenti").document(userID).updateData([
            "nome": textFieldNome.text,
            "cognome": textFieldCognome.text,
            "email": textFieldEmail.text
        ]) { errore in
            if let errore = errore?.localizedDescription {
                self.labelErrore.text = errore
            } else {
                UIView.animate(withDuration: 3) {
                    self.labelErrore.text = K.Fbase.datiAggiornati
                    self.labelErrore.alpha = 0
                }
                print("Documenti aggiornati con successo")
            }
        }
        
        
        // Prendo dati utente corrente
        let utenteCorrente = Auth.auth().currentUser

        
        // Aggiorno la email dell'account usando il metodo updateEmail con completion handler
        utenteCorrente?.updateEmail(to: textFieldEmail.text!) { erroreEmail in
            if let erroreEmail = erroreEmail?.localizedDescription {
                self.labelErrore.text = erroreEmail
            } else {
                UIView.animate(withDuration: 3) {
                    self.labelErrore.text = K.Fbase.datiAggiornati
                    self.labelErrore.alpha = 0
                }
                print("Email account aggiornata")
            }
        }
        
        // Aggiorno la email dell'account usando il metodo updatePassword con completion handler
        utenteCorrente?.updatePassword(to: textFieldPassword.text!) { errorePassword in
            if let errorePassword = errorePassword?.localizedDescription {
                self.labelErrore.text = errorePassword
            } else {
                UIView.animate(withDuration: 3) {
                    self.labelErrore.text = K.Fbase.datiAggiornati
                    self.labelErrore.alpha = 0
                }
                print("Password account aggiornata")
            }
        }
    }
}
