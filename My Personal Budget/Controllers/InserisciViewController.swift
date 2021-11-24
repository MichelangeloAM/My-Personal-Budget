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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Inserisci Dati"
        navigationItem.hidesBackButton = true
        
        labelInserisci.text = K.scrittaInserisci
        labelTutorialInserisci.text = K.App_Text.tutorialInserisci
    }
    

    @IBAction func bottoneAggiungiTransazione(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
