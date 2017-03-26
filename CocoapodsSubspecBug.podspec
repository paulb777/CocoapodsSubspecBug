#
# Be sure to run `pod lib lint CocoapodsSubspecBug.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CocoapodsSubspecBug'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CocoapodsSubspecBug.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/paulb777/CocoapodsSubspecBug'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul Beusterien' => 'paul.beusterien@gmail.com' }
  s.source           = { :git => 'https://github.com/paulb777/CocoapodsSubspecBug.git', :tag => 'CSB-v'+String(s.version) }

  s.ios.deployment_target = '8.0'
  s.default_subspec = 'One'

  s.subspec 'One' do |sp|
    sp.dependency 'Root/One'
  end

  s.subspec 'Two' do |sp|
    sp.source_files = 'CocoapodsSubspecBug/Classes/**/*'
    sp.dependency 'CocoapodsSubspecBug/One'
    sp.dependency 'GoogleToolboxForMac/NSDictionary+URLArguments', '~> 2.1'
  end

end
