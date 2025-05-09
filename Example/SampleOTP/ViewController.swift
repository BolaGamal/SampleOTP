//
//  ViewController.swift
//  SampleOTP
//
//  Created by BolaGamal on 12/26/2024.
//  Copyright (c) 2024 BolaGamal. All rights reserved.
//

import UIKit
import SampleOTP

class ViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet private weak var basicOTP: SampleOTPView!
    @IBOutlet private weak var focusedOTP: SampleOTPView!
    @IBOutlet private weak var activeOTP: SampleOTPView!
    @IBOutlet private weak var animationOTP1: SampleOTPView!
    @IBOutlet private weak var animationOTP2: SampleOTPView!
    @IBOutlet private weak var animationOTP3: SampleOTPView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testBasicOTP()
        testActiveOTP()
        testFocusedOTP()
        testPulseAnimationOTP()
        testBounceAnimationOTP()
        testFadeInAnimationOTP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    @IBAction func clearAction(_ sender: Any) {
        animationOTP3.clearFields()
    }
    
    @IBAction func validateAction(_ sender: Any) {
        animationOTP3.shakeView()
    }
}

//MARK: - Demo Testing
extension ViewController {
    
    private func testBasicOTP() {
        basicOTP.configure(with: SampleOTPViewUIModel(fieldBackgroundColor: .white))
    }
    
    private func testFocusedOTP() {
        focusedOTP.configure(
            with: SampleOTPViewUIModel(
                borderWidth: 1.5,
                fieldBackgroundColor: .white,
                typingOTPStyle: .focused,
                activeBorderColor: UIColor.red.cgColor)
        )
    }
    
    private func testActiveOTP() {
        activeOTP.configure(
            with: SampleOTPViewUIModel(
                fieldBackgroundColor: .white,
                typingOTPStyle: .active,
                activeTextColor: .white,
                activeFieldBackgroundColor: .purple)
        )
    }
    
    private func testBounceAnimationOTP() {
        animationOTP1.configure(
            with: SampleOTPViewUIModel(
                fieldBackgroundColor: .white,
                animationOTP: .bounce,
                typingOTPStyle: .active,
                activeTextColor: .white,
                activeFieldBackgroundColor: .purple)
        )
    }
    
    private func testFadeInAnimationOTP() {
        animationOTP2.configure(
            with: SampleOTPViewUIModel(
                fieldBackgroundColor: .white,
                animationOTP: .fadeIn,
                typingOTPStyle: .active,
                activeTextColor: .white,
                activeFieldBackgroundColor: .purple)
        )
    }
    
    private func testPulseAnimationOTP() {
        animationOTP3.configure(
            with: SampleOTPViewUIModel(
                fieldBackgroundColor: .white,
                animationOTP: .pulse,
                typingOTPStyle: .active,
                activeTextColor: .white,
                activeFieldBackgroundColor: .purple)
        )
    }
}
