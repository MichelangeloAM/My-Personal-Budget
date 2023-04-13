//
//  HomeViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 01/11/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titoloApp: UILabel!
    @IBOutlet weak var mottoApp: UILabel!
    @IBOutlet weak var logoApp: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Animazione macchina da scrivere titolo
        titoloApp.text = ""
        var indiceChar = 0.0
        let titoloApp = K.Generic_Text.nomeApp
        for lettera in titoloApp {
            Timer.scheduledTimer(withTimeInterval: 0.1 * indiceChar, repeats: false) { (timer) in
                 self.titoloApp.text?.append(lettera)
            }
            indiceChar += 1
        }
        
        mottoApp.text = ""
        var indiceCharMotto = 0.0
        let mottoApp = K.Generic_Text.mottoApp
        for lettera in mottoApp {
            Timer.scheduledTimer(withTimeInterval: 0.05 * indiceCharMotto, repeats: false) { (timer) in
                 self.mottoApp.text?.append(lettera)
            }
            indiceCharMotto += 1
        }
    }


}
