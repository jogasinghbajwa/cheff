//
//  TipButton.swift
//  Cheff
//
//  Created by Joga Singh on 28/08/20.
//  Copyright © 2020 Joga Singh. All rights reserved.
//

import UIKit

class TipButton: UIButton {

    /// Properties
    var isButtonSelected: Bool = false {
        didSet {
           updateAppearance()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    /// Common Init Method
    func commonInit() {
        
        layer.borderWidth = 2
        setTitleColor(.black, for: .normal)
        updateAppearance()
//        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    /// Appearance method
    func updateAppearance() {
        let color: UIColor = isButtonSelected ? .selectedButton : .unselectedButton
        backgroundColor = color.withAlphaComponent(0.3)
        layer.borderColor = color.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius(frame.size.height / 2)
    }
    
    /// Method get called when user click on button
    @objc func buttonTapped() {
//        isButtonSelected.toggle()
    }

}
