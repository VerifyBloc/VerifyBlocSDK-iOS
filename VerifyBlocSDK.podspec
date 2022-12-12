#
# Be sure to run `pod lib lint VerifyBlocSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VerifyBlocSDK'
  s.version          = '0.2.0'
  s.summary          = 'VerifyBlocSDK is a verification service.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  VerifyBlocSDK is a verification service.
                       DESC

  s.homepage         = 'https://www.verifybloc.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'haozheng' => 'haozheng@presslogic.com' }
  s.source           = { :git => 'https://github.com/VerifyBloc/VerifyBlocSDK-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

#  s.source_files = 'VerifyBlocSDK/Classes/*'
  
  s.vendored_frameworks = ['VerifyBlocSDK/Frameworks/VerifyBloc.framework']
  s.resource = 'VerifyBlocSDK/Bundles/VerifyBloc.bundle'
  
end
