//
//  ViewController.swift
//  BDDExample
//
//  Created by ameet on 27/12/17.
//  Copyright © 2017 amit. All rights reserved.
//

import UIKit

class View {
    var onButtonPressed: (()-> Void)?
}

class ViewController: UIViewController {
    let customView = View()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        customView.onButtonPressed = { [weak self] in
            
            self?.handleButtonAction()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func handleButtonAction() {
        
        print("This is a message.")
    }
}
