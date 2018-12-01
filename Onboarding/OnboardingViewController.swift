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
        for index in 0..<products.count {
            var frame = self.placeholderView.frame
            let dx = CGFloat(standart * index)
            let dy = CGFloat(standart * index)
            let yOffset = CGFloat(doubleStandart * index)
            frame = frame.insetBy(dx: dx, dy: dy).offsetBy(dx: 0, dy: yOffset)

            let slideView = SlideView.init(frame: frame, imageName: products[index].imageName, productDescription: products[index].productDescription)
            
            view.addSubview(slideView)
            view.sendSubview(toBack: slideView)
            let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(OnboardingViewController.onLeftSwipe(recognizer:)))
            recognizer.direction = .left
            slideView.addGestureRecognizer(recognizer)
            slideViews.append(slideView)
        }
        view.bringSubview(toFront: slideViews.first!)
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
            slideViews.removeFirst().removeFromSuperview()
            view.bringSubview(toFront: slideViews.first!)
            if slideViews.count == 1 {
                nextButton.setTitle("Закрыть", for: .normal)
                return
            }
        } else {
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
    
    func animate(animations: @escaping () -> ()) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: TimeInterval.init(1),
            delay: TimeInterval.init(0),
            options: [],
            animations: animations,
            completion: nil)
    }
}

