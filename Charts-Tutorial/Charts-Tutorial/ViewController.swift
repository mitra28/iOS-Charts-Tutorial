//
//  ViewController.swift
//  Charts-Tutorial
//
//  Created by Anonya Mitra on 6/17/21.
//

import UIKit
import Charts

class ViewController: UIViewController {

    
    @IBOutlet weak var lineChartBox: LineChartView!
    
    @IBOutlet weak var pieChartBox: PieChartView!
    
    @IBOutlet weak var barChartBox: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [2, 1, 3, 4, 5, 9, 1, 4, 6, 5]
        graphLineChart(dataArray: data)
        graphPieChart(dataArray: data)
        graphBarChart(dataArray: data)
    }
    
    func graphLineChart(dataArray: [Int]) {
        //make lineChartBox size have width and height both equal to width of screen
        lineChartBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        
        //make box center to be horizontally centered but offset towards
        //top of screen
        lineChartBox.center.x = self.view.center.x
        lineChartBox.center.y = self.view.center.y - 240 //minus move up
        
        //settings when chart has no data
        lineChartBox.noDataText = "No Data Available"
        lineChartBox.noDataTextColor = UIColor.black
        
        //initialize array that will eventually be displayed on graph
        var entries = [ChartDataEntry]()
        
        //for each element in given dataset
        //set X and Y coordinates in a data chart entry & add to entries list
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use entries object and a label string to make a LineChartDataSet
        //object
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        
        //customize graph
        dataSet.colors = ChartColorTemplates.colorful()
        
        //make object that will be added to chart and set it to the variable
        //in the Storyboard
        let data = LineChartData(dataSet: dataSet)
        lineChartBox.data = data
        
        //add settings for the chartbox
        lineChartBox.chartDescription?.text = "Pi Values"
        
        //setting animations
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }

    func graphPieChart(dataArray: [Int]) {
        //make lineChartBox size have width and height both equal to width of screen
        pieChartBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        
        //make box center to be horizontally centered but offset towards
        //top of screen
        pieChartBox.center.x = self.view.center.x
        pieChartBox.center.y = self.view.center.y //minus move up
        
        //settings when chart has no data
        pieChartBox.noDataText = "No Data Available"
        pieChartBox.noDataTextColor = UIColor.black
        
        //initialize array that will eventually be displayed on graph
        var entries = [ChartDataEntry]()
        
        //for each element in given dataset
        //set X and Y coordinates in a data chart entry & add to entries list
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use entries object and a label string to make a LineChartDataSet
        //object
        let dataSet = PieChartDataSet(entries: entries, label: "Pie Chart")
        
        //customize graph
        dataSet.colors = ChartColorTemplates.liberty()
        
        //make object that will be added to chart and set it to the variable
        //in the Storyboard
        let data = PieChartData(dataSet: dataSet)
        pieChartBox.data = data
        
        //add settings for the chartbox
        pieChartBox.chartDescription?.text = "Pi Values"
        
        //setting animations
        pieChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }
    
    func graphBarChart(dataArray: [Int]) {
        //make lineChartBox size have width and height both equal to width of screen
        barChartBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        
        //make box center to be horizontally centered but offset towards
        //top of screen
        barChartBox.center.x = self.view.center.x
        barChartBox.center.y = self.view.center.y + 240 //minus move up
        
        //settings when chart has no data
        barChartBox.noDataText = "No Data Available"
        barChartBox.noDataTextColor = UIColor.black
        
        //initialize array that will eventually be displayed on graph
        var entries = [BarChartDataEntry]()
        
        //for each element in given dataset
        //set X and Y coordinates in a data chart entry & add to entries list
        for i in 0..<dataArray.count {
            let value = BarChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use entries object and a label string to make a LineChartDataSet
        //object
        let dataSet = BarChartDataSet(entries: entries, label: "Bar Chart")
        
        //customize graph
        dataSet.colors = ChartColorTemplates.joyful()
        
        //make object that will be added to chart and set it to the variable
        //in the Storyboard
        let data = BarChartData(dataSet: dataSet)
        barChartBox.data = data
        
        //add settings for the chartbox
        barChartBox.chartDescription?.text = "Pi Values"
        
        //setting animations
        barChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }
}

