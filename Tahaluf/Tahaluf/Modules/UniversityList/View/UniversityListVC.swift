//
//  UniversityListVC.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import UIKit

protocol UniversityListVCDisplayable: BaseVCDisplayable {
    
}

class UniversityListVC: UIViewController, UniversityListVCDisplayable, UITableViewDataSource {
    func reloadData() {
        
    }
    
    func updateEmptyState(isEmpty: Bool) {
        
    }
    
    func updateHUDState(showProgress: Bool) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }

    private func setupUI() {
        view.backgroundColor = .blue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
