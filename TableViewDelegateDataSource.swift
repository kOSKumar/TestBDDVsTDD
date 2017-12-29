//
//  TableViewDelegateDataSource.swift
//  BDDExample
//
//  Created by ameet on 29/12/17.
//  Copyright © 2017 amit. All rights reserved.
//

import UIKit

protocol MyDelegateDatasourceProtocol {
    
    func didSelectCell(data: String)
}

class TableViewDelegateDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var data: [String]?
    var delegate: MyDelegateDatasourceProtocol?

    //MARK: Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = data?.count {
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = data?[indexPath.row] {
            delegate?.didSelectCell(data: data)
        }
    }
}
