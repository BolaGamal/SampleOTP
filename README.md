<p align="center">
<img
src='https://github.com/BolaGamal/SampleOTP/blob/master/Example/SampleOTP/Images.xcassets/sampleOTP.imageset/sampleOTP.png' width="350" />
</р>

# SampleOTP

[![CI Status](https://img.shields.io/travis/BolaGamal/SampleOTP.svg?style=flat)](https://travis-ci.org/BolaGamal/SampleOTP)
[![Version](https://img.shields.io/cocoapods/v/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)
[![License](https://img.shields.io/cocoapods/l/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)
[![Platform](https://img.shields.io/cocoapods/p/SampleOTP.svg?style=flat)](https://cocoapods.org/pods/SampleOTP)

## 📌 Overview

`SampleOTP` is a Swift library designed to simplify the implementation of One-Time Password (OTP) input fields in iOS applications. It provides a **customizable** and **user-friendly** UI model that enhances the user experience during OTP entry.

![sampleOtpGif](https://github.com/BolaGamal/SampleOTP/blob/master/Example/SampleOTP/Resources/sampleOtpGif.gif)

---

## 🚀 Features

- ✅ **OTP Length** – Define the number of OTP digits.
- 🎨 **Customizable Appearance** – Adjust spacing, text color, font, and background.
- 🔒 **Secure Entry Mode** – Option to mask OTP input.
- ✨ **Animated Feedback** – Various animation styles (`pulse`, `fadeIn`, `bounce`).
- 🎭 **Custom Placeholder** – Use any character or symbol as a placeholder.
- 🎯 **Dynamic Typing Styles** – Modify field appearance when (`active`, `focused`).
- 🛠️ **Border & Corner Customization** – Set width, color, radius for normal & active states.

---

## 📥 Installation

### CocoaPods

`SampleOTP` is available via [CocoaPods](https://cocoapods.org/pods/SampleOTP).  
To install it, simply add the following line to your `Podfile`:

```ruby
pod 'SampleOTP'
```

Then, run:

```sh
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

## 📌 Example Project

To run the example project, clone the repo and execute:

```sh
pod install
```
inside the `Example` directory.

---

## 👤 Author

Pola Gamal  
📧 bola.gamal222@gmail.com  

---

## 📜 License

`SampleOTP` is available under the MIT license. See the `LICENSE` file for more details.
