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
   
    
    @IBAction func buttonTransport(_ sender: UIButton) {
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
                    "name": "transport",
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
    
    @IBAction func buttonFood(_ sender: UIButton) {
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
                    "name": "food",
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
    
    @IBAction func buttonGift(_ sender: UIButton) {
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
                    "name": "gift",
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
    
    @IBAction func buttonClothing(_ sender: UIButton) {
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
                    "name": "clothing",
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
    
    
    @IBAction func buttonMedical(_ sender: UIButton) {
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
                    "name": "medical",
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
    
    
    @IBAction func buttonSport(_ sender: UIButton) {
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
                    "name": "sport",
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
    
    @IBAction func buttonTaxes(_ sender: UIButton) {
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
                    "name": "taxes",
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
    
    @IBAction func buttonLeisure(_ sender: UIButton) {
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
                    "name": "leisure",
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
    
    @IBAction func buttonEducation(_ sender: UIButton) {
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
                    "name": "education",
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
    
    @IBAction func buttonInvestments(_ sender: UIButton) {
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
                    "name": "investments",
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
    
    @IBAction func buttonPhone(_ sender: UIButton) {
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
                    "name": "phone",
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
    
    
    @IBAction func buttonCar(_ sender: UIButton) {
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
                    "name": "car",
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
    
    
    @IBAction func buttonGroceries(_ sender: UIButton) {
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
                    "name": "groceries",
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
    
    @IBAction func buttonFuel(_ sender: UIButton) {
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
                    "name": "fuel",
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
