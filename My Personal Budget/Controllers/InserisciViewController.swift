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
    
    // cell reuse id (cells that scroll out of view can be reused)
    
    let db = Firestore.firestore()

    let user = Auth.auth().currentUser
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    var transactions: [QueryDocumentSnapshot] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTutorialInserisci.text = K.App_Text.tutorialInserisci
        
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        let transactionsRef = db.collection("utenti").document(uid).collection("transactions")

        //            .order(by: "data", descending: true)

        transactionsRef
            .getDocuments() { [weak self] querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    guard let documents = querySnapshot?.documents else {
                        print("No documents found")
                        return
                    }
                    self?.transactions = documents
                    self?.tableView.reloadData()
                }
        }

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! UITableViewCell
        
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = .none
        cell.contentMode = .center

        let transaction = transactions[indexPath.row]
        let category = transaction["category"] as? String ?? ""
        let name = transaction["name"] as? String ?? ""
        let amount = transaction["number"] as? Double ?? 0
        let date = transaction["data"] as? Timestamp ?? Timestamp(date: Date())

        let convertito: String = String(format: "%.2f", amount)

        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        let finale = name.capitalized + "      " + convertito
        
        cell.detailTextLabel?.text = formatter.string(from: date.dateValue())
        cell.textLabel?.text = finale
//        cell.detailTextLabel?.text = "TEST"
        

//        cell.dateLabel.text = formatter.string(from: date.dateValue())

        if category == "positive" {
            cell.textLabel?.textColor = UIColor.systemGreen
//            cell.amountLabel.textColor = UIColor.green
//            cell.amountLabel.text = String(format: "%.2f", amount)
        } else {
            cell.textLabel?.textColor = UIColor.systemRed
//            cell.amountLabel.text = "-\(String(format: "%.2f", abs(amount)))"
        }

        return cell
    }


}


