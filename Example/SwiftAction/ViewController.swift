//
//  ViewController.swift
//  SwiftAction
//
//  Created by O-O-wl on 12/23/2019.
//  Copyright (c) 2019 O-O-wl. All rights reserved.
//

import UIKit
import SwiftAction

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = button.bounds.width/2
        
        button.addAction(for: .touchDown) {
            $0.backgroundColor = .red
        }
        
        button.addAction(for: .touchUpInside) {
            $0.backgroundColor = .blue
        }
        
        guard #available(iOS 10.0, *) else { return }
        
        button.addAction(for: .touchDragInside, action: buttonDragInside)
    }
    
    deinit {
        UIControl.Event.all.forEach {
            self.button.removeAction(for: $0)
        }
    }
}

// MARK: - Action

extension ViewController {
    
    @available(iOS 10.0, *)
    func dynamicColor() -> UIColor? {
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        let a = CGFloat.random(in: 0...1)
        return UIColor(displayP3Red: r, green: g, blue: b, alpha: a)
    }
    
    @available(iOS 10.0, *)
    func buttonDragInside(_ sender: UIControl) -> Void {
        sender.backgroundColor = self.dynamicColor()
    }
}
