//
//  UniversityTableCell.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import UIKit

protocol UniversityTableCellDisplayable: CellDisplayable {
    var universityName: String { get }
    var universityState: String? { get }
}

class UniversityTableCell: UITableViewCell, CellAdaptable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(with model: CellDisplayable) {
        guard let model = model as? UniversityTableCellDisplayable else {
            return
        }
        
        nameLabel.text = model.universityName
        stateLabel.text = model.universityState
    }
}
