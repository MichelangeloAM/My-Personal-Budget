//
//  ViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 01/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titoloApp: UILabel!
    @IBOutlet weak var mottoApp: UILabel!
    @IBOutlet weak var logoApp: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Sfondo_App.png")!)
        
        // Animazione macchina da scrivere titolo
        titoloApp.text = ""
        var indiceChar = 0.0
        let titoloApp = K.nomeApp
        for lettera in titoloApp {
            Timer.scheduledTimer(withTimeInterval: 0.1 * indiceChar, repeats: false) { (timer) in
                 self.titoloApp.text?.append(lettera)
            }
            indiceChar += 1
        }
        
        mottoApp.text = ""
        var indiceCharMotto = 0.5
        let mottoApp = K.mottoApp
        for lettera in mottoApp {
            Timer.scheduledTimer(withTimeInterval: 0.1 * indiceCharMotto, repeats: false) { (timer) in
                 self.mottoApp.text?.append(lettera)
            }
            indiceCharMotto += 1
        }
    }


}
