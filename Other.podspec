#
# Be sure to run `pod lib lint CocoapodsSubspecBug.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Other'
  s.version          = '0.1.0'
  s.summary          = 'Other is a demonstration root pod.'


  s.description      = <<-DESC
Other is a demonstration root pod for CocoapodsSubspecBug
                       DESC

  s.homepage         = 'https://github.com/paulb777/CocoapodsSubspecBug'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul Beusterien' => 'paul.beusterien@gmail.com' }
  s.source           = { :git => 'https://github.com/paulb777/CocoapodsSubspecBug.git', :tag => 'Root-v'+String(s.version)}
  s.ios.deployment_target = '8.0'
  s.dependency 'GoogleToolboxForMac/NSData+zlib', '~> 2.1'

end
