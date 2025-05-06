import XCTest
@testable import SampleOTP

final class SampleOTPViewUIModelTests: XCTestCase {

    func testDefaultModelProperties() {
        let model = SampleOTPViewUIModel(
            length: 6,
            space: 8,
            font: .boldSystemFont(ofSize: 14),
            textColor: .black,
            isSecureTextEntry: true,
            placeholder: "-",
            borderWidth: 1,
            borderColor: UIColor.gray.cgColor,
            fieldCornerRadius: 6,
            fieldBackgroundColor: .white,
            animationOTP: .none,
            typingOTPStyle: .active,
            activeTextColor: .blue,
            activeBorderColor: UIColor.green.cgColor,
            activeBorderWidth: 2,
            activeFieldCornerRadius: 8,
            activeFieldBackgroundColor: .lightGray
        )
        
        XCTAssertEqual(model.length, 6)
        XCTAssertEqual(model.space, 8)
        XCTAssertEqual(model.placeholder, "-")
        XCTAssertEqual(model.borderWidth, 1)
        XCTAssertTrue(model.isSecureTextEntry)
    }
    
    func testFallbacksFromMainStyleProperties() {
        let model = SampleOTPViewUIModel(
            textColor: .red,
            borderColor: UIColor.blue.cgColor
        )

        XCTAssertEqual(model.activeTextColor, .red)
        XCTAssertEqual(model.activeBorderColor, UIColor.blue.cgColor)
        XCTAssertEqual(model.activeBorderWidth, model.borderWidth)
        XCTAssertEqual(model.activeFieldCornerRadius, model.fieldCornerRadius)
        XCTAssertEqual(model.activeFieldBackgroundColor, model.fieldBackgroundColor)
    }
}
