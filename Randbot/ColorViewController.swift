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
    
    var r: Int = 255
    var g: Int = 255
    var b: Int = 255
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorShow.layer.cornerRadius = 6

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
        colorShow.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        rgbIndex.setTitle("RGB (255, 255, 255)", for: .normal)

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
