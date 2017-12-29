//
//  TableViewDelegateDataSourceMock.swift
//  BDDExampleTests
//
//  Created by ameet on 29/12/17.
//  Copyright © 2017 amit. All rights reserved.
//

import Foundation

@testable import BDDExample

class MyDelegateDatasourceMock: MyDelegateDatasourceProtocol {
    
    var didSelectCell: Bool = false
    var data: String?
    
    func didSelectCell(data: String) {
        didSelectCell = true
        self.data = data
    }
}
