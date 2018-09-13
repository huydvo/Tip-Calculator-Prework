//
//  ViewController.swift
//  Tip Calculator-Prework
//
//  Created by Harry Vo on 9/11/18.
//  Copyright © 2018 Harry Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var people: UILabel!
    @IBOutlet var perPersonCost: UILabel!
    let defaults = UserDefaults.standard
    var total:Double = 0.0
    var tip:Double = 0.0
    var tipPercentages:[Double] = [0.18,0.20,0.25]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.keyboardType = UIKeyboardType.decimalPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //var tipPercentages:[Double] = [0.18,0.20,0.25]
        if(defaults.double(forKey: "tip1") != 0.0){
            tipPercentages[0] = defaults.double(forKey: "tip1")}
        if(defaults.double(forKey: "tip2") != 0.0){
            tipPercentages[1] = defaults.double(forKey: "tip2")}
        if(defaults.double(forKey: "tip3") != 0.0){
            tipPercentages[2] = defaults.double(forKey: "tip3")}
        let bill = Double(billField.text!) ?? 0
        tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        //tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = formatCurrency(value: tip)
        totalLabel.text = formatCurrency(value: total)
        perPersonCost.text =  totalLabel.text
    }
    
    @IBAction func stepperPeople(_ sender: UIStepper) {
        var suffix: String
        if (Int(sender.value) == 1){
            suffix = " person"
        }
        else{
            suffix = " people"
        }
        people.text = Int(sender.value).description + suffix
        perPersonCost.text =  formatCurrency(value: (ceil(total/Double(sender.value))))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        if(defaults.double(forKey: "tip1") != 0){
        tipControl.setTitle(String(Int(defaults.double(forKey: "tip1")*100)) + " %", forSegmentAt: 0)
        }
        if(defaults.double(forKey: "tip2") != 0){
        tipControl.setTitle(String(Int(defaults.double(forKey: "tip2")*100)) + " %", forSegmentAt: 1)
        }
        if(defaults.double(forKey: "tip3") != 0){
        tipControl.setTitle(String(Int(defaults.double(forKey: "tip3")*100)) + " %", forSegmentAt: 2)
        }
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "segmentDefault")
        let bill = Double(billField.text!) ?? 0
        tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        totalLabel.text = formatCurrency(value: total)
        tipLabel.text = formatCurrency(value: tip)
        perPersonCost.text = totalLabel.text
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    func formatCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: value as NSNumber)
        return result!
    }
}

