//
//  SlideView.swift
//  Onboarding
//
//  Created by MyMac on 01.12.18.
//  Copyright © 2018 SoftDevelopingOrganizationName. All rights reserved.
//

import UIKit

class SlideView: UIView {
    
    private let standart: CGFloat = 8
    private let doubleStandart: CGFloat = 16
    private let opacityValue: Float = 0.5
    
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
        contentView.layer.cornerRadius = standart
        contentView.clipsToBounds = true
        addSubview(contentView)
    }
    
    override func awakeFromNib() {
        configureView()
    }
    
    func configureView() {
        layer.cornerRadius = standart
        isOpaque = true
        layer.shadowOffset = CGSize(width: standart, height: standart)
        layer.shadowRadius = doubleStandart
        layer.shadowOpacity = opacityValue
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}
