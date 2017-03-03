//
//  ViewController.swift
//  CZTagButtons
//
//  Created by Cyzing on 17/3/3.
//  Copyright © 2017年 Cyzing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let INTERSTICE :CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(superView)
        creatSubButtons { () -> Int in
            return buttonTitles.count
        }
    }
    func creatSubButtons (buttonsCount : ()->Int) {
        tagButtons.removeAll()
        for index in 0..<buttonsCount() {
            let button = CZTagButton(type: UIButtonType.custom)
            button.tag = index
            button.setTitle(buttonTitles[index], for: UIControlState.normal)
            button.addTarget(self, action:#selector(btnClick), for: .touchUpInside)
            tagButtons.append(button)
            if index==0 {
                button.bounds.origin.x = 5
                button.bounds.origin.y = 5
            }else{
                let lastBtn  = tagButtons[index-1]
                let lastBtnX = lastBtn.bounds.origin.x + lastBtn.bounds.size.width
                let lastBtnY = lastBtn.bounds.origin.y
                button.bounds.origin.x = lastBtnX + INTERSTICE
                button.bounds.origin.y = lastBtnY
                if (button.bounds.origin.x + button.bounds.size.width) > superView.bounds.size.width {
                    button.bounds.origin.y = lastBtn.bounds.origin.y + lastBtn.bounds.size.height + INTERSTICE
                    button.bounds.origin.x = 0
                }
            }
            button.frame = CGRect(x: button.bounds.origin.x, y: button.bounds.origin.y, width: button.bounds.size.width, height: button.bounds.size.height)
            superView.addSubview(button)
        }
    }
    
    func btnClick(button : UIButton) -> Void {
        
        print("\(button.tag)")
        
    }
    
    private lazy var buttonTitles :[String] = {
        ()->[String]
        in
        let buttonTitles:[String] = ["ios","andriod","java","手机开发","web前端开发","好程序员学前班","VR学习","智能机器人","C++","HTML/CSS","C#","Swift","JavaScript","R","Git",".NET"]
        return buttonTitles
    }()
    private lazy var tagButtons :[CZTagButton] = {
        ()->[CZTagButton]
        in
        var  tagButtons = [CZTagButton()]
        return tagButtons
    }()
        private   lazy var superView : UIView = {
        let   superView  = UIView()
        superView.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width - 20, height: 200)
        superView.backgroundColor = UIColor.white
        return superView
    }()
    
}

