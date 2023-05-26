//
//  ChatViewController.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 25.05.2023.
//

import UIKit

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

