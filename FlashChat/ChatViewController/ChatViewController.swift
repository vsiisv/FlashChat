//
//  ChatViewController.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 25.05.2023.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {
	
	private let messageView = MessageView()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		
		return tableView
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		style()
		addSubviews()
		setupConstraints()
	}
}

// MARK: - Button Targets

extension ChatViewController {
	@objc func logOut() {
		let firebaseAuth = Auth.auth()
		do {
			try firebaseAuth.signOut()
			navigationController?.popToRootViewController(animated: true)
		} catch let signOutError as NSError {
			print("Error signing out: %@", signOutError)
		}
	}
}

// MARK: - TableViewDelegate and DataSource

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		var content = cell.defaultContentConfiguration()
		content.text = "1"
		
		cell.contentConfiguration = content
		return cell
	}
}

// MARK: - AutoLayout and Style

private extension ChatViewController {
	func style() {
		view.backgroundColor = .brandPurple
		
		// Style Navigation Bar
		title = "⚡️FlashChat"
		navigationController?.navigationBar.tintColor = .white
		let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		navigationController?.navigationBar.titleTextAttributes = textAttributes
		navigationItem.hidesBackButton = true
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			title: "Log Out",
			style: .plain,
			target: self,
			action: #selector(logOut)
		)
	}
	
	func addSubviews() {
		view.addSubview(tableView)
		view.addSubview(messageView)
	}
	
	func setupConstraints() {
		
		messageView.translatesAutoresizingMaskIntoConstraints = false
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
			tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
			
			messageView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
			messageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
			messageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
			messageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

