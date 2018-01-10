

Pod::Spec.new do |s|

 
  s.name         = "HGCDTimer"
  s.version      = "0.0.2"
  s.summary      = "A short description of HGCDTimer."

  s.homepage     = "https://gitee.com/181310067/HGCDTimer"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"



  #s.license      = "MIT (example)"
   s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "huang" => "181310067@qq.com" }



   s.platform     = :ios, "8.0"

  #  When using multiple platforms
   s.ios.deployment_target = "9"
   s.osx.deployment_target = "10.8"
  # s.watchos.deployment_target = "2.0"
   s.tvos.deployment_target = "9.0"



  s.source       = { :git => "https://gitee.com/181310067/HGCDTimer.git", :tag => "#{s.version}" }

 

  s.source_files = 'HGCDTimer'
  


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  #s.framework  = "QuartzCore"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

   s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
