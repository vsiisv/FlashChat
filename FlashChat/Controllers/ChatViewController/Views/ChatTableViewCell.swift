//
//  ChatTableViewCell.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 26.05.2023.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

	private lazy var viewCell: UIView = {
		let view = UIView()
		view.backgroundColor = .brandPurple
		return view
	}()
	
	private lazy var avatarImageView: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage.meAvatar
		imageView.image = image
		return imageView
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 10
		stackView.alignment = .fill
		stackView.distribution = .fill
		return stackView
	}()
	
	lazy var messageLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Layout and Style

private extension ChatTableViewCell {
	func addSubviews() {
		contentView.addSubview(stackView)
		stackView.addArrangedSubview(viewCell)
		viewCell.addSubview(messageLabel)
		stackView.addArrangedSubview(avatarImageView)
	}
	
	func setupConstraints() {
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		messageLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
			stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
			
			avatarImageView.heightAnchor.constraint(equalToConstant: 40),
			avatarImageView.widthAnchor.constraint(equalToConstant: 40),
			
			messageLabel.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 10),
			messageLabel.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -10),
			messageLabel.leftAnchor.constraint(equalTo: viewCell.leftAnchor, constant: 10),
			messageLabel.rightAnchor.constraint(equalTo: viewCell.rightAnchor, constant: -10)
		])
	}
}
