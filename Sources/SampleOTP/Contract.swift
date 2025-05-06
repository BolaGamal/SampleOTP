//
//  Contract.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

//MARK: - OTP TextField Delegate
protocol SampleOTPTextFieldDelegate: AnyObject {
    func textFieldDidEnterBackspace(_ textField: SampleOTPTextField)
}


// MARK: - Style Handler Protocol
protocol SampleOTPStyleHandlerProtocol {
    var getTypingStyle: TypingOTPStyle? { get }
    func applyStyle(to textField: SampleOTPTextField, isFocused: Bool)
}


// MARK: - Animation Handler Protocol
protocol SampleOTPAnimationHandlerProtocol {
    func applyAnimation(to textField: SampleOTPTextField)
}
