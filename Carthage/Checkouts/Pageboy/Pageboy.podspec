Pod::Spec.new do |s|

  s.name         = "Pageboy"
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.version      = "1.3.2"
  s.summary      = "A simple, highly informative page view controller."
  s.description  = <<-DESC
  					A page view controller that provides simplified data source management, enhanced delegation and other useful features.
                   DESC

  s.homepage          = "https://github.com/MerrickSapsford/Pageboy"
  s.license           = "MIT"
  s.author            = { "Merrick Sapsford" => "merrick@sapsford.tech" }
  s.social_media_url  = "http://twitter.com/MerrickSapsford"

  s.source       = { :git => "https://github.com/MerrickSapsford/Pageboy.git", :tag => s.version.to_s }
  s.source_files = "Sources/Pageboy/**/*.{h,m,swift}"

end
