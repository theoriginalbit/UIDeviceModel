# UIDeviceModel

[![Language](https://img.shields.io/badge/swift-4.2-orange.svg)](https://swift.org/)
[![License](https://img.shields.io/github/license/theoriginalbit/UIDeviceModel.svg)](LICENSE)
[![Pod Version](https://img.shields.io/cocoapods/v/UIDeviceModel.svg)](https://cocoapods.org/pods/UIDeviceModel)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)

A µframework to detect the device model provided through an extension of `UIDevice`. It also allows detection of the simulator and the device model it is simulating.

## Installation

### CocoaPods

```ruby
pod 'UIDeviceModel', '~> 1.0'
```

### Carthage

```ogdl
github "theoriginalbit/UIDeviceModel"
```

## Usage

First import the framework:

```swift
import UIDeviceModel
```

Common usage would be to use in a switch statement

```swift
let deviceModel = UIDevice.current.deviceModel

switch deviceModel {
case .iPhone6sPlus: break // You're on an iPhone 6s Plus
case .iPhoneXS: break // You're on an iPhone XS
case .simulator: break // Oh, hello there developer!
default: break
}
```

If needed you can unwrap a simulator to get the device model being simulated

```swift
let deviceModel = UIDevice.current.deviceModel.unwrapIfSimulator

// Or as an enum

switch deviceModel {
case .simulator(let simulatedDeviceModel): break // It's as if it never happened
default: break
}
```