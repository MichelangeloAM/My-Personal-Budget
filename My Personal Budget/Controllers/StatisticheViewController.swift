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
    
    lazy var pieChartView: PieChartView = {
        let chartView = PieChartView()
        chartView.backgroundColor = .systemBlue
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        view.addSubview(pieChartView)
        
        pieChartView.centerInSuperview()
        pieChartView.width(to: view)
        pieChartView.heightToWidth(of: view)
        
        setData()

        
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        

        
        print(entry)
    }
    
    func setData() {
        
        var entries : [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 70, label: "Casa"))
        entries.append(PieChartDataEntry(value: 15, label: "Benzina"))
        entries.append(PieChartDataEntry(value: 15, label: "Macchina"))

//        PieChartDataEntry(value: 70, label: "Casa")
//        PieChartDataEntry(value: 30, label: "Macchina")
        
        let dataSet = PieChartDataSet(entries: entries, label : "")
        
        let set1 = PieChartDataSet(entries: entries, label: "")
        
        pieChartView.holeRadiusPercent = 0.60
        set1.sliceSpace = 10
        
        let a_pie_color = UIColor.blue
        let b_pie_color = UIColor.red
        let c_pie_color = UIColor.blue
        let d_pie_color = UIColor.red
        let e_text_color = UIColor.green
        let f_text_color = UIColor.white
        
        set1.colors = [a_pie_color, b_pie_color, c_pie_color, d_pie_color]
        set1.valueColors =  [a_pie_color, b_pie_color, c_pie_color, d_pie_color]
        set1.drawValuesEnabled = true
        pieChartView.data = PieChartData(dataSet: set1)
        
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = false
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.drawSlicesUnderHoleEnabled = true
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.usePercentValuesEnabled = true
        pieChartView.legend.enabled = true
        pieChartView.holeColor = UIColor.white

        
        var titolo = "Entrate"
        
        let titleChart = NSAttributedString(string: "Entrate", attributes: nil)
        pieChartView.centerAttributedText = titleChart
        
        
        let data = PieChartData(dataSet: set1)
        pieChartView.data = data
    }
    
    
}
