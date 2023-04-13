//  PopoverViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 21/11/21.
//




import UIKit
import Firebase
import FirebaseAnalytics

class PopoverViewController: UIViewController {
    

    @IBOutlet weak var nomeTransazione: UITextField!
    
    // Label Entrata
    @IBOutlet weak var labelStipendio: UILabel!
    @IBOutlet weak var labelPensione: UILabel!
    @IBOutlet weak var labelRegalo: UILabel!
    @IBOutlet weak var labelRendita: UILabel!
    @IBOutlet weak var labelAltroEntrata: UILabel!
    
    // Switch Entrata
    @IBOutlet weak var switchStipendio: UISwitch!
    @IBOutlet weak var switchPensione: UISwitch!
    @IBOutlet weak var switchRegalo: UISwitch!
    @IBOutlet weak var switchRendita: UISwitch!
    @IBOutlet weak var switchAltroEntrata: UISwitch!
    
    
    // Label Uscita
    @IBOutlet weak var labelSalute: UILabel!
    @IBOutlet weak var labelCasa: UILabel!
    @IBOutlet weak var labelAuto: UILabel!
    @IBOutlet weak var labelSpesa: UILabel!
    @IBOutlet weak var labelAltroUscita: UILabel!
    
    // Switch Uscita
    @IBOutlet weak var switchSalute: UISwitch!
    @IBOutlet weak var switchCasa: UISwitch!
    @IBOutlet weak var switchAuto: UISwitch!
    @IBOutlet weak var switchSpesa: UISwitch!
    @IBOutlet weak var switchAltroUscita: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide Uscite
        labelSalute.isHidden = true
        labelCasa.isHidden = true
        labelAuto.isHidden = true
        labelSpesa.isHidden = true
        labelSalute.isHidden = true
        labelAltroUscita.isHidden = true
        
        switchSalute.isHidden = true
        switchCasa.isHidden = true
        switchAuto.isHidden = true
        switchSpesa.isHidden = true
        switchAltroUscita.isHidden = true

    }
    
    
    @IBAction func cancellaTransazione(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func bottoneAggiungi(_ sender: UIButton) {
    }

    @IBAction func opzioneTransazione(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            
            // Faccio sparire Uscite
            labelSalute.isHidden = true
            labelCasa.isHidden = true
            labelAuto.isHidden = true
            labelSpesa.isHidden = true
            labelSalute.isHidden = true
            labelAltroUscita.isHidden = true
            
            switchSalute.isHidden = true
            switchCasa.isHidden = true
            switchAuto.isHidden = true
            switchSpesa.isHidden = true
            switchAltroUscita.isHidden = true
            
            // Faccio apparire Entrate
            labelStipendio.isHidden = true
            labelPensione.isHidden = true
            labelRegalo.isHidden = true
            labelRendita.isHidden = true
            labelAltroEntrata.isHidden = true
            
            switchStipendio.isHidden = true
            switchPensione.isHidden = true
            switchRegalo.isHidden = true
            switchRendita.isHidden = true
            switchAltroEntrata.isHidden = true
            
        case 1:
            
            // Faccio apparire label e switch Uscite
            labelSalute.isHidden = false
            labelCasa.isHidden = false
            labelAuto.isHidden = false
            labelSpesa.isHidden = false
            labelAltroUscita.isHidden = false
            
            switchSalute.isHidden = false
            switchCasa.isHidden = false
            switchAuto.isHidden = false
            switchSpesa.isHidden = false
            switchAltroUscita.isHidden = false
            
            // Faccio sparire label e switch Entrate
            labelStipendio.isHidden = true
            labelPensione.isHidden = true
            labelRegalo.isHidden = true
            labelRendita.isHidden = true
            labelAltroEntrata.isHidden = true
            
            switchStipendio.isHidden = true
            switchPensione.isHidden = true
            switchRegalo.isHidden = true
            switchRendita.isHidden = true
            switchAltroEntrata.isHidden = true
            
        default:
            break
        }
    }
    
}
