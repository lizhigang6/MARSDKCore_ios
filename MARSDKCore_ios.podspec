#
# Be sure to run `pod lib lint MARSDKCore_ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MARSDKCore_ios'
  s.version          = '1.0'
  s.summary          = '火星人打包工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
火星人打包工具 ios
                       DESC

  s.homepage         = 'https://github.com/lizhigang6/MARSDKCore_ios.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'izhigang6@163.com' => 'lizhigang6@163.com' }
  s.source           = { :git => 'https://github.com/izhigang6@163.com/MARSDKCore_ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MARSDKCore_ios/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MARSDKCore_ios' => ['MARSDKCore_ios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.vendored_frameworks = 'MARSDKCore_ios/Classes/MARSDKCore.framework' #静态库文件的依赖，意思是执行到Classes文件夹下检索.framework类型的文件，我们放入的是动态库文件需要写入进行标注

end
