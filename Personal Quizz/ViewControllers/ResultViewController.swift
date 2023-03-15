//
//  ResultViewController.swift
//  Personal Quizz
//
//  Created by admin on 08/03/2023.
//

import UIKit

class ResultViewController:UIViewController {
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
    
    deinit {
        print("View has been deallacated")
    }
    
}
