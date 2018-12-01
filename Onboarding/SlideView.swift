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
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupXIB()
    }
    
    convenience init(frame: CGRect, imageName: String, productDescription: String) {
        self.init(frame: frame)
        self.productImageView.image = UIImage(named: imageName)
        self.descriptionLabel.text = productDescription
    }
    
    func setupXIB() {
        Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        addSubview(contentView)
    }
    
    override func awakeFromNib() {
        configureView()
    }
    
    func configureView() {
        layer.cornerRadius = 8
        isOpaque = true
        layer.shadowOffset = CGSize(width: 8, height: 8)
        layer.shadowRadius = 16
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}
