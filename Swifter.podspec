Pod::Spec.new do |s|

  s.name         = "Swifter"
  s.version      = "2.5.1"
  s.summary      = ":bird: A Twitter framework for iOS & macOS written in Swift"
  s.description  = <<-DESC
  Twitter framework for iOS & macOS written in Swift, with support of three different types of authentication protocol, and most, if not all, of the REST API.
                   DESC

  s.homepage     = "https://github.com/mattdonnelly/Swifter"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author    = "Matt Donnelly"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.10"
  s.source       = { :git => "https://github.com/gdanikas/Swifter.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/*.swift"
  s.swift_version = "5.0"
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


    s.subspec 'MonitorPlus' do |monitorplus|
    monitorplus.source_files = 'Sources/MonitorPlus/*.{h,m,swift}'
    monitorplus.xcconfig = {'ENABLE_BITCODE' => 'NO'}
    monitorplus.ios.vendored_frameworks = \
    "Sources/Libraries/MonitorPlus/FPL.framework" \

  end

end
