import XCTest
@testable import SampleOTP

final class SampleOTPViewTests: XCTestCase {

    ///accessing via reflection to validate count
    func testConfigureCreatesCorrectNumberOfFields() {
        let otpView = SampleOTPView()
        let model = SampleOTPViewUIModel(length: 4)
        otpView.configure(with: model)

        let fields = otpView.textFields
        XCTAssertEqual(fields.count, 4)
    }

    func testClearFieldsResetsTextAndFocus() {
        let otpView = SampleOTPView()
        let model = SampleOTPViewUIModel(length: 3)
        otpView.configure(with: model)
        otpView.setOTP("123")
        otpView.clearFields()

        let fields = otpView.textFields
        XCTAssertEqual(fields.compactMap { $0.text }.joined(), "")
    }

    func testGetOTPReturnsCorrectCode() {
        let otpView = SampleOTPView()
        let model = SampleOTPViewUIModel(length: 3)
        otpView.configure(with: model)
        otpView.setOTP("789")
        XCTAssertEqual(otpView.getOTP(), "789")
    }

    func testSetOTPTriggersCompletionIfFull() {
        let expectation = XCTestExpectation(description: "OTP Completion Called")
        let otpView = SampleOTPView()
        let model = SampleOTPViewUIModel(length: 4)
        otpView.configure(with: model)
        otpView.didFinishEnteringOTP = { code in
            XCTAssertEqual(code, "2468")
            expectation.fulfill()
        }
        otpView.setOTP("2468")
        wait(for: [expectation], timeout: 1.0)
    }

    func testIsValidOTP() {
        let otpView = SampleOTPView()
        let model = SampleOTPViewUIModel(length: 3)
        otpView.configure(with: model)
        otpView.setOTP("111")
        XCTAssertTrue(otpView.isValidOTP())

        otpView.setOTP("1a3")
        XCTAssertFalse(otpView.isValidOTP())
    }
}
