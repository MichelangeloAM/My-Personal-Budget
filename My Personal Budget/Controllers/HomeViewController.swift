//
//  HomeViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 01/11/21.
//

import UIKit
import AuthenticationServices
import CryptoKit

class HomeViewController: UIViewController, ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {

    @IBOutlet weak var titoloApp: UILabel!
    @IBOutlet weak var mottoApp: UILabel!
    
    
    @IBAction func signInApple(_ sender: UIButton) {
        startSignInWithAppleFlow()
    }
    
    
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
    
    
    // Handle successful authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        // Handle the user's authorization, e.g. by sending a request to your server
        // to create an account or log in the user
    }
    
    // Handle failed authorization
    @nonobjc func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle the error, e.g. by displaying an error message to the user
    }
    
    func startSignInWithAppleFlow() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if length == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    @objc(presentationAnchorForAuthorizationController:) func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }



}
