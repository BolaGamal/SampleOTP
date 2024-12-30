<p align="center">
<img
src='https://github.com/BolaGamal/SampleOTP/blob/master/Example/SampleOTP/Images.xcassets/sampleOTP.imageset/sampleOTP.png' width="200" />
</р>

# SampleOTP

[![CI Status](https://img.shields.io/travis/BolaGamal/SampleOTP.svg?style=flat)](https://travis-ci.org/BolaGamal/SampleOTP)
[![Version](https://img.shields.io/cocoapods/v/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)
[![License](https://img.shields.io/cocoapods/l/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)
[![Platform](https://img.shields.io/cocoapods/p/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)

## Overview

`SampleOTP` is a Swift library designed to simplify the implementation of One-Time Password (OTP) input fields in iOS applications. It provides a customizable and user-friendly UI model that enhances the user experience during OTP entry.

![sampleOtpGif](https://github.com/BolaGamal/SampleOTP/blob/master/Example/SampleOTP/Resources/sampleOtpGif.gif)

## Features

The `SampleOTPViewUIModel` struct allows developers to configure various aspects of the OTP input field, including:

- **Length**: Specify the number of OTP characters.
- **Space**: Control the spacing between OTP input fields.
- **Text Color**: Set the color of the entered text.
- **Secure Text Entry**: Option to mask the entered text for security.
- **Placeholder**: Define a placeholder string to guide users.
- **Font Size**: Customize the font size of the OTP input.
- **Border Properties**: Adjust the border width, color, and corner radius for both active and default states.
- **Background Color**: Set the background color of the input fields.
- **Animations**: Choose from various animation styles for enhancing user interaction (e.g., pulse, fadeIn, bounce).
- **Typing Styles**: Customize the appearance of the input field when active or focused.

## Usage

To utilize the `SampleOTPViewUIModel`, initialize it with your desired parameters to create a visually appealing and functional OTP input field.

```swift
let otpViewModel = SampleOTPViewUIModel(
    length: 6,
    space: 10,
    textColor: .black,
    isSecureTextEntry: true,
    placeholder: "*",
    fontSize: 16,
    borderWidth: 2,
    borderColor: .gray,
    fieldCornerRadius: 8,
    fieldBackgroundColor: .white,
    animationOTP: .pulse,
    typingOTPStyle: .active,
    activeTextColor: .blue,
    activeBorderColor: .green,
    activeBorderWidth: 3,
    activeFieldCornerRadius: 10,
    activeFieldBackgroundColor: .lightGray
)
```
## Installation

SampleOTP is available through [CocoaPods](https://cocoapods.org/pods/SampleOTP). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SampleOTP'
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Pola Gamal, bola.gamal222@gmail.com

## License

SampleOTP is available under the MIT license. See the LICENSE file for more info.
