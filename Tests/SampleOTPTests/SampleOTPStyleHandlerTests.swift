import XCTest
@testable import SampleOTP

final class SampleOTPStyleHandlerTests: XCTestCase {

    func testGetTextFieldBorderColorWhenActiveAndInactive() {
        let activeColor = UIColor.green.cgColor
        let inactiveColor = UIColor.gray.cgColor
        let model = SampleOTPViewUIModel(
            borderColor: inactiveColor,
            activeBorderColor: activeColor
        )

        let activeBorderColor = SampleOTPStyleHandler.getTextFieldBorderColor(model: model, isActive: true)
        let inactiveBorderColor = SampleOTPStyleHandler.getTextFieldBorderColor(model: model, isActive: false)

        XCTAssertEqual(activeBorderColor, activeColor)
        XCTAssertEqual(inactiveBorderColor, inactiveColor)
    }

    func testGetTextFieldBackgroundColor() {
        let activeBG = UIColor.lightGray
        let inactiveBG = UIColor.white
        let model = SampleOTPViewUIModel(
            fieldBackgroundColor: inactiveBG,
            activeFieldBackgroundColor: activeBG
        )

        let activeBackground = SampleOTPStyleHandler.getTextFieldBackgroundColor(model: model, isActive: true)
        let inactiveBackground = SampleOTPStyleHandler.getTextFieldBackgroundColor(model: model, isActive: false)

        XCTAssertEqual(activeBackground, activeBG)
        XCTAssertEqual(inactiveBackground, inactiveBG)
    }

    func testGetTextFieldCornerRadius() {
        let defaultRadius: CGFloat = 4
        let activeRadius: CGFloat = 10

        let model = SampleOTPViewUIModel(
            fieldCornerRadius: defaultRadius,
            activeFieldCornerRadius: activeRadius
        )

        let active = SampleOTPStyleHandler.getTextFieldCornerRadius(model: model, isActive: true)
        let inactive = SampleOTPStyleHandler.getTextFieldCornerRadius(model: model, isActive: false)

        XCTAssertEqual(active, activeRadius)
        XCTAssertEqual(inactive, defaultRadius)
    }

    func testGetTextFieldBorderWidth() {
        let defaultWidth: CGFloat = 1
        let activeWidth: CGFloat = 3

        let model = SampleOTPViewUIModel(
            borderWidth: defaultWidth,
            activeBorderWidth: activeWidth
        )

        let active = SampleOTPStyleHandler.getTextFieldBorderWidth(model: model, isActive: true)
        let inactive = SampleOTPStyleHandler.getTextFieldBorderWidth(model: model, isActive: false)

        XCTAssertEqual(active, activeWidth)
        XCTAssertEqual(inactive, defaultWidth)
    }

}