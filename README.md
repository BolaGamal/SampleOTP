<p align="center">
<img
src='https://github.com/BolaGamal/SampleOTP/blob/master/Resources/Images.xcassets/sampleOTP.imageset/sampleOTP.png' width="350" />
</р>

# SampleOTP

[![Build Status](https://api.travis-ci.com/BolaGamal/SampleOTP.svg?branch=master)](https://app.travis-ci.com/github/BolaGamal/SampleOTP)
[![SwiftPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen)](https://swift.org/package-manager/)
[![CocoaPods](https://img.shields.io/cocoapods/v/SampleOTP.svg)](https://cocoapods.org/pods/SampleOTP)
[![License](https://img.shields.io/cocoapods/l/SampleOTP.svg?style=flat)](https://github.com/BolaGamal/SampleOTP/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)

## 📌 Overview

`SampleOTP` is a Swift library designed to simplify the implementation of One-Time Password (OTP) input fields in iOS applications. It provides a **customizable** and **user-friendly** UI model that enhances the user experience during OTP entry.

![sampleOtpGif](https://github.com/BolaGamal/SampleOTP/blob/master/Resources/sampleOtpGif.gif)

---

## ✨ Features

SampleOTP gives you full control over the OTP input experience, combining simplicity with deep customization:

- ✅ **OTP Length** – Define how many digits the OTP should have.
- 🔐 **Secure Input Mode** – Mask OTP characters for sensitive inputs.
- 🎨 **Custom Appearance** – Adjust spacing, text color, font size, background color.
- 🎭 **Placeholder Customization** – Use any symbol or character.
- ✨ **Animation Styles** – Pulse, fadeIn, and bounce feedback animations.
- 🛠️ **Borders & Corners** – Customize border width, color, and corner radius (both normal and active states).
- 🎯 **Dynamic Typing Styles** – Automatically change styling when field is active or focused.
- ☑️ **Validation Support** – Easily check OTP completeness and validity.
- 📱 **SwiftUI Compatible** – Use with SwiftUI via a convenient wrapper.
- 🔁 **Supports both Swift Package Manager and CocoaPods**

---

## 📦 Installation

### 🔸 Swift Package Manager (SPM)

1. Open **Xcode > File > Add Packages**
2. Enter the URL:

```
https://github.com/BolaGamal/SampleOTP.git
```

3. Choose the version and add the package.

---

### 🔸 CocoaPods

If you prefer [CocoaPods](https://cocoapods.org/pods/SampleOTP):

Add the following line to your `Podfile`:

```ruby
pod 'SampleOTP'
```

Then run:

```bash
pod install
```

---

## 🛠️ Usage

### 1️⃣ **Import the Framework**
```swift
import SampleOTPView
```

---

### 2️⃣ **Adding `SampleOTPView` to Your ViewController**

#### 📌 **Using Storyboard:**
1. Drag a `UIView` onto your storyboard.
2. Set its class to `SampleOTPView`.
3. Connect it as an `IBOutlet`:

```swift
@IBOutlet weak var sampleOTP: SampleOTPView!
```

#### 📌 **Programmatic Approach:**
```swift
let sampleOTP = SampleOTPView()
```

---

### 3️⃣ **Configuring `SampleOTPViewUIModel`**

To fully customize the OTP input field, use `SampleOTPViewUIModel`:

```swift
let otpViewModel = SampleOTPViewUIModel(
    length: 6,                            // Number of OTP digits
    space: 10,                            // Spacing between OTP fields
    layoutDirection: .unspecified,        // RTL (Right-to-Left) Support
    font: .systemFont(ofSize: 18),        // Font for OTP input
    textColor: .black,                    // Color of entered text
    tintColor: .black,                    // Cursor color
    isSecureTextEntry: true,              // Mask OTP for security
    placeholder: "*",                     // Placeholder character
    placeholderColor: .gray,              // Color of placeholder
    borderWidth: 2,                       // Default border width
    borderColor: .gray,                   // Default border color
    fieldCornerRadius: 8,                 // Default corner radius
    fieldBackgroundColor: .white,         // Default field background

    // 🎬 Animation & Typing Style
    animationOTP: .pulse,                 // OTP field animation style
    typingOTPStyle: .active               // Style when typing OTP

    // 🟢 Active (Focused) State
    activeTextColor: .blue,               // Text color when active
    activeBorderColor: .green,            // Border color when active
    activeBorderWidth: 3,                 // Border width when active
    activeFieldCornerRadius: 10,          // Corner radius when active
    activeFieldBackgroundColor: .lightGray, // Background color when active
)

// Apply the configuration
sampleOTP.configure(with: otpViewModel)
```
---

## 🧩 SwiftUI Support

From iOS 13.0+, you can use `SampleOTPViewWrapper` in SwiftUI like this:

```swift
import SwiftUI
import SampleOTP

@available(iOS 13.0, *)
struct ContentView: View {
    var body: some View {
        SampleOTPViewWrapper(
            model: SampleOTPViewUIModel(
                length: 6,
                space: 10,
                font: .systemFont(ofSize: 18),
                textColor: .black,
                tintColor: .systemBlue,
                isSecureTextEntry: false,
                placeholder: "-",
                placeholderFont: .italicSystemFont(ofSize: 16),
                placeholderColor: .gray,
                borderWidth: 1.5,
                borderColor: .gray,
                fieldCornerRadius: 8,
                fieldBackgroundColor: .white,
                animationOTP: .pulse,
                typingOTPStyle: .active,
                activeTextColor: .blue,
                activeBorderColor: .systemGreen,
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
    }
}
```

---

## 📌 Example Project

To run the example project, clone the repo and execute:

```sh
pod install
```
inside the `Example` directory.

---

## 💡 Compatibility

- ✅ iOS 12.0+ for UIKit
- ✅ iOS 13.0+ for SwiftUI
- ✅ Supports both **CocoaPods** & **Swift Package Manager (SPM)**

---

## 👤 Author

Pola Gamal  
📧 bola.gamal222@gmail.com  

---

## 📜 License

`SampleOTP` is released under the MIT License. See [LICENSE](https://github.com/BolaGamal/SampleOTP/blob/master/LICENSE) for details.
