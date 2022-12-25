//
//  FinishedTaskCell.swift
//  To Do List
//
//  Created by Алексей Артамонов on 25.12.2022.
//

import UIKit

final class FinishedTaskCell: UITableViewCell {
    
    // MARK: - IBOutles
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkboxImage: UIImageView!
    @IBOutlet weak var fireImage: UIImageView!
    
    // MARK: - Properties
    
    static let identificator: String = "FinishedTask"
    static let cellName: String = "FinishedTaskCell"
    
    func configure() {
        
        DispatchQueue.main.async {
            self.checkBoxView.layer.cornerRadius = 15
            self.checkBoxView.layer.borderColor = UIColor.lightGray.cgColor
            self.checkBoxView.layer.borderWidth = 0.5
            self.checkBoxView.layer.backgroundColor = UIColor.systemBackground.cgColor
        }
    }
}
