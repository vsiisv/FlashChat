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
	
	private var messages = [Message]()
	
	private let db = Firestore.firestore()
	
	private let messageView = MessageView()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		
		return tableView
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		messageView.delegate = self
		
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "cell")
		
		style()
		addSubviews()
		setupConstraints()
		
		loadMessages()
	}
}

// MARK: - Methods

extension ChatViewController {
	func loadMessages() {
		db.collection("messages")
			.order(by: "date")
			.addSnapshotListener { querySnapshot, error in
			
			self.messages = []
			
			if let error {
				print("There was an issue retrieving data from Firestore. \(error)")
			} else {
				guard let snapshotDocuments = querySnapshot?.documents else { return }
				for doc in snapshotDocuments {
					let data = doc.data()
					guard let sender = data["sender"] as? String, let messageBody = data["body"] as? String else { return }
					let newMessage = Message(sender: sender, body: messageBody)
					self.messages.append(newMessage)
					
					DispatchQueue.main.async {
						self.tableView.reloadData()
						let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
						self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
					}
				}
			}
		}
	}
}

// MARK: - SendMessageDelegate

extension ChatViewController: MessageViewDelegate {
	
	func sendMessage(textBody: String?) {
		if let messageBody = textBody, let messageSender = Auth.auth().currentUser?.email {
			db.collection("messages").addDocument(data: [
				"sender": messageSender,
				"body": messageBody,
				"date": Date().timeIntervalSince1970
			]) { error in
				if let error {
					print("There was an issue saving data to firestore, \(error)")
				} else {
					print("Successfully saved data.")
				}
			}
		}
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

extension ChatViewController: UITableViewDelegate {
	
}

extension ChatViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let message = messages[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell
		cell.viewCell.layer.cornerRadius = cell.viewCell.frame.size.height / 3
		cell.messageLabel.text = message.body
		
		if message.sender == Auth.auth().currentUser?.email {
			cell.leftAvatarImageView.isHidden = true
			cell.rightAvatarImageView.isHidden = false
			cell.viewCell.backgroundColor = UIColor.brandLightPurple
			cell.messageLabel.textColor = UIColor.brandPurple
		} else {
			cell.leftAvatarImageView.isHidden = false
			cell.rightAvatarImageView.isHidden = true
			cell.viewCell.backgroundColor = UIColor.brandPurple
			cell.messageLabel.textColor = UIColor.brandLightPurple
		}
		
		return cell
	}
}

// MARK: - AutoLayout and Style

private extension ChatViewController {
	func style() {
		view.backgroundColor = .brandPurple
		
		tableView.separatorStyle = .none
		tableView.allowsSelection = false
		
		styleOfNavigationBar()
	}
	
	func styleOfNavigationBar() {
		title = "⚡️FlashChat"
		navigationController?.navigationBar.tintColor = .white
		
		let navigationBarAppearance = UINavigationBarAppearance()
		navigationBarAppearance.backgroundColor = UIColor.brandPurple
		navigationBarAppearance.titleTextAttributes = [
			.foregroundColor: UIColor.white,
			.font: UIFont.systemFont(ofSize: 24)
		]
		navigationController?.navigationBar.standardAppearance = navigationBarAppearance
		navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
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

