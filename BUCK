apple_resource(
  name = 'BxTraderResources',
  files = glob(['*.png', '*.storyboard']),
  dirs = [],
)

apple_bundle(
  name = 'BxTraderApp',
  binary = ':BxTraderAppBinary',
  extension = 'app',
  info_plist = 'BxTrader/Info.plist',
)

apple_binary(
  name = 'BxTraderAppBinary',
  deps = [':BxTraderResources',],
  preprocessor_flags = ['-fobjc-arc', '-Wno-objc-designated-initializers'],
  headers = glob([
    '*.h',
  ]),
  srcs = glob([
    '*.m', '*.swift', '**/*.swift', '**/**/*.swift',
  ]),
  frameworks = [
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
    '$SDKROOT/System/Library/Frameworks/SystemConfiguration.framework',
  ],
)

apple_package(
  name = 'BuckDemoAppPackage',
  bundle = ':BxTraderApp',
)