//
//  DeviceExtension.swift
//  Locus
//
//  Created by Lakshmi H R on 12/03/22.
//

import Foundation
import UIKit

extension UIDevice {
    public var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
