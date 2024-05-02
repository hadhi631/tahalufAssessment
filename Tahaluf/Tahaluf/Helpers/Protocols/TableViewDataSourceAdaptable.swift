//
//  TableViewDataSourceAdaptable.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import UIKit

protocol TableViewDataSourceAdaptable: AnyObject {
    func numberOfSections() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func title(forSection section: Int) -> String?
    func cellViewModel(at indexPath: IndexPath) -> CellDisplayable?
    func didSelectRow(at indexPath: IndexPath)
    func selectionStyle(at indexPath: IndexPath) -> UITableViewCell.SelectionStyle
}

extension TableViewDataSourceAdaptable {
    func numberOfSections() -> Int {
        return 1
    }
    
    func title(forSection section: Int) -> String? {
        return nil
    }
    
    func selectionStyle(at indexPath: IndexPath) -> UITableViewCell.SelectionStyle {
        return .none
    }
    
    func didSelectRow(at indexPath: IndexPath) { }
}
