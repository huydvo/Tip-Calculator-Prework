//
//  SettingViewController.swift
//  Tip Calculator-Prework
//
//  Created by Harry Vo on 9/12/18.
//  Copyright © 2018 Harry Vo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var tip1: UILabel!
    @IBOutlet var tip2: UILabel!
    @IBOutlet var tip3: UILabel!
    @IBOutlet var segmentDefault: UISegmentedControl!
    

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func stepper1(_ sender: UIStepper) {
        tip1.text = Int(sender.value).description + " %"
        defaults.set(Double(sender.value/100), forKey: "tip1")
        defaults.synchronize()
    }
    
    @IBAction func stepper2(_ sender: UIStepper) {
        tip2.text = Int(sender.value).description + " %"
        defaults.set(Double(sender.value/100), forKey: "tip2")
        defaults.synchronize()
    }
    
    @IBAction func stepper3(_ sender: UIStepper) {
          tip3.text = Int(sender.value).description + " %"
        defaults.set(Double(sender.value/100), forKey: "tip3")
        defaults.synchronize()
    }

    @IBAction func pickDefaultTip(_ sender: Any) {
        defaults.set(segmentDefault.selectedSegmentIndex, forKey: "segmentDefault")
        defaults.synchronize()
    }
    
    
    

}
