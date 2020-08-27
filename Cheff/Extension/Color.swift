//
//  Color.swift
//  Cheff
//
//  Created by Joga Singh on 28/08/20.
//  Copyright © 2020 Joga Singh. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    class var selectedButton: UIColor {
        UIColor.rgba(r: 190, g: 34, b: 44, a: 1)
    }
    
    class var unselectedButton: UIColor {
        UIColor.rgba(r: 157, g: 157, b: 157, a: 1)
    }
}
