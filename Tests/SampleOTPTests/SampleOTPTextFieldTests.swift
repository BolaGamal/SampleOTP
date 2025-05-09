import XCTest
@testable import SampleOTP

class MockOTPDelegate: SampleOTPTextFieldDelegate {
    
    var didCallBackspace = false

    func textFieldDidEnterBackspace(_ textField: SampleOTPTextField) {
        didCallBackspace = true
    }
}

final class SampleOTPTextFieldTests: XCTestCase {

    func testDeleteBackwardCallsDelegate() {
        let mockDelegate = MockOTPDelegate()
        let textField = SampleOTPTextField()
        textField.otpTextFieldDelegate = mockDelegate

        // Simulate deletion
        textField.deleteBackward()

        XCTAssertTrue(mockDelegate.didCallBackspace)
    }

    func testCanPerformActionPasteAllowedOnly() {
        let textField = SampleOTPTextField()
        let pasteSelector = #selector(UIResponderStandardEditActions.paste(_:))
        let copySelector = #selector(UIResponderStandardEditActions.copy(_:))

        XCTAssertTrue(textField.canPerformAction(pasteSelector, withSender: nil))
        XCTAssertFalse(textField.canPerformAction(copySelector, withSender: nil))
    }

    func testSetAttributedPlaceholderWithFontAndColor() {
        let textField = SampleOTPTextField()
        let font = UIFont.systemFont(ofSize: 18)
        let color = UIColor.red

        let model = SampleOTPViewUIModel(
            placeholder: "0",
            placeholderFont: font,
            placeholderColor: color
        )

        textField.placeholder = model.placeholder
        textField.setAttributedPlaceholder(model)

        let attributes = textField.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attributes?[.font] as? UIFont, font)
        XCTAssertEqual(attributes?[.foregroundColor] as? UIColor, color)
    }
}
