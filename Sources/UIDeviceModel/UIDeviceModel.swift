//
//  UIDeviceModel.swift
//  UIDeviceModel
//
//  Created by theoriginalbit on 9/10/18.
//  Copyright © 2018 theoriginalbit. All rights reserved.
//

import Foundation

public enum UIDeviceModel {
    case iPad2
    case iPadGen3
    case iPadGen4
    case iPadGen5
    case iPadGen6
    case iPadGen7
    case iPadGen8
    case iPadAir
    case iPadAir2
    case iPadAirGen3
    case iPadAirGen4
    case iPadPro9_7Inch
    case iPadPro10_5Inch
    case iPadPro11Inch
    case iPadPro11InchGen2
    case iPadPro12_9Inch
    case iPadPro12_9InchGen2
    case iPadPro12_9InchGen3
    case iPadPro12_9InchGen4
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadMiniGen5
    case iPadGen9
    case iPadPro11InchGen3
    case iPadPro12_9InchGen5
    case iPadAirGen5
    case iPadMiniGen6

    case iPhone4s
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhoneSE
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSEGen2
    case iPhone12Mini
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Mini
    case iPhone13
    case iPhone13Pro
    case iPhone13ProMax
    case iPhoneSEGen3
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax

    case iPodTouch5
    case iPodTouch6
    case iPodTouch7

    indirect case simulator(UIDeviceModel)

    // Device is not yet known or implemented
    case unknown(String)
}

public extension UIDeviceModel {
    var unwrapIfSimulator: UIDeviceModel {
        return UIDeviceModel.unwrapIfSimulator(self)
    }

    private static func unwrapIfSimulator(_ device: UIDeviceModel) -> UIDeviceModel {
        if case let .simulator(model) = device {
            return model
        }
        return device
    }
}

// MARK: - Mapping from Identifier

extension UIDeviceModel {
    static var current: UIDeviceModel {
        return mapToDevice(identifier: identifier)
    }

    private static var identifier: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()

    private static func mapToDevice(identifier: String) -> UIDeviceModel {
        switch identifier {
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad2,5", "iPad2,6", "iPad2,7": return .iPadMini
        case "iPad3,1", "iPad3,2", "iPad3,3": return .iPadGen3
        case "iPad3,4", "iPad3,5", "iPad3,6": return .iPadGen4
        case "iPad4,1", "iPad4,2", "iPad4,3": return .iPadAir
        case "iPad4,4", "iPad4,5", "iPad4,6": return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9": return .iPadMini3
        case "iPad5,1", "iPad5,2": return .iPadMini4
        case "iPad5,3", "iPad5,4": return .iPadAir2
        case "iPad6,3", "iPad6,4": return .iPadPro9_7Inch
        case "iPad6,7", "iPad6,8": return .iPadPro12_9Inch
        case "iPad6,11", "iPad6,12": return .iPadGen5
        case "iPad7,1", "iPad7,2": return .iPadPro12_9InchGen2
        case "iPad7,3", "iPad7,4": return .iPadPro10_5Inch
        case "iPad7,5", "iPad7,6": return .iPadGen6
        case "iPad7,11", "iPad7,12": return .iPadGen7
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": return .iPadPro11Inch
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return .iPadPro12_9InchGen3
        case "iPad8,9", "iPad8,10": return .iPadPro11InchGen2
        case "iPad8,11", "iPad8,12": return .iPadPro12_9InchGen4
        case "iPad11,1", "iPad11,2": return .iPadMiniGen5
        case "iPad11,3", "iPad11,4": return .iPadAirGen3
        case "iPad11,6", "iPad11,7": return .iPadGen8
        case "iPad12,1", "iPad12,2": return .iPadGen9
        case "iPad13,1", "iPad13,2": return .iPadAirGen4
        case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7": return iPadPro11InchGen3
        case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11": return iPadPro12_9InchGen5
        case "iPad13,16", "iPad13,17": return .iPadAirGen5
        case "iPad14,1", "iPad14,2": return .iPadMiniGen6

        case "iPhone4,1": return .iPhone4s
        case "iPhone5,1", "iPhone5,2": return .iPhone5
        case "iPhone5,3", "iPhone5,4": return .iPhone5c
        case "iPhone6,1", "iPhone6,2": return .iPhone5s
        case "iPhone7,2": return .iPhone6
        case "iPhone7,1": return .iPhone6Plus
        case "iPhone8,1": return .iPhone6s
        case "iPhone8,2": return .iPhone6sPlus
        case "iPhone8,4": return .iPhoneSE
        case "iPhone9,1", "iPhone9,3": return .iPhone7
        case "iPhone9,2", "iPhone9,4": return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4": return .iPhone8
        case "iPhone10,2", "iPhone10,5": return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6": return .iPhoneX
        case "iPhone11,2": return .iPhoneXS
        case "iPhone11,4", "iPhone11,6": return .iPhoneXSMax
        case "iPhone11,8": return .iPhoneXR
        case "iPhone12,1": return .iPhone11
        case "iPhone12,3": return .iPhone11Pro
        case "iPhone12,5": return .iPhone11ProMax
        case "iPhone12,8": return .iPhoneSEGen2
        case "iPhone13,1": return .iPhone12Mini
        case "iPhone13,2": return .iPhone12
        case "iPhone13,3": return .iPhone12Pro
        case "iPhone13,4": return .iPhone12ProMax
        case "iPhone14,4": return .iPhone13Mini
        case "iPhone14,5": return .iPhone13
        case "iPhone14,2": return .iPhone13Pro
        case "iPhone14,3": return .iPhone13ProMax
        case "iPhone14,6": return .iPhoneSEGen3
        case "iPhone14,7": return .iPhone14
        case "iPhone14,8": return .iPhone14Plus
        case "iPhone15,2": return .iPhone14Pro
        case "iPhone15,3": return .iPhone14ProMax

        case "iPod5,1": return .iPodTouch5
        case "iPod7,1": return .iPodTouch6
        case "iPod9,1": return .iPodTouch7

        case "i386", "x86_64": return .simulator(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))
        default: return .unknown(identifier)
        }
    }
}
