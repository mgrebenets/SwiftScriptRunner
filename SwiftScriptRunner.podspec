#
# Be sure to run `pod lib lint SwiftScriptRunner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SwiftScriptRunner"
  s.version          = "0.1.0"
  s.summary          = "A helper class for running Swift scripts with asynchronous callbacks."

  s.description      = <<-DESC
                       A helper class for running Swift scripts with asynchronous callbacks.
                        * Initialize runner, lock before each async call and unlock once it's done.
                        * Wait for all locks to unlock at the end of the script.
                        DESC
  s.homepage         = "https://github.com/mgrebenets/SwiftScriptRunner"
  s.license          = 'MIT'
  s.author           = { "Maksym Grebenets" => "mgrebenets@gmail.com" }
  s.source           = { :git => "https://github.com/mgrebenets/SwiftScriptRunner.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mgrebenets'

  s.platform = :osx, "10.10"
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
end
