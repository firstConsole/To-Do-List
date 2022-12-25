//
//  TargetViewController.swift
//  To Do List
//
//  Created by Алексей Артамонов on 24.12.2022.
//

import UIKit

final class TargetViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var fillAreaView: UIView!
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var targetPriorityPicker: UIPickerView!
    @IBOutlet weak var targetDatePicker: UIDatePicker!
    @IBOutlet weak var addTargetButton: UIButton!
    
    // MARK: - Properties
    
    static let identifier: String = "TargetViewController"
    weak var targetDelegate: TargetDelegate?
    var target: Target?
    let priorityList: [Priority] = [.low, .medium, .high, .extraHigh]
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        targetPriorityPicker.delegate = self
        targetPriorityPicker.dataSource = self
        configureUI()
    }
    
    @IBAction func addTargetToList(_ sender: UIButton) {
        createTarget()
    }
}
