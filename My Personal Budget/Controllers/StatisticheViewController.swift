//
//  StatisticheViewController.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari.
//

import UIKit
import Firebase

class StatisticheViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Grafici"
        navigationItem.hidesBackButton = true
        
//        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
//        let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 16.0]
//        setChart(dataPoints: months, values: unitsSold)
            }
    

//    func setChart(dataPoints: [String], values: [Double]) {
//      var dataEntries: [ChartDataEntry] = []
//      for i in 0..<dataPoints.count {
//        let dataEntry1 = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
//        dataEntries.append(dataEntry1)
//      }
//      print(dataEntries[0].data)
//      let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Units Sold")
//      let pieChartData = PieChartData(dataSet: pieChartDataSet)
//      StatisticheViewController.data = pieChartData
//
//      var colors: [UIColor] = []
//
//      for _ in 0..<dataPoints.count {
//        let red = Double(arc4random_uniform(256))
//        let green = Double(arc4random_uniform(256))
//        let blue = Double(arc4random_uniform(256))
//
//        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
//        colors.append(color)
//      }
//      pieChartDataSet.colors = colors
//    }

    
    
}

//self.navigationController?.backToViewController(viewController: HomeViewController.self)


//            navigationController?.popToRootViewController(animated: true)
