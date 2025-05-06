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

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(uiModel: SampleOTPViewUIModel) {
        self.init(frame: .zero)
        setup(with: uiModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func deleteBackward() {
        otpTextFieldDelegate?.textFieldDidEnterBackspace(self)
        super.deleteBackward()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.paste(_:))
    }
    
    private func setup(with uiModel: SampleOTPViewUIModel) {
        self.font = uiModel.font
        self.textAlignment = uiModel.textAlignment
        self.textColor = uiModel.textColor
        self.placeholder = uiModel.placeholder
        self.keyboardType = uiModel.keyboardType
        self.isSecureTextEntry = uiModel.isSecureTextEntry
        self.backgroundColor = uiModel.fieldBackgroundColor
        self.layer.borderWidth = uiModel.borderWidth
        self.layer.borderColor = uiModel.borderColor
        self.layer.cornerRadius = uiModel.fieldCornerRadius
        self.setAttributedPlaceholder(uiModel)
        if let tintColor = uiModel.tintColor { self.tintColor = tintColor }
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
