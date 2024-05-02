//
//  UniversityDetailsVC.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import UIKit

protocol UniversityDetailsVCDisplayable: BaseVCDisplayable {
    
}

class UniversityDetailsVC: UIViewController, UniversityDetailsVCDisplayable {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    
    var presenter: UniversityDetailsPresenterAdaptable!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        self.title = presenter.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(buttonActionRefresh))
    }
    
    func reloadData() {
        nameLabel.text = presenter.dataSource.universityName
        countryLabel.text = presenter.dataSource.universityCountry
        countryCodeLabel.text = presenter.dataSource.universityCountryCode
    }
    
    func updateEmptyState(isEmpty: Bool) {
        
    }
    
    func updateHUDState(showProgress: Bool) {
        
    }
    
    @objc func buttonActionRefresh() {
        presenter.didSelectRefresh()
    }
}
