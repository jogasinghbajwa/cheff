//
//  Button.swift
//  Cheff
//
//  Created by Joga Singh on 28/08/20.
//  Copyright © 2020 Joga Singh. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setImage(asset: Assets) {
        guard let image = asset.image() else { return }
        self.setImage(image, for: .normal)
    }
}
