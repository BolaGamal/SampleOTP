//
//  SampleOTPViewWrapper.swift
//  SampleOTP
//
//  Created by Bola Gamal on 5/5/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//


import UIKit
import SwiftUI

public struct SampleOTPViewWrapper: UIViewRepresentable {
    public var model: SampleOTPViewUIModel
    public var onCompletion: ((String) -> Void)?

    public init(model: SampleOTPViewUIModel, onCompletion: ((String) -> Void)? = nil) {
        self.model = model
        self.onCompletion = onCompletion
    }

    public func makeUIView(context: Context) -> SampleOTPView {
        let otpView = SampleOTPView()
        otpView.configure(with: model)
        otpView.didFinishEnteringOTP = onCompletion
        return otpView
    }

    public func updateUIView(_ uiView: SampleOTPView, context: Context) {
        if uiView.model != model {
            uiView.configure(with: model)
        }
    }
}
