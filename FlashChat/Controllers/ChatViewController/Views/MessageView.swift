//
//  TextFieldView.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 25.05.2023.
//

import UIKit

protocol MessageViewDelegate: AnyObject {
	func sendMessage(textBody: String?)
}

final class MessageView: UIView {
	
	weak var delegate: MessageViewDelegate?
	
	private lazy var messageTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Write a message"
		textField.borderStyle = .roundedRect
		textField.textColor = .brandPurple
		return textField
	}()
	
	private lazy var sendButton: UIButton = {
		let button = UIButton()
		let image = UIImage(systemName: "paperplane.fill")
		button.setImage(image, for: .normal)
		button.tintColor = .white
		button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
		return button
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillProportionally
		stackView.spacing = 20
		return stackView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Actions

private extension MessageView {
	@objc func sendMessage() {
		delegate?.sendMessage(textBody: messageTextField.text)
	}
}

// MARK: - AutoLayout and Style

private extension MessageView {
	func addSubviews() {
		addSubview(stackView)
		stackView.addArrangedSubview(messageTextField)
		stackView.addArrangedSubview(sendButton)
	}
	
	func setupConstraints() {
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			messageTextField.heightAnchor.constraint(equalToConstant: 40),
			
			sendButton.heightAnchor.constraint(equalToConstant: 40),
			sendButton.widthAnchor.constraint(equalToConstant: 40),
			
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leftAnchor.constraint(equalTo: leftAnchor),
			stackView.rightAnchor.constraint(equalTo: rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
