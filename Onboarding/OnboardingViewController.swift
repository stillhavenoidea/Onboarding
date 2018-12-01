//
//  ViewController.swift
//  Onboarding
//
//  Created by MyMac on 01.12.18.
//  Copyright © 2018 SoftDevelopingOrganizationName. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let standart = 8
    private let doubleStandart = 16
    
    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    var products: [Product] = [
        Product.init(imageName: "image1", productDescription: "Многострочное описание первого продукта"),
        Product.init(imageName: "image2", productDescription: "Многострочное описание второго продукта"),
        Product.init(imageName: "image3", productDescription: "Многострочное описание третьего продукта")
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
        for i in 0..<products.count {
            var frame = self.placeholderView.frame
            let dx = CGFloat(standart * i)
            let dy = CGFloat(standart * i)
            let yOffset = CGFloat(doubleStandart * i)
            frame = frame.insetBy(dx: dx, dy: dy).offsetBy(dx: 0, dy: yOffset)
            let slideView = SlideView.init(frame: frame)
            slideView.productImageView.image = UIImage(named: products[i].imageName)
            slideView.descriptionLabel.text = products[i].productDescription
            view.addSubview(slideView)
            view.sendSubview(toBack: slideView)
            slideViews.append(slideView)
        }
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        goToNextSlide()
    }
    
    @objc func goToNextSlide() {
        if slideViews.count > 1 {
            slideViews.first?.isHidden = true
            var tempFrame = slideViews.first?.frame
            for index in 1..<slideViews.count {
                let fr = slideViews[index].frame
                slideViews[index].frame = tempFrame!
                tempFrame = fr
            }
            slideViews.removeFirst()
            if slideViews.count == 1 {
                nextButton.setTitle("Закрыть", for: .normal)
                return
            }
        } else {
            return
        }
    }
}

