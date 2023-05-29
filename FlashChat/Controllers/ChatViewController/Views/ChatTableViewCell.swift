//
//  ChatTableViewCell.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 26.05.2023.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

	lazy var viewCell: UIView = {
		let view = UIView()
		view.backgroundColor = .brandPurple
		return view
	}()
	
	lazy var rightAvatarImageView: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage.meAvatar
		imageView.image = image
		return imageView
	}()
	
	lazy var leftAvatarImageView: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage.yourAvatar
		imageView.image = image
		return imageView
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 10
		stackView.alignment = .top
		stackView.distribution = .fill
		return stackView
	}()
	
	var messageLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		setupConstraints()
		
//		viewCell.layer.cornerRadius = viewCell.frame.size.height / 2
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override class func awakeFromNib() {
		super.awakeFromNib()
		
	}
}

// MARK: - Layout and Style

private extension ChatTableViewCell {
	func addSubviews() {
		contentView.addSubview(stackView)
		stackView.addArrangedSubview(leftAvatarImageView)
		stackView.addArrangedSubview(viewCell)
		viewCell.addSubview(messageLabel)
		stackView.addArrangedSubview(rightAvatarImageView)
	}
	
	func setupConstraints() {
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		messageLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
			
			rightAvatarImageView.heightAnchor.constraint(equalToConstant: 40),
			rightAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
			
			leftAvatarImageView.heightAnchor.constraint(equalToConstant: 40),
			leftAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
			
			messageLabel.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 10),
			messageLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -10),
			messageLabel.leftAnchor.constraint(equalTo: viewCell.leftAnchor, constant: 10),
			messageLabel.rightAnchor.constraint(equalTo: viewCell.rightAnchor, constant: -10),
		])
	}
}
