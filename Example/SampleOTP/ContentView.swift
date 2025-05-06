//
//  ContentView.swift
//  SampleOTP
//
//  Created by Bola Gamal on 5/5/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//


import SwiftUI
import SampleOTP


@available(iOS 13.0, *)
struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter OTP")
                .font(.headline)
                .bold()

            SampleOTPViewWrapper(
                model: SampleOTPViewUIModel(
                    length: 6,
                    space: 12,
                    font: .systemFont(ofSize: 20, weight: .medium),
                    textColor: .black,
                    tintColor: .systemBlue,
                    isSecureTextEntry: false,
                    placeholder: "-",
                    placeholderFont: .italicSystemFont(ofSize: 20),
                    placeholderColor: .lightGray,
                    borderWidth: 1.5,
                    borderColor: UIColor.gray.cgColor,
                    fieldCornerRadius: 8,
                    fieldBackgroundColor: .white,
                    animationOTP: .pulse,
                    typingOTPStyle: .active,
                    activeTextColor: .blue,
                    activeBorderColor: UIColor.systemGreen.cgColor,
                    activeBorderWidth: 2,
                    activeFieldCornerRadius: 10,
                    activeFieldBackgroundColor: .yellow.withAlphaComponent(0.2)
                ),
                onCompletion: { code in
                    print("Completed: \(code)")
                }
            )
            .frame(height: 60)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .shadow(radius: 3)
        }
        .padding()
    }
}

//MARK: - Preview
//@available(iOS 13.0, *)
//#Preview {
//    ContentView()
//}
