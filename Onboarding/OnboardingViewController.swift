//
//  ViewController.swift
//  Onboarding
//
//  Created by MyMac on 01.12.18.
//  Copyright © 2018 SoftDevelopingOrganizationName. All rights reserved.
//
let STANDART = 8
let DOUBLE_STANDART = 16

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var slideView: SlideView!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides: [Slide] = [
        Slide.init(imageName: "image1", productDescription: "Многострочное описание первого продукта"),
        Slide.init(imageName: "image2", productDescription: "Многострочное описание второго продукта"),
        Slide.init(imageName: "image3", productDescription: "Многострочное описание третьего продукта")
    ]
    var slideViews: [SlideView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        layOutSlides()
    }
    
    func layOutSlides () {
        for i in 0..<slides.count {
            var frame = self.slideView.frame
            let dx = CGFloat(STANDART * i)
            let dy = CGFloat(STANDART * i)
            let yOffset = CGFloat(DOUBLE_STANDART * i)
            frame = frame.insetBy(dx: dx, dy: dy).offsetBy(dx: 0, dy: yOffset)
            let slideView = SlideView.init(frame: frame)
            slideView.productImageView.image = UIImage(named: slides[i].imageName)
            slideView.descriptionLabel.text = slides[i].productDescription
            view.addSubview(slideView)
            view.sendSubview(toBack: slideView)
        }
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        
    }
}

