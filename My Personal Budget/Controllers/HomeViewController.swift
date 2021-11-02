//
//  HomeViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 02/11/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "💰MPB💰"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func bottoneLogout(_ sender: UIBarButtonItem) {

        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    

}
