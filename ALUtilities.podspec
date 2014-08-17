Pod::Spec.new do |s|
  s.name         = 'ALUtilities'
  s.version      = '1.0.1'
  s.license      =  { :type => 'MIT' }
  s.homepage     = 'https://github.com/cczallen/ALUtilities'
  s.authors      =  { 'Allen Lee' => 'cczallen@gmail.com' }
  s.summary      = 'iOS useful utilities by AL'

# Source Info
  s.platform     =  :ios, '6.0'
  s.source       =  { :git => 'https://github.com/cczallen/ALUtilities.git', :tag => s.version.to_s }
  s.source_files = 'ALUtilities/ALUtilities/*.{h,m}'

  s.requires_arc = true
  
# Pod Dependencies

end