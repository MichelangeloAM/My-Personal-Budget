//
//  EntrateViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 18/04/23.
//

import UIKit
import Firebase


class EntrateViewController: UIViewController {
    
//    let date = Date()
//    let dateFormatter = DateFormatter()
//
//    dateFormatter.dateFormat = "dd/MM/yyyy"
//
//    let result = dateFormatter.string(from: date)
//    print(result)

    @IBOutlet weak var labelErrore: UILabel!
    
    let db = Firestore.firestore()
    
    let user = Auth.auth().currentUser

    @IBAction func buttonEntrate(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Stipendio", message: "Per favore inserisci un valore", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // force decimal point separator
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Stipendio", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "wage",
                    "number": enteredNumber,
                    "data": Date(),
                    "category": "positive"
                ] as [String : Any]

                self.db.collection("utenti").document(self.user!.uid).collection("transactions").addDocument(data: transactionData) { error in
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
    
    @IBAction func buttonPassive(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Stipendio", message: "Per favore inserisci un valore", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // force decimal point separator
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Stipendio", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "passive",
                    "number": enteredNumber,
                    "data": Date(),
                    "category": "positive"
                ] as [String : Any]

                self.db.collection("utenti").document(self.user!.uid).collection("transactions").addDocument(data: transactionData) { error in
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
    
    
    @IBAction func buttonInvestmentsReturns(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Stipendio", message: "Per favore inserisci un valore", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // force decimal point separator
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Stipendio", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "invreturns",
                    "number": enteredNumber,
                    "data": Date(),
                    "category": "positive"
                ] as [String : Any]

                self.db.collection("utenti").document(self.user!.uid).collection("transactions").addDocument(data: transactionData) { error in
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
    
    
    @IBAction func buttonGiftsReceived(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Stipendio", message: "Per favore inserisci un valore", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // force decimal point separator
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Stipendio", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "giftsreceived",
                    "number": enteredNumber,
                    "data": Date(),
                    "category": "positive"
                ] as [String : Any]

                self.db.collection("utenti").document(self.user!.uid).collection("transactions").addDocument(data: transactionData) { error in
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
    
    
    @IBAction func buttonReimbursments(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Stipendio", message: "Per favore inserisci un valore", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // force decimal point separator
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Stipendio", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "reimbursments",
                    "number": enteredNumber,
                    "data": Date(),
                    "category": "positive"
                ] as [String : Any]

                self.db.collection("utenti").document(self.user!.uid).collection("transactions").addDocument(data: transactionData) { error in
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
    
    @IBAction func buttonGeneric(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Inserisci Stipendio", message: "Per favore inserisci un valore", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "en_US") // force decimal point separator
            textField.keyboardType = .decimalPad
        }
        
        let insertAction = UIAlertAction(title: "Inserisci Stipendio", style: .default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first, let text = textField.text {
                // Salva il numero immesso nella variabile
                let enteredNumber = Double(text) ?? 0 // se non è un numero valido lo salva a 0
                print("Numero immesso: \(enteredNumber)")
                
                // Metto il numero nelle transazioni nel DB
                
                let transactionData = [
                    "name": "generic",
                    "number": enteredNumber,
                    "data": Date(),
                    "category": "positive"
                ] as [String : Any]

                self.db.collection("utenti").document(self.user!.uid).collection("transactions").addDocument(data: transactionData) { error in
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






