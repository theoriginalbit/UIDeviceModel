# UIDeviceModel

A µframework to detect the device model provided through an extension of `UIDevice`. It also allows detection of the simulator and the device model it is simulating.

## Installation

### Swift Package Manager

```swift
.package(url: "https://github.com/theoriginalbit/UIDeviceModel.git", .upToNextMajor(from: "3.0.0"))
```

## Usage

Common usage would be to use in a switch statement

```swift
import UIDeviceModel

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
