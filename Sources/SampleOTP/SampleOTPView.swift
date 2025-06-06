//
//  SampleOTPView.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit

@IBDesignable
@objc public class SampleOTPView: UIView {
    // MARK: - Private Properties
    private let stackView = UIStackView()
    private(set) var debounceTimer: Timer?
    private(set) var styleHandler: SampleOTPStyleHandlerProtocol?
    private(set) var animationHandler: SampleOTPAnimationHandlerProtocol?
    private(set) var textFields: [SampleOTPTextField] = []
    private(set) var model: SampleOTPViewUIModel?
    
    public var didFinishEnteringOTP: ((String) -> Void)?
    
    // MARK: - Init
    @objc public override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    @objc public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
    }
    
    deinit {
        debounceTimer?.invalidate()
    }
    
    public func configure(with uiModel: SampleOTPViewUIModel) {
        self.model = uiModel
        self.styleHandler = SampleOTPStyleHandler(uiModel: uiModel)
        self.animationHandler = SampleOTPAnimationHandler(uiModel: uiModel)
        stackView.spacing = uiModel.space
        stackView.semanticContentAttribute = uiModel.layoutDirection
        stackView.subviews.forEach { $0.removeFromSuperview() }
        textFields.removeAll()
        
        for _ in 0..<uiModel.length {
            let textField = SampleOTPTextField(uiModel: uiModel)
            textField.delegate = self
            textField.otpTextFieldDelegate = self
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            textFields.append(textField)
            stackView.addArrangedSubview(textField)
        }
    }
}

// MARK: - Configuration
private extension SampleOTPView {
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Input Handling
private extension SampleOTPView {
    @objc func textFieldDidChange(_ textField: SampleOTPTextField) {
        handleTextFieldInput(textField)
    }
    
    func handleTextFieldInput(_ textField: SampleOTPTextField) {
        guard let text = textField.text, text.count == 1 else { return }
        animationHandler?.applyAnimation(to: textField)
        moveFocusToFirstEmptyField(for: textField)
        debounceCompletionCheck()
    }

    func debounceCompletionCheck() {
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            let otpCode = self.getOTP()
            if otpCode.count == self.textFields.count {
                self.didFinishEnteringOTP?(otpCode)
            }
        }
    }
}

// MARK: - Navigation (Next/Previous)
private extension SampleOTPView {
    func moveFocusToFirstEmptyField(for textField: SampleOTPTextField) {
        if let nextField = textFields.first(where: { $0.text?.isEmpty ?? true }) {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func moveFocusToNextField(for textField: SampleOTPTextField) {
        guard let index = textFields.firstIndex(of: textField) else { return }
        if index < textFields.count - 1 {
            textFields[index + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }

    func moveFocusToPreviousField(for textField: SampleOTPTextField) {
        if let previousFieldIndex = textFields.firstIndex(of: textField), previousFieldIndex > 0 {
            let previousField = textFields[previousFieldIndex - 1]
            previousField.text = ""
            previousField.becomeFirstResponder()
        }
    }
}

// MARK: - Validation
extension SampleOTPView {
    public func isValidOTP() -> Bool {
        let otp = getOTP()
        return otp.count == textFields.count && otp.allSatisfy { $0.isNumber }
    }
}

//MARK: - Public Functions
extension SampleOTPView {
    public func clearFields() {
        textFields.forEach {
            $0.text = ""
            styleHandler?.applyStyle(to: $0, isFocused: false)
        }
        textFields.first?.becomeFirstResponder()
    }
    
    public func getOTP() -> String {
        return textFields.compactMap { $0.text }.joined()
    }
    
    public func setEditable(_ isEditable: Bool) {
        textFields.forEach { $0.isUserInteractionEnabled = isEditable }
    }
    
    public func shakeView(duration: TimeInterval = 0.5, intensity: CGFloat = 10) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.duration = duration
        animation.values = [-intensity, intensity, -intensity * 0.8, intensity * 0.8, -intensity * 0.5, intensity * 0.5, 0]
        layer.add(animation, forKey: "shake")
    }
    
    public func setOTP(_ otp: String) {
        guard otp.count <= textFields.count else { return }
        
        for (index, char) in otp.enumerated() {
            textFields[index].text = String(char)
            styleHandler?.applyStyle(to: textFields[index], isFocused: false)
        }
        if otp.count == textFields.count {
            didFinishEnteringOTP?(getOTP())
        }
    }
}

//MARK: - UITextFieldDelegate
extension SampleOTPView: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let textField = textField as? SampleOTPTextField else { return }
        styleHandler?.applyStyle(to: textField, isFocused: true)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textField = textField as? SampleOTPTextField else { return }
        styleHandler?.applyStyle(to: textField, isFocused: false)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text, let textField = textField as? SampleOTPTextField else { return false }

        replaceFieldTextIfNeeded(for: textField, string: string)

        if isPasteOperation(string) {
            handlePaste(string)
            return false
        }
        if isStartWithSpace(currentText: text, newCharacter: string) {
            return false
        }
        return shouldAllowCharacterInput(currentText: text, newCharacter: string)
    }
    
    private func replaceFieldTextIfNeeded(for textField: SampleOTPTextField, string: String) {
        guard let text = textField.text, text.count == 1, string.count == 1, text != string else { return }
        textField.text = string
        moveFocusToNextField(for: textField)
        debounceCompletionCheck()
    }
    
    private func isPasteOperation(_ string: String) -> Bool {
        return string.count == textFields.count
    }
    
    private func handlePaste(_ string: String) {
        let filteredString = string.filter { $0.isNumber }
        DispatchQueue.main.async {
            self.setOTP(filteredString)
            if let lastField = self.textFields.last(where: { $0.text?.isEmpty ?? false }) {
                lastField.becomeFirstResponder()
            } else {
                ///Dismiss if all fields are filled
                self.endEditing(true)
            }
        }
    }
    
    private func isStartWithSpace(currentText: String, newCharacter: String) -> Bool {
        return currentText.isEmpty && newCharacter == " "
    }
    ///Handle single character input
    private func shouldAllowCharacterInput(currentText: String, newCharacter: String) -> Bool {
        return currentText.count + newCharacter.count <= 1
    }
}

//MARK: - SampleOTPTextFieldDelegate
extension SampleOTPView: SampleOTPTextFieldDelegate {
    
    func textFieldDidEnterBackspace(_ textField: SampleOTPTextField) {
        let text = textField.text
        textField.text = ""
        if text?.isEmpty ?? true { moveFocusToPreviousField(for: textField) }
        changeStyleForActiveField(for: textField)
    }
    
    private func changeStyleForActiveField(for textField: SampleOTPTextField) {
        guard let typingStyle = styleHandler?.getTypingStyle, typingStyle == .active else { return }
        self.styleHandler?.applyStyle(to: textField, isFocused: false)
    }
}
