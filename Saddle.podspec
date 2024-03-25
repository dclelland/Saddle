Pod::Spec.new do |spec|
  spec.name                   = "Saddle"
  spec.version                = "0.1.0"
  spec.summary                = "Hardware-accelerated vector calculus library for Swift."
  # spec.description            = "Hardware-accelerated vector calculus library for Swift."
  spec.homepage               = "https://github.com/dclelland/Saddle"
  spec.license                = "MIT"
  spec.author                 = { "Daniel Clelland" => "daniel.clelland@gmail.com" }
  spec.ios.deployment_target  = "14.0"
  spec.osx.deployment_target  = "12.0"
  spec.source                 = { :git => "https://github.com/dclelland/Saddle.git", :tag => "0.1.0" }
  spec.source_files           = "Sources/Saddle/**/*.swift"
  # spec.framework            = "Accelerate"
  # spec.dependency             "Plinth", "~> 2.6"
end