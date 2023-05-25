//
//  LogInViewController.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 25.05.2023.
//

import UIKit

class LogInViewController: UIViewController {
	
	private let emailTextField = UITextField(placeholder: "Email")
	private let passwordTextField = UITextField(placeholder: "Password", isSecure: true)
	private let registerButton = UIButton(title: "Log In", titleColor: .brandBlue!)

	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 20
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		return stackView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		style()
		addSubviews()
		setupConstraints()
	}
}

private extension LogInViewController {
	func style() {
		view.backgroundColor = .brandLightBlue
	}
	
	func addSubviews() {
		view.addSubview(stackView)
		stackView.addArrangedSubview(emailTextField)
		stackView.addArrangedSubview(passwordTextField)
		view.addSubview(registerButton)
	}
	
	func setupConstraints() {
		
		registerButton.translatesAutoresizingMaskIntoConstraints = false
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
			stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40),
			stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -40),
			
			emailTextField.heightAnchor.constraint(equalToConstant: 45),
			
			registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
			registerButton.heightAnchor.constraint(equalToConstant: 50),
			registerButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
			registerButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
			
		])
	}
}
