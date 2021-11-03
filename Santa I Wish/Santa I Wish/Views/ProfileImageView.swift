//
//  ProfileImageView.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 10/29/21.
//

import Foundation
import UIKit

@IBDesignable class ProfileImageView: UIImageView {
    
    // MARK: Initializers
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Properties
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}
