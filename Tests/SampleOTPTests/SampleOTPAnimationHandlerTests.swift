import XCTest
@testable import SampleOTP

final class SampleOTPAnimationHandlerTests: XCTestCase {

    ///Expect no crash — nothing to assert explicitly
    func testApplyAnimationWithNilTypeDoesNotCrash() {
        let model = SampleOTPViewUIModel(animationOTP: nil)
        let animationHandler = SampleOTPAnimationHandler(uiModel: model)
        let textField = SampleOTPTextField()
        
        animationHandler.applyAnimation(to: textField)
    }

    ///We can’t test animation visually, but we ensure it runs without crash
    func testApplyAnimationWithPulse() {
        let model = SampleOTPViewUIModel(animationOTP: .pulse)
        let animationHandler = SampleOTPAnimationHandler(uiModel: model)
        let textField = SampleOTPTextField()
        
        animationHandler.applyAnimation(to: textField)
    }

    func testApplyAnimationWithFadeIn() {
        let model = SampleOTPViewUIModel(animationOTP: .fadeIn)
        let animationHandler = SampleOTPAnimationHandler(uiModel: model)
        let textField = SampleOTPTextField()
        
        animationHandler.applyAnimation(to: textField)
    }

    func testApplyAnimationWithBounce() {
        let model = SampleOTPViewUIModel(animationOTP: .bounce)
        let animationHandler = SampleOTPAnimationHandler(uiModel: model)
        let textField = SampleOTPTextField()
        
        animationHandler.applyAnimation(to: textField)
    }
}
