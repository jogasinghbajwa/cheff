//
//  TipViewController.swift
//  Cheff
//
//  Created by Joga Singh on 28/08/20.
//  Copyright © 2020 Joga Singh. All rights reserved.
//

import UIKit

protocol TipViewControllerDelegate {
    func addTipClicked()
}

class TipViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tipButtons: [TipButton]!
    @IBOutlet var addTipButton: UIButton!
    
    var delegate: TipViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.setCornerRadius(imageView.frame.size.height / 2)
        addTipButton.setCornerRadius(10)
        // Do any additional setup after loading the view.
    }
    
    /// When user select tip button, this method will get called
    @IBAction func tipButtonClicked(_ sender: TipButton) {
        for button in tipButtons {
            button.isButtonSelected = sender.isEqual(button)
        }
    }
    
    /// This method get called, when user click on Dismiss Button
    @IBAction func dismissButtonClicked(_ sender: UIBarButtonItem) {
        dismiss()
    }
    
    
    /// This method get called, when user click on add tip method
    @IBAction func addTipButtonClicked(_ sender: UIButton) {
        self.view.endEditing(true)
        showAlert(title: Titles.thankYou.value, message: "") {
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.addTipClicked()
                self?.dismiss()
            }
        }
    }
    
    
    func showAlert(title: String, message: String, completion: @escaping () -> ()) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Titles.ok.value, style: .default) { (action) in
            completion()
        }
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
