#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint desktop_window.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'desktop_window'
  s.version          = '0.4.3'
  s.summary          = 'Flutter desktop plugin to get and change window size.'
  s.description      = <<-DESC
Flutter desktop plugin (macOS/Linux/Windows) to get and change window size.
                       DESC
  s.homepage         = 'https://github.com/mix1009/desktop_window'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ChunKoo Park' => 'mix1009@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.14'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
