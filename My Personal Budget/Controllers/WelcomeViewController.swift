//
//  WelcomeViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.nomeApp
        
        welcomeLabel.text = "Buongiorno e benvenuto su MPB"
//        welcomeTutorialLabel.text = K.App_Text.tutorialApp
    }
}

class MyTabbarController: UITabBarController {

    @IBAction func bottoneLogout(_ sender: UIBarButtonItem) {

        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            print("Ciao e a presto! <3")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
    }
}
