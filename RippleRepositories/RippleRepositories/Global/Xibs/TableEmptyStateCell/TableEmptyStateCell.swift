//
//  TableEmptyStateCell.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit

class TableEmptyStateCell: UITableViewCell {
    
    static let ID = String(describing: TableEmptyStateCell.self)
    
    @IBOutlet weak private var emptyStateImageView  : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
    }
    
    
    func setEmptyStateImage(image: UIImage?) {
        emptyStateImageView.image = image
    }
}
