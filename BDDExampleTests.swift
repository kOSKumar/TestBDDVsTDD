//
//  BDDExampleTests.swift
//  BDDExampleTests
//
//  Created by ameet on 27/12/17.
//  Copyright © 2017 amit. All rights reserved.
//

import XCTest
@testable import BDDExample

class BDDExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewControllerNotRetained() {
        // Create two variables for the view controller,
        // one strong and one weak
        var sut: ViewController? = ViewController()
        weak var weakSut = sut
        
        // Nilling out the strong reference should release the object,
        // making the weak reference also nil
        sut = nil
        XCTAssertNil(weakSut)
    }
}

class SpyDelegate: SampleProtocol {
    
    var somethingWithDelegateAsyncResult: Bool? = false
    
    var asyncExpectation: XCTestExpectation?
    
    func somethingWithDelegate(something: SomethingWithDelegate, didAsyncOperationResult result: Bool) {
        
        guard let expectation = asyncExpectation else {
            XCTFail("SpyDelegate was not setup correctly. Missing XCTExpectation reference")
            return
        }
        somethingWithDelegateAsyncResult = result
        expectation.fulfill()
    }
}

class DelegateTestExample: XCTestCase {
    
    func testDelegateMethodIsCalledAsync() {
        let something = SomethingWithDelegate()
        let spyDelegate = SpyDelegate()
        something.delegate = spyDelegate
        
        let expect = expectation(description: "SomethingWithDelegate calls the delegate as the result of an async method completion")
        spyDelegate.asyncExpectation = expect
        
        something.doAsyncTask()
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            
            guard let result = spyDelegate.somethingWithDelegateAsyncResult else {
                XCTFail("Expected delegate to be called")
                return
            }
            
            XCTAssertTrue(result)
        }
    }
}
