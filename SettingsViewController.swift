//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Ray Sy on 8/12/17.
//  Copyright © 2017 Ray Sy. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Load our settings
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "defaultTip")
        defaultTipSelector.selectedSegmentIndex = intValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissSettingsView(_ sender: Any) {
        
        // Save our results
        let defaultTipSegmentIndex = defaultTipSelector.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTipSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
