//
//  UIViewController.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 23.08.2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
