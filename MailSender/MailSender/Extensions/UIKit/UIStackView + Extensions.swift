//
//  UIStackView + Extensions.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import UIKit

extension UIStackView{
    convenience init(arrangedSubviews:[UIView],axis:NSLayoutConstraint.Axis,spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
