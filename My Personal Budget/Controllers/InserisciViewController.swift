//
//  InserisciViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class InserisciViewController: UIViewController {
    
    
    @IBOutlet weak var labelTutorialInserisci: UILabel!
    @IBOutlet weak var buttonEntrate: UIButton!
    @IBOutlet weak var buttonUscite: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var transactions: [Transaction] = []
    
    let db = Firestore.firestore()
    
    let user = Auth.auth().currentUser
    
    // Define a struct to represent a transaction
    struct Transaction {
        let userId: String
        let name: String
        let type: TransactionType
        let amount: Double
        let date: Date
    }

    // Define an enum to represent the transaction type
    enum TransactionType {
        case positive
        case negative
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.Generic_Text.scrittaInserisci
        navigationItem.hidesBackButton = true
        
        labelTutorialInserisci.text = K.App_Text.tutorialInserisci
        
        
        // First, create a reference to the "utenti" collection
        let utentiCollectionRef = Firestore.firestore().collection("utenti")

        // Then, query the "positive" and "negative" collections for each user
        utentiCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }

            var transactions: [Transaction] = []

            for _ in snapshot!.documents {
                // Get the user's ID
                let userId = self.user!.uid

                
                // Query the "positive" collection for the last entry by date
                let positiveCollectionRef = utentiCollectionRef.document(self.user!.uid).collection("transactions").document("transactions").collection("positive")
                positiveCollectionRef.order(by: "data", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
                    if let error = error {
                        print("Error fetching documents: \(error.localizedDescription)")
                        return
                    }

                    // Parse the data and add it to the transactions array
                    for document in snapshot!.documents {
                        let data = document.data()
                        let name = data["name"] as! String
                        let number = data["number"] as! Double
                        let date = data["data"] as! Timestamp
                        transactions.append(Transaction(userId: userId, name: name, type: .positive, amount: number, date: date.dateValue()))
                    }
                }

                // Query the "negative" collection for the last entry by date
                let negativeCollectionRef = utentiCollectionRef.document(self.user!.uid).collection("transactions").document("transactions").collection("negative")
                negativeCollectionRef.order(by: "data", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
                    if let error = error {
                        print("Error fetching documents: \(error.localizedDescription)")
                        return
                    }

                    // Parse the data and add it to the transactions array
                    for document in snapshot!.documents {
                        let data = document.data()
                        let name = data["name"] as! String
                        let number = data["number"] as! Double
                        let date = data["data"] as! Timestamp
                        transactions.append(Transaction(userId: userId, name: name, type: .negative, amount: number, date: date.dateValue()))
                    }
                }
            }

            // After all queries have completed, sort the transactions array by date and display it in a table view
            transactions.sort { $0.date > $1.date }
            self.tableView.reloadData()
        }

    }
    
}
