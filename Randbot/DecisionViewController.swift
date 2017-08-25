//
//  DecisionViewController.swift
//  Randbot
//
//  Created by iD Student on 8/24/17.
//  Copyright © 2017 ID Tech. All rights reserved.
//

import UIKit

class DecisionViewController: UIViewController {

    var n: Int = 0
    var i: Int = 1
    
    @IBOutlet weak var result: UIButton!

        // Do any additional setup after loading the view.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func randomizing(_ sender: Any) {
        
        n = 0
        i = 1
        
        while i <= 5{
            
            let x = Double(arc4random_uniform(6))
            
            if x < 3{
                n = n - 1
            }else if x >= 3{
                n = n + 1
            }
            
            i = i + 1
        }
        
        if n > 0{
            result.setTitle("YES", for: .normal)
            result.setTitleColor(UIColor(red: 97/255, green: 219/255, blue: 109/255, alpha: 1.0), for: .normal)
        }
        
        if n < 0{
            result.setTitle("NO", for: .normal)
            result.setTitleColor(UIColor(red: 252/255, green: 13/255, blue: 27/255, alpha: 1.0), for: .normal)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        result.setTitle("", for: .normal)
        i = 1
        n = 0
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
