//
//  SampleOTPViewUIModel.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit


public enum TypingOTPStyle {
    case active, focused
}

public struct SampleOTPViewUIModel {
    
    public enum AnimationOTP {
        case pulse, fadeIn, bounce
    }
    
    public let length: Int
    public let space: CGFloat
    public let textColor: UIColor
    public let isSecureTextEntry: Bool
    public let placeholder: String
    public let fontSize: CGFloat
    public let borderWidth: CGFloat
    public let borderColor: UIColor
    public let fieldCornerRadius: CGFloat
    public let fieldBackgroundColor: UIColor
    public let animationOTP: AnimationOTP?
    
    //active style
    public let typingOTPStyle: TypingOTPStyle?
    public let activeTextColor: UIColor
    public let activeBorderColor: UIColor
    public let activeBorderWidth: CGFloat
    public let activeFieldCornerRadius: CGFloat
    public let activeFieldBackgroundColor: UIColor
    
    public init(
        length: Int = 5,
        space: CGFloat = 10,
        textColor: UIColor = .black,
        isSecureTextEntry: Bool = false,
        placeholder: String = "",
        fontSize: CGFloat = 18.0,
        borderWidth: CGFloat = 1.5,
        borderColor: UIColor = .clear,
        fieldCornerRadius: CGFloat = 6,
        fieldBackgroundColor: UIColor = .white,
        animationOTP: AnimationOTP? = nil,
        typingOTPStyle: TypingOTPStyle? = nil,
        activeTextColor: UIColor? = nil,
        activeBorderColor: UIColor? = nil,
        activeBorderWidth: CGFloat? = nil,
        activeFieldCornerRadius: CGFloat? = nil,
        activeFieldBackgroundColor: UIColor? = nil)
    {
        self.length = length
        self.space = space
        self.textColor = textColor
        self.isSecureTextEntry = isSecureTextEntry
        self.placeholder = placeholder
        self.fontSize = fontSize
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.fieldBackgroundColor = fieldBackgroundColor
        self.fieldCornerRadius = fieldCornerRadius
        self.animationOTP = animationOTP
        self.typingOTPStyle = typingOTPStyle
        self.activeTextColor = activeTextColor ?? self.textColor
        self.activeBorderColor = activeBorderColor ?? self.borderColor
        self.activeBorderWidth = activeBorderWidth ?? self.borderWidth
        self.activeFieldCornerRadius = activeFieldCornerRadius ?? self.fieldCornerRadius
        self.activeFieldBackgroundColor = activeFieldBackgroundColor ?? self.fieldBackgroundColor
    }
}
