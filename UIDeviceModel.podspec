Pod::Spec.new do |s|
  s.name                        = "UIDeviceModel"
  s.version                     = "1.1.0"
  s.summary                     = "A µframework to detect the device model."
  s.description                 = <<-DESC
                                    A µframework to detect the device model provided through an extension of UIDevice. It also allows detection of the simulator and the device model it is simulating.
                                  DESC
  s.homepage                    = "https://github.com/theoriginalbit/UIDeviceModel"
  s.license                     = { :type => "MIT", :file => "LICENSE" }
  s.author                      = { "theoriginalbit" => "theoriginalbit@gmail.com" }
  
  s.requires_arc                = true
  s.ios.deployment_target       = "8.0"
  
  s.source                      = { :git => "https://github.com/theoriginalbit/UIDeviceModel.git", :tag => "#{s.version}" }
  s.source_files                = "Source", "Source/**/*.{h,swift}"
  s.swift_version               = "4.2" 
end
