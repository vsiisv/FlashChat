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
//		label.text = "⚡️FlashChat"
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
		addTargetsToButton()
		animateTitle()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = false
	}
}

// MARK: - Methods

extension WelcomeViewController {
	func animateTitle() {
		titleLabel.text = ""
		let titleText = "⚡️FlashChat"
		var charIndex = 0.0
		for letter in titleText {
			Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
				self.titleLabel.text?.append(letter)
			}
			charIndex += 1
		}
	}
}

// MARK: - Button Actions

private extension WelcomeViewController {
	func addTargetsToButton() {
		registerButton.addTarget(self, action: #selector(registration), for: .touchUpInside)
		logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
	}
	
	@objc func registration() {
		let vc = RegisterViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc func logIn() {
		let vc = LogInViewController()
		navigationController?.pushViewController(vc, animated: true)
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
