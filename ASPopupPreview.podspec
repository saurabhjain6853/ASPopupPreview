
Pod::Spec.new do |spec|

spec.name         = "ASPopupPreview"
spec.version      = "1.0.0"
spec.summary      = "A small framework for image popup using 3D touch."
spec.description  = <<-DESC
                ASPopupPreview is a small and lightweight Swift framework that use for image popup using 3D touch in a super-easy way!
                    DESC
spec.homepage     = "http://ioschamp.com"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "Saurabh Jain" => "saurabh.jain6853@gmail.com", "Arpita Shringi" => "arpitashringi24@gmail.com" }
spec.platform     = :ios, "12.0"
spec.source       = { :git => "https://github.com/saurabhjain6853/ASPopupPreview.git", :tag => "#{spec.version}" }
spec.swift_version = "5.0"
spec.source_files  = "ASPopupPreview/Source/*.{swift}"

end
