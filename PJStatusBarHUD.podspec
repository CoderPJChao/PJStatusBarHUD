
Pod::Spec.new do |s|
  s.name         = "PJStatusBarHUD"
  s.version      = "1.0.0"
  s.summary      = "A simple the status bar indicator framework."
  s.homepage     = "https://github.com/CoderPJChao/PJStatusBarHUD"
  s.license      = "MIT"
  s.authors      = { 'PJ Chao' => 'zhao5910@126.com'}
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/CoderPJChao/PJStatusBarHUD.git", :tag => s.version }
  s.source_files = 'PJStatusBarHUD', 'PJStatusBarHUD/*.{h,m}'
  s.requires_arc = true
end
