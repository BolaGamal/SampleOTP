//
//  SampleOTPViewUIModel.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit

//MARK: Typing Styles
public enum TypingOTPStyle {
    case active, focused
}

//MARK: - UIModel
public struct SampleOTPViewUIModel {
    
    public enum AnimationOTP {
        case pulse, fadeIn, bounce
    }
    
    public let length: Int
    public let space: CGFloat
    
    //textField attribute
    public let font: UIFont
    public let textColor: UIColor
    public var tintColor: UIColor?
    public let isSecureTextEntry: Bool
    public let placeholder: String
    public var placeholderColor: UIColor?
    public let borderWidth: CGFloat
    public let borderColor: UIColor
    public let fieldCornerRadius: CGFloat
    public let fieldBackgroundColor: UIColor
    
    //animation
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
        font: UIFont = UIFont.systemFont(ofSize: 18),
        textColor: UIColor = .black,
        tintColor: UIColor? = nil,
        isSecureTextEntry: Bool = false,
        placeholder: String = "",
        placeholderColor: UIColor? = nil,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .clear,
        fieldCornerRadius: CGFloat = 6,
        fieldBackgroundColor: UIColor = .clear,
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
        self.font = font
        self.textColor = textColor
        self.tintColor = tintColor
        self.isSecureTextEntry = isSecureTextEntry
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.fieldCornerRadius = fieldCornerRadius
        self.fieldBackgroundColor = fieldBackgroundColor
        self.animationOTP = animationOTP
        self.typingOTPStyle = typingOTPStyle
        self.activeTextColor = activeTextColor ?? self.textColor
        self.activeBorderColor = activeBorderColor ?? self.borderColor
        self.activeBorderWidth = activeBorderWidth ?? self.borderWidth
        self.activeFieldCornerRadius = activeFieldCornerRadius ?? self.fieldCornerRadius
        self.activeFieldBackgroundColor = activeFieldBackgroundColor ?? self.fieldBackgroundColor
    }
}
