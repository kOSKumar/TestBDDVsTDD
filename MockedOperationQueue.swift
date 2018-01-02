//  MockedOperationQueue.swift
//  BDDExampleTests
//  Created by ameet on 02/01/18.
//  Copyright © 2018 amit. All rights reserved.

import Foundation

class MockOperationQueue: OperationQueue {
    
    var cancelAllOperationsCount = 0
    
    override func cancelAllOperations() {
        super.cancelAllOperations()
        
        cancelAllOperationsCount += 1
    }
}

import XCTest
@testable import BDDExample

//To test: when an image download canceled cancel operation getting called.
class ImageFetcherTest: XCTestCase {
    
    var sut: ImageFetcher!
    var mockOperationQueue: MockOperationQueue!
    override func setUp() {
        super.setUp()
        
        mockOperationQueue = MockOperationQueue()
        sut = ImageFetcher(operationQueue: mockOperationQueue)
    }
    
    override func tearDown() {
        
        sut = nil
        mockOperationQueue = nil
        super.tearDown()
    }
    
    func test_cancelFetchingAllImages_callsCancelAllOperation() {
        
        sut.cancelAllImageFetches()
        XCTAssertEqual(mockOperationQueue.cancelAllOperationsCount, 1)
    }
}
