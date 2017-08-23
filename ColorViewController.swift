//
//  ColorViewController.swift
//  Randbot
//
//  Created by iD Student on 8/23/17.
//  Copyright © 2017 ID Tech. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var colorShow: UIButton!
    
    @IBOutlet weak var rgbIndex: UIButton!
    
    var r: Int = 0
    var g: Int = 0
    var b: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorShow.layer.cornerRadius = 7

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func randomize(_ sender: Any) {
        r = Int(arc4random_uniform(255))
        g = Int(arc4random_uniform(255))
        b = Int(arc4random_uniform(255))
        colorShow.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        rgbIndex.setTitle("RGB (\(r), \(g), \(b))", for: .normal)
    }

    @IBAction func reset(_ sender: Any) {
        colorShow.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        rgbIndex.setTitle("RGB (0, 0, 0)", for: .normal)

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
