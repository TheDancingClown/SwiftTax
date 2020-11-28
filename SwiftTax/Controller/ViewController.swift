//
//  ViewController.swift
//  SwiftTax
//
//  Created by Louis Kirkham on 26/11/2020.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var taxYearPicker: UIPickerView!
    @IBOutlet weak var salaryEntry: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    var taxYearSelectionData: [String] = [String]()
    var taxYearSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taxYearPicker.delegate = self
        self.taxYearPicker.dataSource = self
        taxYearSelectionData = ["2019/20", "2020/21"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return taxYearSelectionData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        taxYearSelected = taxYearSelectionData[row]
        return taxYearSelectionData[row]
    }
    
    @IBAction func calculateBtnPressed(_ sender: Any) {
        let calc: TakeHomeCalculator
        switch taxYearSelected {
        case "2019/20":
            calc = TakeHomeCalculator201920()
        case "2020/21":
            calc = TakeHomeCalculator202021()
        default:
            calc = TakeHomeCalculator201920()
        }
        let takeHome = calc.calculateNet(gross: Double(salaryEntry.text!) ?? 0.00)
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.numberStyle = .currency
        resultsLabel.text = formatter.string(from: takeHome as NSNumber)
        //need to extract the formatting
    }
    
}

