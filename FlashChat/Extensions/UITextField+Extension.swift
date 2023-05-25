//
//  UITextField+Extension.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 22.05.2023.
//

import UIKit

extension UITextField {
	convenience init(placeholder: String, isSecure: Bool = false) {
		self.init()
		self.placeholder = placeholder
		isSecureTextEntry = isSecure
		
		clipsToBounds = true
		layer.cornerRadius = 25
		font = UIFont.systemFont(ofSize: 25)
		textAlignment = .center
		tintColor = .gray
		backgroundColor = .white
		
		layer.masksToBounds = false
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOpacity = 0.2
		layer.shadowOffset = CGSize(width: 0, height: 10)
		layer.shadowRadius = 10
		
		translatesAutoresizingMaskIntoConstraints = false
	}
}

