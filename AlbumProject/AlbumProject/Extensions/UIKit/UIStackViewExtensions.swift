//
//  UIStackViewExtensions.swift
//  AlbumProject
//
//  Created by SERGEI on 26.06.2022.
//

import UIKit

extension UIStackView{
    convenience init(arrangedSubViews: [UIView],axis: NSLayoutConstraint.Axis,spasing: CGFloat, distribution:UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spasing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
