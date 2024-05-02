//
//  UniversityListVC.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import UIKit

protocol UniversityListVCDisplayable: BaseVCDisplayable {
    
}

class UniversityListVC: BaseViewController, UniversityListVCDisplayable {
    var presenter: UniversityListPresenterAdaptable!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.rowHeight = UITableView.automaticDimension
            
            tableView.register(UINib(nibName: UniversityTableCell.identifier, bundle: nil), forCellReuseIdentifier: UniversityTableCell.identifier)
        }
    }
    
    @IBOutlet weak var emptyView: UIView!
    
    override func reloadData() {
        DispatchQueue.dispatchMainIfNeeded {
            self.tableView.reloadData()
        }
    }
    
    override func updateEmptyState(isEmpty: Bool) {
        DispatchQueue.dispatchMainIfNeeded {
            if isEmpty {
                self.emptyView.isHidden = false
                self.tableView.isHidden = true
            } else {
                self.emptyView.isHidden = true
                self.tableView.isHidden = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }

    private func setupUI() {
        self.title = presenter.title
        updateEmptyState(isEmpty: false)
    }
}

extension UniversityListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource.numberOfRowsIn(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UniversityTableCell.identifier, for: indexPath)
        
        if let cell = cell as? CellAdaptable, let cellModel = presenter.dataSource.cellViewModel(at: indexPath) {
            cell.update(with: cellModel)
        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.dataSource.didSelectRow(at: indexPath)
    }
}
