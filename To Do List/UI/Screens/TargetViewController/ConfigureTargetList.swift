//
//  ConfigureTargetList.swift
//  To Do List
//
//  Created by Алексей Артамонов on 24.12.2022.
//

import UIKit

// MARK: - Setup UI Extension

extension TargetViewController {
    func configureUI() {
        DispatchQueue.main.async {
            self.fillAreaView.layer.cornerRadius = 10
        }
    }
}

extension TargetViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return priorityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return priorityList[row].rawValue
    }
    
    func createTarget() {
        guard let name: String = targetTextField.text else {
            return
        }
        
        let date: Date = targetDatePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let formattedDate = dateFormatter.string(from: date)
        let priority: Priority = .medium
        
        target = Target(name: name,
                        priority: priority,
                        date: formattedDate)
        
        if name.isEmpty {
            let alert = UIAlertController(title: "Ошибка",
                                          message: "Пожалуйста, заполните все поля",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        } else {
            guard let target = target else { return }
            
            self.targetDelegate?.didAddTarget(with: target)
            
            print(target.priority.rawValue)
            
            self.dismiss(animated: true)
        }
    }
}
