//
//  StatisticheViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class StatisticheViewController: UIViewController {

    @IBOutlet weak var labelStatistiche: UILabel!
    @IBOutlet weak var labelTutorialStatistiche: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Grafici"
        navigationItem.hidesBackButton = true
        
        labelStatistiche.text = K.Generic_Text.scrittaStatistiche
        labelTutorialStatistiche.text = K.App_Text.tutorialStatistiche
    }
    

    
    
}

//self.navigationController?.backToViewController(viewController: HomeViewController.self)


//            navigationController?.popToRootViewController(animated: true)
