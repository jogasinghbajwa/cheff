//
//  RatingViewController.swift
//  Cheff
//
//  Created by Joga Singh on 28/08/20.
//  Copyright © 2020 Joga Singh. All rights reserved.
//

import UIKit

protocol ReviewViewControllerDelegate {
    func controllerDismissed()
}

class ReviewViewController: UIViewController {
    
    
    @IBOutlet var ratingStar: [UIButton]!
    @IBOutlet var saveReviewButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var delegate: ReviewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveReviewButton.setCornerRadius(10)
        // Do any additional setup after loading the view.
    }
    
    /// This method get called, when user click on Dismiss Button
    @IBAction func dismissButtonClicked(_ sender: UIBarButtonItem) {
        dismiss()
    }
    
    /// When user click on rating option
    @IBAction func ratingButtonClick(_ sender: UIButton) {
        guard let index = ratingStar.firstIndex(of: sender) else { return }
        updateRatingView(rating: index)
    }
    
    /// When user click on Save review option
    @IBAction func saveReviewButtonClicked(_ sender: UIButton) {
        self.view.endEditing(true)
        
        let identifier = vcIdentifier.tipVC.value
        guard let tipVC: TipViewController = self.storyboard?.instantiateViewController(identifier: identifier) else { return }
        tipVC.delegate = self
        present(tipVC, animated: true, completion: nil)
    }
    
    
    /// Custom function to update Start user interface
    func updateRatingView(rating: Int) {
        /// Reset buttons
        for (i, startButton) in ratingStar.enumerated() {
            startButton.setImage(asset: i > rating ? .starUnselected : .starSelected)
        }
        guard let data = getValuesFromRating(rating) else { return }
        titleLabel.text = data.title.value
        descriptionLabel.text = data.description.value
    }
    
    /// This function return title and description, based on Selected Index of Rating view
    func getValuesFromRating(_ index: Int) -> ReviewData? {
        switch index {
        case 0, 1:
            return ReviewData(title: .bad, description: .wrong)
        case 2:
            return ReviewData(title: .average, description: .improve)
        case 3:
            return ReviewData(title: .good, description: .impress)
        case 4:
            return ReviewData(title: .lovedIt, description: .impress)
        default:
            return nil
        }
    }
    
}

extension ReviewViewController : TipViewControllerDelegate {
    func addTipClicked() {
        delegate?.controllerDismissed()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.dismiss()
        }
    }
    
    
}
