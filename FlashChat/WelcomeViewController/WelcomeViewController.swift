//
//  ViewController.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 22.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "⚡️FlashChat"
		label.font = UIFont.systemFont(ofSize: 50, weight: .black)
		label.textColor = .brandBlue
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	private let registerButton = UIButton(title: "Register", titleColor: .brandBlue!, backgroundColor: .brandLightBlue!)
	private let logInButton = UIButton(title: "Log In", titleColor: .white, backgroundColor: .systemTeal)
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		style()
		addSubviews()
		setupConstraints()
	}
}

// MARK: - layout and Style

extension WelcomeViewController {
	func style() {
		view.backgroundColor = .systemBackground
	}
	
	func addSubviews() {
		view.addSubview(titleLabel)
		view.addSubview(stackView)
		stackView.addArrangedSubview(registerButton)
		stackView.addArrangedSubview(logInButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			
			stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			
			registerButton.heightAnchor.constraint(equalToConstant: 48),
			logInButton.heightAnchor.constraint(equalToConstant: 61)
		])
	}
}