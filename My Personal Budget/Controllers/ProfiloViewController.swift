//
//  ProfiloViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 02/11/21.
//

import UIKit
import Firebase

class ProfiloViewController: UIViewController {

    @IBOutlet weak var labelProfilo: UILabel!
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldCognome: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profilo"
        navigationItem.hidesBackButton = true
        
        labelProfilo.text = K.scrittaProfilo
    }
    
}
