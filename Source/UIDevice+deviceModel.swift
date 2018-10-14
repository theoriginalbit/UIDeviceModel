//
//  UIDevice+deviceType.swift
//  UIDeviceModel
//
//  Created by theoriginalbit on 8/10/18.
//  Copyright © 2018 theoriginalbit. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    public var deviceModel: UIDeviceModel {
        return UIDeviceModel.current
    }
    
}
