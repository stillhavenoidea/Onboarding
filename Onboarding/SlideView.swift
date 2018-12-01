//
//  SlideView.swift
//  Onboarding
//
//  Created by MyMac on 01.12.18.
//  Copyright © 2018 SoftDevelopingOrganizationName. All rights reserved.
//

import UIKit

class SlideView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXIB()
    }
    
    func setupXIB() {
        Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    override func awakeFromNib() {
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}
