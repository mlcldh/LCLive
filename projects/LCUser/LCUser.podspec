#
# Be sure to run `pod lib lint LCUser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LCUser'
  s.version          = '0.1.0'
  s.summary          = '用户信息业务组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '用户信息业务组件'

  s.homepage         = 'https://github.com/mlcldh/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'menglingchao' => '1228225993@qq.com' }
  s.source           = { :git => 'https://github.com/mlcldh/LCLive.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#s.prefix_header_contents = '#import "EWTBase.h"','#import "EWTMediator+EWTUserCenter.h"'
  
    s.source_files = 'LCUser/Classes/**/*'

#   s.resource_bundles = {
#     'LCUser' => ['LCUser/Resources/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore'
   s.dependency 'AFNetworking'
   s.dependency 'Masonry'
   s.dependency 'LCMediator'
#   s.static_framework  =  true
  end
