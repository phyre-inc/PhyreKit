Pod::Spec.new do |s|
  s.name             = "PhyreKit"
  s.version          = "0.1.1"
  s.summary          = "Common utilities for Phyre Inc."
  s.homepage         = "http://rallyapp.io"
  s.license          = 'MIT'
  s.author           = { "Matt Ricketson" => "matt@phyreup.com" }
  s.source           = { :git => "git@bitbucket.org:phyre/phyrekit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}', 'Classes/{Foundation}/*.{h,m}'
end
