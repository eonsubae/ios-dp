//
//  UIColor.swift
//  Flyweight
//
//  Created by KRENGLSSEAN on 2021/04/11.
//

import UIKit

extension UIColor {
    public static var colorStore: [String: UIColor] = [:]
    
    public class func rgba(_ red: CGFloat,
                           _ green: CGFloat,
                           _ blue: CGFloat,
                           _ alpha: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        if let color = colorStore[key] {
            return color
        }
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color
        return color
    }
}
