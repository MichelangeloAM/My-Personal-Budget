//
//  StatisticheViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase
import Charts
import TinyConstraints



class StatisticheViewController: UIViewController, ChartViewDelegate {
    
    
    @IBAction func buttonEntrate(_ sender: UIButton) {
        self.setDataPositive(positivePercentagesByNames: positivePercentagesByNames)
    }

    @IBAction func buttonBilancio(_ sender: UIButton) {
        self.setDataBilancio(positiveTotal: positiveTotal, negativeTotal: negativeTotal)
        
    }
    @IBAction func buttonUscite(_ sender: UIButton) {
        self.setDataNegative(negativePercentagesByNames: negativePercentagesByNames)
    }
    
    let db = Firestore.firestore()

    let user = Auth.auth().currentUser

    var transactions: [QueryDocumentSnapshot] = []
    
    lazy var pieChartView: PieChartView = {
        let chartView = PieChartView()
        return chartView
    }()
    
    var positivePercentagesByNames: [String: Int] = [:]
    var negativePercentagesByNames: [String: Int] = [:]
    
    var positiveTotal: Double = 0
    var negativeTotal: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Prendo le transazioni dal DB Firebase
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        let transactionsRef = db.collection("utenti").document(uid).collection("transactions")

        transactionsRef.getDocuments() { [weak self] querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    return
                }
                

                var positiveByNames: [String: Double] = [:]
                var negativeByNames: [String: Double] = [:]
                
                for document in documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let number = data["number"] as? Double ?? 0
                    
                    if category == "positive" {
                        self?.positiveTotal += number
                        if let currentNumber = positiveByNames[name] {
                            positiveByNames[name] = currentNumber + number
                        } else {
                            positiveByNames[name] = number
                        }
                    } else {
                        self?.negativeTotal += number
                        if let currentNumber = negativeByNames[name] {
                            negativeByNames[name] = currentNumber + number
                        } else {
                            negativeByNames[name] = number
                        }
                    }
                }
                
                // Calculate percentages for positive transactions by name
                for (name, number) in positiveByNames {
                    let percentage = (number / self!.positiveTotal) * 100
                    self?.positivePercentagesByNames[name] = Int(percentage)
                }
                
                // Calculate percentages for negative transactions by name
                for (name, number) in negativeByNames {
                    let percentage = (number / self!.negativeTotal) * 100
                    self?.negativePercentagesByNames[name] = Int(percentage)
                }
                
            }
        }
        
        
        navigationItem.hidesBackButton = true
        
        view.addSubview(pieChartView)
        
        pieChartView.centerInSuperview()
        pieChartView.width(to: view)
        pieChartView.heightToWidth(of: view)
        pieChartView.backgroundColor = self.UIColorFromRGB(0xC2E4D4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Ricarico View")
        
        // Prendo le transazioni dal DB Firebase
        
        let uid = Auth.auth().currentUser?.uid ?? ""
        let transactionsRef = db.collection("utenti").document(uid).collection("transactions")

        transactionsRef.getDocuments() { [weak self] querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    return
                }
                

                var positiveByNames: [String: Double] = [:]
                var negativeByNames: [String: Double] = [:]
                
                for document in documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let number = data["number"] as? Double ?? 0
                    
                    if category == "positive" {
                        self?.positiveTotal += number
                        if let currentNumber = positiveByNames[name] {
                            positiveByNames[name] = currentNumber + number
                        } else {
                            positiveByNames[name] = number
                        }
                    } else {
                        self?.negativeTotal += number
                        if let currentNumber = negativeByNames[name] {
                            negativeByNames[name] = currentNumber + number
                        } else {
                            negativeByNames[name] = number
                        }
                    }
                }
                
                // Calculate percentages for positive transactions by name
                for (name, number) in positiveByNames {
                    let percentage = (number / self!.positiveTotal) * 100
                    self?.positivePercentagesByNames[name] = Int(percentage)
                }
                
                // Calculate percentages for negative transactions by name
                for (name, number) in negativeByNames {
                    let percentage = (number / self!.negativeTotal) * 100
                    self?.negativePercentagesByNames[name] = Int(percentage)
                }
                
            }
        }
        
        
        navigationItem.hidesBackButton = true
        
        view.addSubview(pieChartView)
        
        pieChartView.centerInSuperview()
        pieChartView.width(to: view)
        pieChartView.heightToWidth(of: view)
        pieChartView.backgroundColor = self.UIColorFromRGB(0xC2E4D4)
        

        
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        

        
        print(entry)
    }
    
    
    
    func setDataPositive(positivePercentagesByNames: [String: Int]) {
        
        print("Positive percentages by names: \(positivePercentagesByNames)")
        
        

        
        var entries : [PieChartDataEntry] = Array()

        for (name, number) in positivePercentagesByNames {
            entries.append(PieChartDataEntry(value: Double(number), label: name))
        }
        
        
        let dataSet = PieChartDataSet(entries: entries, label : "")
        
        let set1 = PieChartDataSet(entries: entries, label: "")
        
        pieChartView.holeRadiusPercent = 0.40
        set1.sliceSpace = 5
        
        let a_pie_color = UIColor.blue
        let b_pie_color = UIColor.red
        let c_pie_color = UIColor.green
        let d_pie_color = UIColor.gray
        let e_pie_color = UIColor.magenta
        let f_pie_color = UIColor.orange

        let a_text_color = UIColor.green
        let b_text_color = UIColor.white
        
        set1.colors = [a_pie_color, b_pie_color, c_pie_color, d_pie_color, e_pie_color,f_pie_color]
        set1.valueColors =  [b_text_color, b_text_color, b_text_color, b_text_color]
        set1.entryLabelColor = b_text_color
        set1.drawValuesEnabled = true
        pieChartView.data = PieChartData(dataSet: set1)
        
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = false
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.drawSlicesUnderHoleEnabled = true
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.usePercentValuesEnabled = true
        pieChartView.legend.enabled = true
        pieChartView.holeColor = self.UIColorFromRGB(0xC2E4D4)
        
        
        pieChartView.backgroundColor = self.UIColorFromRGB(0xC2E4D4)
        
        // Colore sfondo: C2E4D4
        
        
        
        let titleChart = NSAttributedString(string: "Entrate", attributes: nil)
        pieChartView.centerAttributedText = titleChart
        
        
        let data = PieChartData(dataSet: set1)
        pieChartView.data = data
    }
    
    func setDataNegative(negativePercentagesByNames: [String: Int]) {
        
        print("Negative percentages by names: \(negativePercentagesByNames)")
        
        

        
        var entries : [PieChartDataEntry] = Array()

        for (name, number) in negativePercentagesByNames {
            entries.append(PieChartDataEntry(value: Double(number), label: name))
        }
        
        
        let dataSet = PieChartDataSet(entries: entries, label : "")
        
        let set1 = PieChartDataSet(entries: entries, label: "")
        
        pieChartView.holeRadiusPercent = 0.40
        set1.sliceSpace = 5
        
        let a_pie_color = UIColor.blue
        let b_pie_color = UIColor.red
        let c_pie_color = UIColor.green
        let d_pie_color = UIColor.gray
        let e_pie_color = UIColor.magenta
        let f_pie_color = UIColor.orange

        let a_text_color = UIColor.green
        let b_text_color = UIColor.white
        
        set1.colors = [a_pie_color, b_pie_color, c_pie_color, d_pie_color, e_pie_color,f_pie_color]
        set1.valueColors =  [b_text_color, b_text_color, b_text_color, b_text_color]
        set1.entryLabelColor = b_text_color
        set1.drawValuesEnabled = true
        pieChartView.data = PieChartData(dataSet: set1)
        
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = false
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.drawSlicesUnderHoleEnabled = true
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.usePercentValuesEnabled = true
        pieChartView.legend.enabled = true
        pieChartView.holeColor = self.UIColorFromRGB(0xC2E4D4)
        
        
        pieChartView.backgroundColor = self.UIColorFromRGB(0xC2E4D4)
        
        // Colore sfondo: C2E4D4
        
        let titleChart = NSAttributedString(string: "Uscite", attributes: nil)
        pieChartView.centerAttributedText = titleChart
        
        
        let data = PieChartData(dataSet: set1)
        pieChartView.data = data
    }
    
    func setDataBilancio(positiveTotal: Double, negativeTotal: Double) {
        
        var totale = positiveTotal + negativeTotal
        
        var percPos = (positiveTotal / totale) * 100
        var percNeg = (negativeTotal / totale) * 100

        
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: percPos, label: "Entrate"))
        entries.append(PieChartDataEntry(value: percNeg, label: "Uscite"))

        
        let dataSet = PieChartDataSet(entries: entries, label : "")
        
        let set1 = PieChartDataSet(entries: entries, label: "")
        
        pieChartView.holeRadiusPercent = 0.40
        set1.sliceSpace = 5
        
        let a_pie_color = UIColor.blue
        let b_pie_color = UIColor.red
        let c_pie_color = UIColor.green
        let d_pie_color = UIColor.gray
        let e_pie_color = UIColor.magenta
        let f_pie_color = UIColor.orange

        let a_text_color = UIColor.green
        let b_text_color = UIColor.white
        
        set1.colors = [a_pie_color, b_pie_color]
        set1.valueColors =  [b_text_color, b_text_color, b_text_color]
        set1.entryLabelColor = b_text_color
        set1.drawValuesEnabled = true
        pieChartView.data = PieChartData(dataSet: set1)
        
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = false
        pieChartView.drawEntryLabelsEnabled = true
        pieChartView.drawSlicesUnderHoleEnabled = true
        pieChartView.usePercentValuesEnabled = true
        pieChartView.legend.enabled = true
        pieChartView.holeColor = self.UIColorFromRGB(0xC2E4D4)
        
        
        pieChartView.backgroundColor = self.UIColorFromRGB(0xC2E4D4)
        
        // Colore sfondo: C2E4D4
        
        
        
        let titleChart = NSAttributedString(string: "Bilancio", attributes: nil)
        pieChartView.centerAttributedText = titleChart
        
        
        let data = PieChartData(dataSet: set1)
        pieChartView.data = data
    }
    
    func UIColorFromRGB(_ rgbValue: Int) -> UIColor! {
        return UIColor(
            red: CGFloat((Float((rgbValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((rgbValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((rgbValue & 0x0000ff) >> 0)) / 255.0),
            alpha: 1.0)
    }
    
    
}
