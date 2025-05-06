//
//  SampleOTPTextField.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit


//MARK: - OTP TextField
class SampleOTPTextField: UITextField {
    weak var otpTextFieldDelegate: SampleOTPTextFieldDelegate?
    
    override func deleteBackward() {
        otpTextFieldDelegate?.textFieldDidEnterBackspace(self)
        super.deleteBackward()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.paste(_:))
    }
    
}

//MARK: - Helper Methods
extension SampleOTPTextField {
    
    func setAttributedPlaceholder(_ uiModel: SampleOTPViewUIModel) {
        guard uiModel.placeholderColor != nil ||
        uiModel.placeholderFont != nil else { return }
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if let placeholderFont = uiModel.placeholderFont {
            attributes[.font] = placeholderFont
        }
        
        if let placeholderColor = uiModel.placeholderColor {
            attributes[.foregroundColor] = placeholderColor
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
    }
}
