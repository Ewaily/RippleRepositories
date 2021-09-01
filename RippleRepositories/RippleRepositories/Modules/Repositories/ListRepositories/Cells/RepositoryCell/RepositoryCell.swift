//
//  RepositoryCell.swift
//  RippleRepositories
//
//  Created by Muhammad Ewaily on 31/08/2021.
//

import UIKit
import SDWebImage

class RepositoryCell: UITableViewCell {
    
    static let ID = String(describing: RepositoryCell.self)
    
    @IBOutlet weak private var containerView        : UIView!
    @IBOutlet weak private var repositoryImageView      : UIImageView!
    @IBOutlet weak private var repoDescriptionLabel     : UILabel!
    @IBOutlet weak private var repoNameLabel     : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        removeImage()
    }
    
    private func removeImage() {
        repositoryImageView.sd_cancelCurrentImageLoad()
        repositoryImageView.image = nil
    }
    
    private func setupUI() {
        selectionStyle = .none
        setupContainerView()
        setupImageView()
        setupRepositoryTitleLabel()
        setupPublisherNameLabel()
    }
    
    private func setupContainerView() {
        containerView.borderWidth = Dimensions.APP_BORDER_WIDTH
        containerView.cornerRadius = Dimensions.APP_CORNER_RADIUS
        containerView.borderColor = Colors.GRAY
    }
    
    private func setupImageView() {
        repositoryImageView.cornerRadius = 8
        repositoryImageView.clipsToBounds = true
        repositoryImageView.contentMode = .scaleAspectFill
        repositoryImageView.sd_imageTransition = .fade
        repositoryImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
    }
    
    private func setupRepositoryTitleLabel() {
        repoDescriptionLabel.font = Fonts.getFont(style: .Medium, size: 16)
        repoDescriptionLabel.textColor = Colors.DARK_SHADE
    }
    
    private func setupPublisherNameLabel() {
        repoNameLabel.font = Fonts.getFont(style: .Light, size: 12)
        repoNameLabel.textColor = Colors.DARK_SHADE
    }
    
    func bindCell(info: Repository) {
        repoDescriptionLabel.text = info.repoDescription
        repoNameLabel.text = info.repoName
        repositoryImageView.sd_setImage(with: info.ownerAvatarURL,
                                    placeholderImage: nil)
    }
}
