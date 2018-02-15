apple_binary(
name = 'AppBinary',
srcs = glob(['BxTrader/**/*.swift',]),
deps = [
    ':AppAsset',
    ':CryptoSwift',
    ':ObjectMapper',
    ':Alamofire',
    ':RxSwift',
    ':SwiftyJSON',
    ],
frameworks = [
    '$SDKROOT/System/Library/Frameworks/Foundation.framework',
    '$SDKROOT/System/Library/Frameworks/UIKit.framework',
    ],
)

apple_asset_catalog(
name = 'AppAsset',
dirs = ['BxTrader/Supporting Files/Assets.xcassets'],
)

apple_package(
name = 'BxTraderAppPackage',
bundle = ':BxTraderApp',
)

apple_bundle(
name = 'BxTraderApp',
binary = ':AppBinary',
extension = 'app',
info_plist = 'BxTrader/Info.plist',
info_plist_substitutions = {
'PRODUCT_BUNDLE_IDENTIFIER': 'com.bxtrader',
'CURRENT_PROJECT_VERSION': '1',
},
)

# cocoapods

apple_library(
  name = 'Alamofire',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/Alamofire/**/*.h',
  ]),
  srcs = glob([
    'Pods/Alamofire/**/*.m',
    'Pods/Alamofire/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)

apple_library(
  name = 'CryptoSwift',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/CryptoSwift/**/*.h',
  ]),
  srcs = glob([
    'Pods/CryptoSwift/**/*.m',
    'Pods/CryptoSwift/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)

apple_library(
  name = 'ObjectMapper',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/ObjectMapper/**/*.h',
  ]),
  srcs = glob([
    'Pods/ObjectMapper/**/*.m',
    'Pods/ObjectMapper/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)

apple_library(
  name = 'RxCocoa',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/RxCocoa/**/*.h',
  ]),
  srcs = glob([
    'Pods/RxCocoa/**/*.m',
    'Pods/RxCocoa/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)

apple_library(
  name = 'RxSwift',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/RxSwift/**/*.h',
  ]),
  srcs = glob([
    'Pods/RxSwift/**/*.m',
    'Pods/RxSwift/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)

apple_library(
  name = 'SnapKit',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/SnapKit/**/*.h',
  ]),
  srcs = glob([
    'Pods/SnapKit/**/*.m',
    'Pods/SnapKit/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)

apple_library(
  name = 'SwiftyJSON',
  visibility = ['PUBLIC'],
  exported_headers = glob([
    'Pods/SwiftyJSON/**/*.h',
  ]),
  srcs = glob([
    'Pods/SwiftyJSON/**/*.m',
    'Pods/SwiftyJSON/**/*.swift',
  ]),
  frameworks = [
    '$PLATFORM_DIR/Developer/Library/Frameworks/XCTest.framework',
  ],
)
