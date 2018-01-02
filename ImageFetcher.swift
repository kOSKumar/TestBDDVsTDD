//
//  ImageFetcher.swift
//  BDDExample
//

import Foundation
import UIKit

class ImageFetcher {
    
    private let operationQueue: OperationQueue
    init(operationQueue: OperationQueue = OperationQueue()) {
        
        self.operationQueue = operationQueue
    }
    
    func fetchImage(url: URL, completion: (UIImage?) -> Void) {
        
        //
        
    }
    
    func cancelAllImageFetches() {
        
        self.operationQueue.cancelAllOperations()
    }
}

