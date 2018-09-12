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
        var tipPercentages:[Double] = [0.18,0.20,0.25]
        tipPercentages[0] = defaults.double(forKey: "tip1") ?? 0.180
        tipPercentages[1] = defaults.double(forKey: "tip2") ?? 0.20
        tipPercentages[2] = defaults.double(forKey: "tip3") ?? 0.25

        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        //TODO Check with TA why this doesnt run
        perPersonCost.text = Int(ceil(  Double(totalLabel.text!) ?? 0 / (Double(people.text!) ?? 1))).description
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        tipControl.setTitle(String(defaults.double(forKey: "tip1")*100), forSegmentAt: 0)
        tipControl.setTitle(String(defaults.double(forKey: "tip2")*100), forSegmentAt: 1)
        tipControl.setTitle(String(defaults.double(forKey: "tip3")*100), forSegmentAt: 2)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "segmentDefault")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
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
}

