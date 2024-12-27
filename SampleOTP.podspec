#
# Be sure to run `pod lib lint SampleOTP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SampleOTP'
  s.version          = '0.1.0'
  s.summary          = 'A library for handling OTP (One-Time Password) generation.'
  s.description      = 'This library provides functionalities to generate and validate OTPs in iOS applications.'
  s.homepage         = 'https://github.com/BolaGamal/SampleOTP'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BolaGamal' => 'bola.gamal222@gmail.com' }
  s.source           = { :git => 'https://github.com/BolaGamal/SampleOTP.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'SampleOTP/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SampleOTP' => ['SampleOTP/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
