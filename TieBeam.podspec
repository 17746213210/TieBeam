Pod::Spec.new do |s|
  s.name             = 'TieBeam'
  s.version          = '1.0.1'
  s.summary          = 'Chain-style UIKit component helpers.'
  s.description      = <<-DESC
TieBeam provides fluent builders for common UIKit controls such as labels, buttons, toasts and loading hubs.
  DESC
  s.homepage         = 'https://github.com/17746213210/TieBeam'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KyleWhale' => 'kylej@bluewhaletech.pro' }
  s.source           = { :git => 'https://github.com/17746213210/TieBeam.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.frameworks = 'UIKit'

  s.source_files = 'TieBeam/Classes/**/*.{h,m}'
  s.public_header_files = 'TieBeam/Classes/Public/*.h'
end
