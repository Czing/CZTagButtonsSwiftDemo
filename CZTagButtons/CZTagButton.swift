//
//  CZTagButton.swift
//  CZTagButtons
//
//  Created by Cyzing on 17/3/3.
//  Copyright © 2017年 Cyzing. All rights reserved.
//

import UIKit

class CZTagButton: UIButton {
   
    let selfH :CGFloat = 25
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.backgroundColor = UIColor.green
        self.layer.cornerRadius = selfH / 2
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.setTitleColor(UIColor.gray, for: UIControlState.normal)
    }
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        
        super.setTitle(title, for: state)
        self.sizeToFit()
        self.bounds.size.height = selfH
        
        self.bounds.size.width += 10
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
