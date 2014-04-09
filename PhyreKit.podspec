Pod::Spec.new do |s|
  s.name             = "PhyreKit"
  s.version          = "0.1.2"
  s.summary          = "Common utilities for Phyre Inc."
  s.homepage         = "http://rallyapp.io"
  s.license          = 'MIT'
  s.author           = { "Matt Ricketson" => "matt@phyreup.com" }
  s.source           = { :git => "git@bitbucket.org:phyre/phyrekit.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'

  s.subspec 'Foundation' do |ss|
    ss.source_files = 'Classes/Foundation/*.{h,m}'
    ss.requires_arc = true
  end

  s.subspec 'UIKit' do |ss|
    ss.source_files = 'Classes/UIKit/*.{h,m}'
    ss.requires_arc = true
  end
end
