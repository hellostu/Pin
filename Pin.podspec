#
# Be sure to run `pod lib lint Pin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Pin"
  s.version          = "2.2.0"
  s.summary          = "Pin is a Swift wrapper for AutoLayout"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC 
  For those that have a preference to do UI code in iOS programatically rather than using Interface Builder, NSLayoutConstraints can take up a lot of lines of code. They can also be quite difficult to read and make sense of. The goal of this is to restrict the length required to express a layout constraint. It also makes the constraint easier to ready. This library is aimed for Swift use. It won't be as pleasent in Objective C, due to the builder chaining of functions. 
                       DESC

  s.homepage         = "https://github.com/studomonly/Pin"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Stuart Lynch" => "stu@iname.com" }
  s.source           = { :git => "https://github.com/studomonly/Pin.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/stuart_lynch'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Pin' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
