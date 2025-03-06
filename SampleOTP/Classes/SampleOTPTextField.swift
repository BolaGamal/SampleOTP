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
    
    func setPlaceholderColor(_ uiModel: SampleOTPViewUIModel) {
        if let placeholderColor = uiModel.placeholderColor {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: placeholderColor,
                .font: uiModel.font]
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
        }
    }
}
