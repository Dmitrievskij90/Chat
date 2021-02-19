# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'Chat2021' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

# add pods for desired Firebase products
# https://firebase.google.com/docs/ios/setup#available-pods

  # Pods for Chat2021

pod 'LTMorphingLabel'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'IQKeyboardManagerSwift'

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
end

end
