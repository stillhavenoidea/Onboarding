//
//  ViewController.swift
//  Onboarding
//
//  Created by MyMac on 01.12.18.
//  Copyright © 2018 SoftDevelopingOrganizationName. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let halfStandart = 4
    private let standart = 8
    private let doubleStandart = 16
    
    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    var products: [Product] = [
        Product.init(imageName: "image1", productDescription: "Многострочное описание первого продукта"),
        Product.init(imageName: "image2", productDescription: "Многострочное описание второго продукта"),
        Product.init(imageName: "image3", productDescription: "Многострочное описание третьего продукта")
    ]
    var slideViews: [SlideView] = []
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureBackgroundViews()
        layoutSlides()
    }
    
    func configureBackgroundViews() {
        topView.layer.cornerRadius = CGFloat(halfStandart)
        bottomView.layer.cornerRadius = CGFloat(halfStandart)
    }
    
    func layoutSlides () {
        for index in (0..<products.count).reversed() {
            let slideView = slideViewFor(index: index)
            placeholderView.addSubview(slideView)
            addLeftSwipeRecognizer(for: slideView)
            slideViews.append(slideView)
        }
    }
    
    func addLeftSwipeRecognizer(for slideView: SlideView) {
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.onLeftSwipe(recognizer:)))
        recognizer.direction = .left
        slideView.addGestureRecognizer(recognizer)
    }
    
    func slideViewFor(index: Int) -> SlideView {
        var frame = self.placeholderView.bounds
        let dx = CGFloat(standart * index)
        let dy = CGFloat(standart * index)
        let yOffset = CGFloat(doubleStandart * index)
        frame = frame.insetBy(dx: dx, dy: dy).offsetBy(dx: 0, dy: yOffset)
        return SlideView.init(
            frame: frame, imageName:
            products[index].imageName,
            productDescription: products[index].productDescription)
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        goToNextSlide()
    }
    
    @objc func goToNextSlide() {
        if slideViews.count > 1 {
            for index in 0..<slideViews.count - 1 {
                slideViews[index].frame = slideViews[index + 1].frame
            }
            slideViews.removeLast().removeFromSuperview()
            lastSlideCheck()
        }
    }
    
    func lastSlideCheck() {
        if slideViews.count == 1 {
            nextButton.setTitle("Закрыть", for: .normal)
        }
    }
    
    @objc func onLeftSwipe(recognizer: UISwipeGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            goToNextSlide()
        default:
            return
        }
    }
}

