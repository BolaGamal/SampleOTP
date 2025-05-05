//
//  SampleOTPAnimationHandler.swift
//  SampleOTP
//
//  Created by Bola Gamal on 12/27/24.
//

import UIKit


// MARK: - Animation Handler
struct SampleOTPAnimationHandler: SampleOTPAnimationHandlerProtocol {
    private let uiModel: SampleOTPViewUIModel

    init(uiModel: SampleOTPViewUIModel) {
        self.uiModel = uiModel
    }

    func applyAnimation(to textField: SampleOTPTextField)  {
        guard let animationType = uiModel.animationOTP else { return }
        switch animationType {
        case .pulse:
            UIView.animate(withDuration: 0.2, animations: {
                textField.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    textField.transform = .identity
                }
            }
        case .fadeIn:
            textField.alpha = 0.5
            UIView.animate(withDuration: 0.3) {
                textField.alpha = 1.0
            }
        case .bounce:
            UIView.animate(withDuration: 0.2, animations: {
                textField.transform = CGAffineTransform(translationX: 0, y: -5)
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    textField.transform = .identity
                }
            }
        }
    }
}

