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
    
    
    
    let db = Firestore.firestore()

    let user = Auth.auth().currentUser

    var transactions: [QueryDocumentSnapshot] = []
    
    lazy var pieChartView: PieChartView = {
        let chartView = PieChartView()
        chartView.backgroundColor = .systemBlue
        return chartView
    }()
    
    
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
                
                var positiveTotal: Double = 0
                var negativeTotal: Double = 0
                var positiveByNames: [String: Double] = [:]
                
                for document in documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    let number = data["number"] as? Double ?? 0
                    
                    if category == "positive" {
                        positiveTotal += number
                        if let currentNumber = positiveByNames[name] {
                            positiveByNames[name] = currentNumber + number
                        } else {
                            positiveByNames[name] = number
                        }
                    } else {
                        negativeTotal += number
                    }
                }
                
                // Calculate percentages for positive transactions by name
                var positivePercentagesByNames: [String: Int] = [:]
                for (name, number) in positiveByNames {
                    let percentage = (number / positiveTotal) * 100
                    positivePercentagesByNames[name] = Int(percentage)
                }
                
                // Print the calculated values
                print("Positive total: \(positiveTotal)")
                print("Negative total: \(negativeTotal)")
                print("Positive by names: \(positiveByNames)")
//                print("Positive percentages by names: \(positivePercentagesByNames)")
                
                self?.setData(positivePercentagesByNames: positivePercentagesByNames)

            }
        }
        
        
        navigationItem.hidesBackButton = true
        
        view.addSubview(pieChartView)
        
        pieChartView.centerInSuperview()
        pieChartView.width(to: view)
        pieChartView.heightToWidth(of: view)
        

    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        

        
        print(entry)
    }
    
    
    func setData(positivePercentagesByNames: [String: Int]) {
        
        print("Positive percentages by names: \(positivePercentagesByNames)")
        
        

        
        var entries : [PieChartDataEntry] = Array()
//        entries.append(PieChartDataEntry(value: 70, label: "Casa"))
//        entries.append(PieChartDataEntry(value: 15, label: "Benzina"))
//        entries.append(PieChartDataEntry(value: 15, label: "Macchina"))
        

        for (name, number) in positivePercentagesByNames {
            entries.append(PieChartDataEntry(value: Double(number), label: name))
        }
        
//        PieChartDataEntry(value: 70, label: "Casa")
//        PieChartDataEntry(value: 30, label: "Macchina")
        
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
        
        
        var titolo = "Entrate"
        
        let titleChart = NSAttributedString(string: "Entrate", attributes: nil)
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
