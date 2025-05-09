#
# Be sure to run `pod lib lint SampleOTP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SampleOTP'
  s.version          = '0.3.5'
  s.summary          = 'A customizable OTP input field for iOS.'
  s.description      = <<-DESC
    SampleOTP simplifies the implementation of one-time password (OTP) input fields in iOS apps.
    It offers a flexible, secure, and user-friendly UI model with full support for UIKit and SwiftUI.
  DESC
  s.homepage         = 'https://github.com/BolaGamal/SampleOTP'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BolaGamal' => 'bola.gamal222@gmail.com' }
  s.source           = { :git => 'https://github.com/BolaGamal/SampleOTP.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/pola-gamal-53438322a/'
  s.source_files     = 'Sources/SampleOTP/**/*.{swift}'
  s.swift_version    = '5.5'
  s.ios.deployment_target = '12.0'
  s.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => '-DCOCOAPODS' }
end
