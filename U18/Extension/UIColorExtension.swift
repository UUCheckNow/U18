//
//  UIColorExtension.swift
//  U18
//
//  Created by 优优 on 2022/7/28.
//

import UIKit

extension UIColor {
    convenience init(r:UInt32, g:UInt32, b:UInt32, a:CGFloat = 1.0) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
    }

    class var background: UIColor {
        return UIColor(r: 242, g: 242, b: 242)
    }

    class var theme: UIColor {
        return UIColor(r: 29, g: 221, b: 43)
    }

    func image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
