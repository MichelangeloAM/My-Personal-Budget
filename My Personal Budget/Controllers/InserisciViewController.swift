//
//  InserisciViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class InserisciViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var labelTutorialInserisci: UILabel!
    @IBOutlet weak var buttonEntrate: UIButton!
    @IBOutlet weak var buttonUscite: UIButton!
    
    // Data model: These strings will be the data for the table view cells
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    var transactions: [Transaction] = []

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
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    let db = Firestore.firestore()
    
    let user = Auth.auth().currentUser
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // First, create a reference to the "utenti" collection
        let utentiCollectionRef = Firestore.firestore().collection("utenti")
        
        let group = DispatchGroup()
        
        // Then, query the "positive" and "negative" collections for each user
        utentiCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }
            
            for _ in snapshot!.documents {
                // Get the user's ID
                let userId = self.user!.uid
                
                
                // Query the "positive" collection for the last entry by date
                let positiveCollectionRef = utentiCollectionRef.document(self.user!.uid).collection("transactions").document("transactions").collection("positive")
                group.enter()
                positiveCollectionRef.order(by: "data", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
                    defer{group.leave()}
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
                        self.transactions.append(Transaction(userId: userId, name: name, type: .positive, amount: number, date: date.dateValue()))
                    }
                }
                
                // Query the "negative" collection for the last entry by date
                let negativeCollectionRef = utentiCollectionRef.document(self.user!.uid).collection("transactions").document("transactions").collection("negative")
                group.enter()
                negativeCollectionRef.order(by: "data", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
                    defer{group.leave()}
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
                        self.transactions.append(Transaction(userId: userId, name: name, type: .negative, amount: number, date: date.dateValue()))
                    }
                }
            }
        }
        
        print("------")
        print(transactions)
        print("------")
    }
    

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        // set the text from the data model
        cell.textLabel?.text = self.animals[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
    
//    var transactions: [Transaction] = []
//
//    let db = Firestore.firestore()
//
//    let user = Auth.auth().currentUser
//
//    // Define a struct to represent a transaction
//    struct Transaction {
//        let userId: String
//        let name: String
//        let type: TransactionType
//        let amount: Double
//        let date: Date
//    }
//
//    // Define an enum to represent the transaction type
//    enum TransactionType {
//        case positive
//        case negative
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = K.Generic_Text.scrittaInserisci
//        navigationItem.hidesBackButton = true
//
//        labelTutorialInserisci.text = K.App_Text.tutorialInserisci
//
//
//        // First, create a reference to the "utenti" collection
//        let utentiCollectionRef = Firestore.firestore().collection("utenti")
//
//        let group = DispatchGroup()
//
//        tableView.dataSource = self
//        tableView.delegate = self
//
//        // Then, query the "positive" and "negative" collections for each user
//        utentiCollectionRef.getDocuments { (snapshot, error) in
//            if let error = error {
//                print("Error fetching documents: \(error.localizedDescription)")
//                return
//            }
//
//            for _ in snapshot!.documents {
//                // Get the user's ID
//                let userId = self.user!.uid
//
//
//                // Query the "positive" collection for the last entry by date
//                let positiveCollectionRef = utentiCollectionRef.document(self.user!.uid).collection("transactions").document("transactions").collection("positive")
//                group.enter()
//                positiveCollectionRef.order(by: "data", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
//                    defer{group.leave()}
//                    if let error = error {
//                        print("Error fetching documents: \(error.localizedDescription)")
//                        return
//                    }
//
//                    // Parse the data and add it to the transactions array
//                    for document in snapshot!.documents {
//                        let data = document.data()
//                        let name = data["name"] as! String
//                        let number = data["number"] as! Double
//                        let date = data["data"] as! Timestamp
//                        self.transactions.append(Transaction(userId: userId, name: name, type: .positive, amount: number, date: date.dateValue()))
//                    }
//                }
//
//                // Query the "negative" collection for the last entry by date
//                let negativeCollectionRef = utentiCollectionRef.document(self.user!.uid).collection("transactions").document("transactions").collection("negative")
//                group.enter()
//                negativeCollectionRef.order(by: "data", descending: true).limit(to: 1).getDocuments { (snapshot, error) in
//                    defer{group.leave()}
//                    if let error = error {
//                        print("Error fetching documents: \(error.localizedDescription)")
//                        return
//                    }
//
//                    // Parse the data and add it to the transactions array
//                    for document in snapshot!.documents {
//                        let data = document.data()
//                        let name = data["name"] as! String
//                        let number = data["number"] as! Double
//                        let date = data["data"] as! Timestamp
//                        self.transactions.append(Transaction(userId: userId, name: name, type: .negative, amount: number, date: date.dateValue()))
//                    }
//                }
//            }
//        }
//
//        group.notify(queue: .main) {
//            // After all queries have completed, sort the transactions array by date and display it in a table view
//            self.transactions.sort { $0.date > $1.date }
//            self.tableView.reloadData()
//        }
//    }
//
//    func formatDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        return formatter.string(from: date)
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return transactions.count
//    }
//
//    class TransactionCell: UITableViewCell {
//
//        @IBOutlet weak var nameLabel: UILabel!
//        @IBOutlet weak var amountLabel: UILabel!
//        @IBOutlet weak var dateLabel: UILabel!
//        @IBOutlet weak var transactionTypeLabel: UILabel!
//
//        func configure(with transaction: InserisciViewController.Transaction) {
//            nameLabel.text = transaction.name
//
//            let numberFormatter = NumberFormatter()
//            numberFormatter.numberStyle = .currency
//            amountLabel.text = numberFormatter.string(from: NSNumber(value: transaction.amount))
//
//            dateLabel.text = formatDate(transaction.date)
//        }
//
//        private func formatDate(_ date: Date) -> String {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .short
//            dateFormatter.timeStyle = .short
//            return dateFormatter.string(from: date)
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.transactionCell, for: indexPath) as! TransactionCell
//        let transaction = transactions[indexPath.row]
//
//        cell.nameLabel.text = transaction.name
//        cell.amountLabel.text = String(transaction.amount)
//        cell.dateLabel.text = formatDate(transaction.date)
//
//        if transaction.type == .positive {
//            cell.transactionTypeLabel.text = "+"
//        } else {
//            cell.transactionTypeLabel.text = "-"
//        }
//
//        return cell
//    }

//    if transaction.type == .positive {
//        cell.amountLabel.textColor = UIColor.green
//        cell.typeLabel.text = "+"
//    } else {
//        cell.amountLabel.textColor = UIColor.red
//        cell.typeLabel.text = "-"
//    }

