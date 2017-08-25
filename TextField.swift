//
//  TextField.swift
//  Randbot
//
//  Created by iD Student on 8/25/17.
//  Copyright © 2017 ID Tech. All rights reserved.
//

import UIKit

private var maxLengths = [UITextField: Int]()

extension UITextField {
    
    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            // Any text field with a set max length will call the limitLength
            // method any time it's edited (i.e. when the user adds, removes,
            // cuts, or pastes characters to/from the text field).
            addTarget(
                self,
                action: #selector(limitLength),
                for: UIControlEvents.editingChanged
            )
        }
    }
    
    func limitLength(textField: UITextField) {
        guard let prospectiveText = textField.text, prospectiveText.characters.count > maxLength else {
            return
        }
        
        // If the change in the text field's contents will exceed its maximum length,
        // allow only the first [maxLength] characters of the resulting text.
        let selection = selectedTextRange
        text = prospectiveText.substring(
            with: Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength))
        )
        selectedTextRange = selection
    }
    
}
