apple_asset_catalog(
name = 'AppAsset',
dirs = [
'BxTrader/Supporting Files/Assets.xcassets'
],
)

apple_binary(
name = 'AppBinary',
srcs = glob([
'BxTrader/*.swift', 'BxTrader/**/*.swift', 'BxTrader/**/**/*.swift',
]),
deps = [
':AppAsset',
':CryptoSwift',
':ObjectMapper',
':Alamofire',
':RxSwift',
':SwiftyJSON'
],
frameworks = [
'$SDKROOT/System/Library/Frameworks/Foundation.framework',
'$SDKROOT/System/Library/Frameworks/UIKit.framework',
],
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

apple_package(
name = 'BxTraderAppPackage',
bundle = ':BxTraderApp',
)


# Pods :

apple_library(
name = 'CryptoSwift',
preprocessor_flags = [
'-fobjc-arc'
],
srcs = glob([
'Pods/CryptoSwift/**/*.swift',
'Pods/CryptoSwift/**/**/*.swift',
]),
visibility = [
'PUBLIC'
],
frameworks = [
'$SDKROOT/System/Library/Frameworks/UIKit.framework',
'$SDKROOT/System/Library/Frameworks/Foundation.framework',
],
)

apple_library(
name = 'ObjectMapper',
preprocessor_flags = [
'-fobjc-arc'
],
srcs = glob([
'Pods/ObjectMapper/**/*.swift',
]),
visibility = [
'PUBLIC'
],
frameworks = [
'$SDKROOT/System/Library/Frameworks/UIKit.framework',
'$SDKROOT/System/Library/Frameworks/Foundation.framework',
],
)

apple_library(
name = 'Alamofire',
preprocessor_flags = [
'-fobjc-arc'
],
srcs = glob([
'Pods/Alamofire/**/*.swift',
]),
visibility = [
'PUBLIC'
],
frameworks = [
'$SDKROOT/System/Library/Frameworks/UIKit.framework',
'$SDKROOT/System/Library/Frameworks/Foundation.framework',
],
)

apple_library(
name = 'RxSwift',
preprocessor_flags = [
'-fobjc-arc'
],
srcs = glob([
'Pods/RxSwift/**/*.swift',
]),
visibility = [
'PUBLIC'
],
frameworks = [
'$SDKROOT/System/Library/Frameworks/UIKit.framework',
'$SDKROOT/System/Library/Frameworks/Foundation.framework',
],
)


apple_library(
name = 'SwiftyJSON',
preprocessor_flags = [
'-fobjc-arc'
],
srcs = glob([
'Pods/SwiftyJSON/**/**/*.swift',
]),
visibility = [
'PUBLIC'
],
frameworks = [
'$SDKROOT/System/Library/Frameworks/UIKit.framework',
'$SDKROOT/System/Library/Frameworks/Foundation.framework',
],
)
