//
//  DelegateDataSourceTest.swift
//  BDDExampleTests
//
//  Created by ameet on 29/12/17.
//  Copyright © 2017 amit. All rights reserved.
//

import XCTest
@testable import BDDExample

class DelegateDataSourceTest: XCTestCase {
    
    var myDelegateDatasource: TableViewDelegateDataSource!
    var tableView: UITableView!
    let myDelegate = MyDelegateDatasourceMock()

    override func setUp() {
        super.setUp()

        let data = ["Rodrigo", "Cavalcante", "Testing", "Delegate", "Datasource"]
        myDelegateDatasource = TableViewDelegateDataSource()
        
        myDelegateDatasource.data = data
        myDelegateDatasource.delegate = myDelegate

        tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
        tableView.dataSource = myDelegateDatasource
        tableView.delegate = myDelegateDatasource
        
    }
    
    func testTableViewRowNumbers() {
        
        XCTAssert(myDelegateDatasource.tableView(tableView, numberOfRowsInSection: 0) == 5)
    }
    
    func testNumberofSections() {
        
        XCTAssert(myDelegateDatasource.numberOfSections(in: tableView) == 1)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testReturnCellView() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        _ = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func testWhenFirstCellSelected() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssert(myDelegate.didSelectCell == false)
        myDelegateDatasource.tableView(tableView, didSelectRowAt: indexPath)
        XCTAssert(myDelegate.didSelectCell == true)
        XCTAssert(myDelegate.data == "Rodrigo")
    }
}
