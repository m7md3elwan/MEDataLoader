#
# Be sure to run `pod lib lint MEDataLoader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MEDataLoader'
  s.version          = '0.1.0'
  s.summary          = 'MEDataLoader is an iOS library that allow loading & caching of data from a remote URL'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MEDataLoader is an iOS library that allow loading & caching of data from a remote Url
It consists of 2 main components:
- MEDownloader: can load Data from a remote Url that don't duplicate multiple requests for the same Url, request can be cancelled without affecting other requests.
- MECache: caches Any object with a cache limit.
                       DESC

  s.homepage         = 'https://github.com/m7md3elwan/MEDataLoader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'm7md3elwan' => 'eng.m.elwan@gmail.com' }
  s.source           = { :git => 'https://github.com/m7md3elwan/MEDataLoader.git', :tag => s.version.to_s }
  s.swift_version = '4.2'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'MEDataLoader/**/*.swift'
  
  # s.resource_bundles = {
  #   'MEDataLoader' => ['MEDataLoader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
