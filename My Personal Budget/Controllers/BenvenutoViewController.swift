//
//  WelcomeViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase
import WebKit

class BenvenutoViewController: UIViewController {

    
    let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // HTML
        view.addSubview(webView)
        
        guard let url = URL(string: "https://youtube.com") else {
            return
        }
        
        // Usa auto-layout
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        let g = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            // Costrains per rimanere nella Safe Area
            webView.topAnchor.constraint(equalTo: g.topAnchor, constant: -50.0),
            webView.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 0.0),
            webView.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: 0.0),
            webView.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: 0.0),
            
        ])
        webView.load(URLRequest(url: url))
        
        // Fine HTML
        
//        title = K.Generic_Text.nomeApp

//        welcomeLabel.text = "Benvenuto!"
//
//        introApp.text = K.App_Text.introApp
//
//        tutorialProfilo.text = K.App_Text.tutorialProfilo
//
//        tutorialInserisci.text = K.App_Text.tutorialInserisciHome
        
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
//        super.viewDidLoad()
        
        super.viewDidLayoutSubviews()
//        webView. = CGRect(x: 0, y: 50, width: 400, height: 800)
        
        self.navigationItem.hidesBackButton = true
        
    }
}
