//
//  NumberViewController.swift
//  Randbot
//
//  Created by iD Student on 8/23/17.
//  Copyright © 2017 ID Tech. All rights reserved.
//

import UIKit

class NumberViewController: UIViewController{
    
    @IBOutlet weak var randomize: UIButton!
    
    @IBOutlet weak var randomizedLetter: UIButton!

    @IBOutlet weak var done: UIButton!
    
    var firstNum : Int = 0
    var lastNum : Int = 100
    
    @IBOutlet weak var minimum: UITextField!
    @IBOutlet weak var maximum: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        done.isEnabled = false
        done.isHidden = true
        randomize.isEnabled = true
        randomize.isHidden = false
    }
    
    @IBAction func minimumBegin(_ sender: Any) {
        randomizedLetter.setTitle("", for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(NumberViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        done.isEnabled = true
        done.isHidden = false
        randomize.isEnabled = false
        randomize.isHidden = true
        if minimum.text == "0"{
            minimum.text = ""
        }
    }
    
    @IBAction func maxBegin(_ sender: Any) {
        randomizedLetter.setTitle("", for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(NumberViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        done.isEnabled = true
        done.isHidden = false
        randomize.isEnabled = false
        randomize.isHidden = true
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = -keyboardSize.height
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
            self.view.frame.origin.y = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choseDone(_ sender: Any) {
            done.isEnabled = false
            done.isHidden = true
            randomize.isEnabled = true
            randomize.isHidden = false
            self.view.frame.origin.y = 0
        if Int((minimum.text?.characters.count)!) > 5{
            var alert : UIAlertController
            alert = UIAlertController(title: "Oooops!", message: "The value you set is way too large! Try something smaller!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
            minimum.clearsOnBeginEditing = true
        }else if Int((maximum.text?.characters.count)!) > 5{
            var alert : UIAlertController
            alert = UIAlertController(title: "Oooops!", message: "The value you set is way too large! Try something smaller!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
            maximum.clearsOnBeginEditing = true
        }else{
            if minimum.text == "" {
                firstNum = 0
                minimum.text = "0"
            }else{
                firstNum = Int(minimum.text!)!
            }
            if maximum.text == "" {
                lastNum = 100
                maximum.text = "100"
            }else{
                lastNum = Int(maximum.text!)!
            }
            var alert : UIAlertController
            if firstNum >= lastNum{
                alert = UIAlertController(title: "Oooops!", message: "'Minimum' value should be less than 'maximum' value!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true)
                minimum.clearsOnBeginEditing = true
                maximum.clearsOnBeginEditing = true
            }else{
                minimum.resignFirstResponder()
                maximum.resignFirstResponder()
                minimum.clearsOnBeginEditing = false
                maximum.clearsOnBeginEditing = false
            }
        }

    }
    
    @IBAction func randomizing(_ sender: Any) {
        let num: String = String(Int(Double(arc4random_uniform(UInt32(Double(lastNum - firstNum + 1))))) + firstNum)
        randomizedLetter.setTitle(num, for: .normal)
    }
    
   @IBAction func reset(_ sender: Any) {
        randomizedLetter.setTitle("", for: .normal)
        firstNum = 0
        lastNum = 100
        minimum.text = "0"
        maximum.text = "100"
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
