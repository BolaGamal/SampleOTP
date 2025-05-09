//
//  SampleOTPViewUIModel.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit


//MARK: - UIModel
public struct SampleOTPViewUIModel: Equatable {
    //MARK: Enums
    public enum AnimationOTP {
        case pulse, fadeIn, bounce
    }
    
    public enum TypingOTPStyle {
        case active, focused
    }
    
    //MARK: Properties
    public let length: Int
    public let space: CGFloat
    public let layoutDirection: UISemanticContentAttribute
    
    //textField attribute
    public let font: UIFont
    public let textColor: UIColor
    public var tintColor: UIColor?
    public let isSecureTextEntry: Bool
    public let placeholder: String
    public var placeholderFont: UIFont?
    public var placeholderColor: UIColor?
    public let borderWidth: CGFloat
    public let borderColor: CGColor
    public let fieldCornerRadius: CGFloat
    public let fieldBackgroundColor: UIColor
    public let keyboardType: UIKeyboardType
    public let textAlignment: NSTextAlignment
    
    //animation
    public let animationOTP: AnimationOTP?
    
    //active style
    public let typingOTPStyle: TypingOTPStyle?
    public let activeTextColor: UIColor
    public let activeBorderColor: CGColor
    public let activeBorderWidth: CGFloat
    public let activeFieldCornerRadius: CGFloat
    public let activeFieldBackgroundColor: UIColor
    
    public init(
        length: Int = 5,
        space: CGFloat = 10,
        layoutDirection: UISemanticContentAttribute = .forceLeftToRight,
        font: UIFont = UIFont.systemFont(ofSize: 18),
        textColor: UIColor = .black,
        tintColor: UIColor? = nil,
        isSecureTextEntry: Bool = false,
        placeholder: String = "",
        placeholderFont: UIFont? = nil,
        placeholderColor: UIColor? = nil,
        borderWidth: CGFloat = 0,
        borderColor: CGColor = UIColor.clear.cgColor,
        fieldCornerRadius: CGFloat = 6,
        fieldBackgroundColor: UIColor = .clear,
        keyboardType: UIKeyboardType = .asciiCapableNumberPad,
        textAlignment: NSTextAlignment = .center,
        animationOTP: AnimationOTP? = nil,
        typingOTPStyle: TypingOTPStyle? = nil,
        activeTextColor: UIColor? = nil,
        activeBorderColor: CGColor? = nil,
        activeBorderWidth: CGFloat? = nil,
        activeFieldCornerRadius: CGFloat? = nil,
        activeFieldBackgroundColor: UIColor? = nil)
    {
        self.length = length
        self.space = space
        self.layoutDirection = layoutDirection
        self.font = font
        self.textColor = textColor
        self.tintColor = tintColor
        self.isSecureTextEntry = isSecureTextEntry
        self.placeholder = placeholder
        self.placeholderFont = placeholderFont
        self.placeholderColor = placeholderColor
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.fieldCornerRadius = fieldCornerRadius
        self.fieldBackgroundColor = fieldBackgroundColor
        self.keyboardType = keyboardType
        self.textAlignment = textAlignment
        self.animationOTP = animationOTP
        self.typingOTPStyle = typingOTPStyle
        self.activeTextColor = activeTextColor ?? self.textColor
        self.activeBorderColor = activeBorderColor ?? self.borderColor
        self.activeBorderWidth = activeBorderWidth ?? self.borderWidth
        self.activeFieldCornerRadius = activeFieldCornerRadius ?? self.fieldCornerRadius
        self.activeFieldBackgroundColor = activeFieldBackgroundColor ?? self.fieldBackgroundColor
    }
}
