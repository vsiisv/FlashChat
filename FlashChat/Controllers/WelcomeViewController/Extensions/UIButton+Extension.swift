//
//  UIButton+Extension.swift
//  FlashChat
//
//  Created by VASILY IKONNIKOV on 22.05.2023.
//

import UIKit

extension UIButton {
	convenience init(title: String, titleColor: UIColor, backgroundColor: UIColor? = .none) {
		self.init(type: .system)
		setTitle(title, for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 30)
		self.setTitleColor(titleColor, for: .normal)
		self.backgroundColor = backgroundColor
	}
}
