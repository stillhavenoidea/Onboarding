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
        layoutSlides()
    }
    
    func layoutSlides () {
        for index in (0..<products.count).reversed() {
            let slideView = slideViewFor(index: index)
            placeholderView.addSubview(slideView)
            let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.onLeftSwipe(recognizer:)))
            recognizer.direction = .left
            slideView.addGestureRecognizer(recognizer)
            slideViews.append(slideView)
        }
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
        } else {
            return
        }
    }
    
    func lastSlideCheck() {
        if slideViews.count == 1 {
            nextButton.setTitle("Закрыть", for: .normal)
            return
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

