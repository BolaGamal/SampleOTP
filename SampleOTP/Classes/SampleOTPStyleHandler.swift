//
//  SampleOTPStyleHandler.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit


// MARK: - Style Handler
struct SampleOTPStyleHandler: SampleOTPStyleHandlerProtocol {
    private let uiModel: SampleOTPViewUIModel

    init(uiModel: SampleOTPViewUIModel) {
        self.uiModel = uiModel
    }

    var getTypingStyle: TypingOTPStyle? {
        uiModel.typingOTPStyle
    }
    
    func applyStyle(to textField: SampleOTPTextField, isFocused: Bool) {
        guard let typingStyle = uiModel.typingOTPStyle else { return }
        var isActive: Bool = false
        switch typingStyle {
        case .active:
            isActive = !(textField.text?.isEmpty ?? true)
        case .focused:
            isActive = isFocused
        }
        textField.textColor = isActive ? uiModel.activeTextColor : uiModel.textColor
        textField.layer.borderColor = isActive ? uiModel.activeBorderColor : uiModel.borderColor
        textField.layer.borderWidth = isActive ? uiModel.activeBorderWidth : uiModel.borderWidth
        textField.backgroundColor = isActive ? uiModel.activeFieldBackgroundColor : uiModel.fieldBackgroundColor
        textField.layer.cornerRadius = isActive ? uiModel.activeFieldCornerRadius : uiModel.fieldCornerRadius
    }
}

//MARK: - Helper Methods
extension SampleOTPStyleHandler {
    
    static func getTextFieldBorderColor(model: SampleOTPViewUIModel, isActive: Bool) -> CGColor {
        return isActive ? model.activeBorderColor : model.borderColor
    }

    static func getTextFieldBackgroundColor(model: SampleOTPViewUIModel, isActive: Bool) -> UIColor {
        return isActive ? model.activeFieldBackgroundColor : model.fieldBackgroundColor
    }

    static func getTextFieldCornerRadius(model: SampleOTPViewUIModel, isActive: Bool) -> CGFloat {
        return isActive ? model.activeFieldCornerRadius : model.fieldCornerRadius
    }

    static func getTextFieldBorderWidth(model: SampleOTPViewUIModel, isActive: Bool) -> CGFloat {
        return isActive ? model.activeBorderWidth : model.borderWidth
    }
}
