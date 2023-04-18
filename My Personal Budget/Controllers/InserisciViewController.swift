//
//  InserisciViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class InserisciViewController: UIViewController {
    
    
    @IBOutlet weak var labelInserisci: UILabel!
    @IBOutlet weak var labelTutorialInserisci: UILabel!
    @IBOutlet weak var buttonEntrate: UIButton!
    @IBOutlet weak var buttonUscite: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = K.Generic_Text.scrittaInserisci
        navigationItem.hidesBackButton = true
        
        labelTutorialInserisci.text = K.App_Text.tutorialInserisci
    }
    

    @IBAction func bottoneAggiungiTransazione(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
