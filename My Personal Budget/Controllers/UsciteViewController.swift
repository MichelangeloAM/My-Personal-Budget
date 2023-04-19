//
//  UsciteViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 18/04/23.
//

import UIKit
import Firebase

class UsciteViewController: UIViewController {

    @IBOutlet weak var labelErrore: UILabel!
    
    let db = Firestore.firestore()
    
    let user = Auth.auth().currentUser
    
    @IBAction func buttonHome(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Spesa", message: "Per favore inserisci quanto hai speso", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // Forza il separatore decimale ad un punto invece di virgola
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Spesa", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "house",
                    "number": enteredNumber,
                    "data": Date()
//                    "createdAt": date
                ] as [String : Any]
                
                
                self.db.collection("utenti").document(self.user!.uid).collection("transactions").document("transactions").collection("negative").addDocument(data: transactionData) { error in
                    if let error = error {
                        print("Errore nell'aggiunta della transazione: \(error.localizedDescription)")
                        self.labelErrore.text = error.localizedDescription
                    } else {
                        print("Transazione aggiunta con successo!")
                        self.labelErrore.text = "Transazione registrata"
                    }
                }
            }
        })
        
        alertController.addAction(insertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
