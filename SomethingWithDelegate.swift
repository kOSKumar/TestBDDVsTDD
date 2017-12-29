//
//  ProtocolTest.swift
//  BDDExample
//
//  Created by ameet on 28/12/17.
//  Copyright © 2017 amit. All rights reserved.
//

import Foundation
protocol SampleProtocol: class {
    
    func  somethingWithDelegate(something: SomethingWithDelegate, didAsyncOperationResult: Bool)
}

class SomethingWithDelegate {
    
    weak var delegate: SampleProtocol?
    
    func doAsyncTask() {
        
        self.delegate?.somethingWithDelegate(something: self, didAsyncOperationResult: true)
    }
}

