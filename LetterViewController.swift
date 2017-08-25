//
//  LetterViewController.swift
//  Randbot
//
//  Created by iD Student on 8/21/17.
//  Copyright © 2017 ID Tech. All rights reserved.
//

import UIKit

class LetterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var firstChosen: UIButton!
    @IBOutlet weak var lastChosen: UIButton!
    
    @IBOutlet weak var from: UIButton!
    @IBOutlet weak var to: UIButton!
    
    @IBOutlet weak var value: UIPickerView!
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var randomize: UIButton!
    
    @IBOutlet weak var randomizedLetter: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    var n : Int = 0
    var firstNum : Int = 1
    var lastNum : Int = 4

    
    @IBOutlet weak var done: UIButton!
    
    
    private var letterChecker: Bool? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        value.isHidden = true
        done.isHidden = true
        randomize.isHidden = false
        
        value.dataSource = self
        value.delegate = self
        
        pickerData = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


        // Do any additional setup after loading the view.
    }
    
    func myFunc (letter : String){
        for (index, element) in pickerData.enumerated() {
            if letter == element {
                n = index + 1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
               // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    
    @IBAction func firstLetterChoser(_ sender: Any) {
        value.isHidden = false
        letterChecker = false
        done.isHidden = false
        randomize.isHidden = true
        from.setTitleColor(.red, for: .normal)
        firstChosen.setTitleColor(.red, for: .normal)
        to.isEnabled = false
        lastChosen.isEnabled = false
        randomizedLetter.isHidden = true
        randomizedLetter.setTitle(" ", for: .normal)
        resetButton.isEnabled = false
    }
    
    @IBAction func fromChoser(_ sender: Any) {
        value.isHidden = false
        letterChecker = false
        done.isHidden = false
        randomize.isHidden = true
        from.setTitleColor(.red, for: .normal)
        firstChosen.setTitleColor(.red, for: .normal)
        to.isEnabled = false
        lastChosen.isEnabled = false
        randomizedLetter.isHidden = true
        randomizedLetter.setTitle(" ", for: .normal)
        resetButton.isEnabled = false
    }
   
      @IBAction func lastLetterChoser(_ sender: Any) {
        value.isHidden = false
        letterChecker = true
        done.isHidden = false
        randomize.isHidden = true
        to.setTitleColor(.red, for: .normal)
        lastChosen.setTitleColor(.red, for: .normal)
        from.isEnabled = false
        firstChosen.isEnabled = false
        randomizedLetter.isHidden = true
        randomizedLetter.setTitle(" ", for: .normal)
        resetButton.isEnabled = false
    }
    
    @IBAction func toChoser(_ sender: Any) {
        value.isHidden = false
        letterChecker = true
        done.isHidden = false
        randomize.isHidden = true
        to.setTitleColor(.red, for: .normal)
        lastChosen.setTitleColor(.red, for: .normal)
        from.isEnabled = false
        firstChosen.isEnabled = false
        randomizedLetter.isHidden = true
        randomizedLetter.setTitle(" ", for: .normal)
        resetButton.isEnabled = false
    }

    
    
    @IBAction func choseDone(_ sender: Any) {
        
        let selectedValue = pickerData[value.selectedRow(inComponent: 0)]
        myFunc(letter: selectedValue)
        from.isEnabled = true
        to.isEnabled = true
        firstChosen.isEnabled = true
        lastChosen.isEnabled = true
        from.setTitleColor(.black, for: .normal)
        to.setTitleColor(.black, for: .normal)
        firstChosen.setTitleColor(.black, for: .normal)
        lastChosen.setTitleColor(.black, for: .normal)
        randomizedLetter.isHidden = false
        resetButton.isEnabled = true
        
        if letterChecker == false{
            firstChosen.setTitle(selectedValue, for: .normal)
            letterChecker = nil
            value.isHidden = true
            done.isHidden = true
            firstNum = n
            randomize.isHidden = false
        }else if letterChecker == true {
            lastChosen.setTitle(selectedValue, for: .normal)
            letterChecker = nil
            value.isHidden = true
            done.isHidden = true
            lastNum = n
            randomize.isHidden = false
        }
        
        var alert : UIAlertController
        if firstNum >= lastNum{
            alert = UIAlertController(title: "Oooops!", message: "'From' value and 'to' value should be set in an alphabetical order!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        }
    }
  
    @IBAction func randomizing(_ sender: Any) {
        var alert : UIAlertController
        if firstNum >= lastNum{
            alert = UIAlertController(title: "Oooops!", message: "'From' value and 'to' value should be set in an alphabetical order!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        }else{
        randomizedLetter.setTitle(pickerData[Int(Double(arc4random_uniform(UInt32(Double(lastNum - firstNum + 1))))) + firstNum - 1], for: .normal)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        randomizedLetter.setTitle(" ", for: .normal)
        value.isHidden = true
        firstNum = 1
        lastNum = 4
        firstChosen.setTitle("A", for: .normal)
        lastChosen.setTitle("D", for: .normal)
        letterChecker = nil
    }
}
