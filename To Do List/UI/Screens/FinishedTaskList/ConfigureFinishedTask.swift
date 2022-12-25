//
//  ConfigureFinishedTask.swift
//  To Do List
//
//  Created by Алексей Артамонов on 25.12.2022.
//

import UIKit

extension FinishedTaskList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finishedTargets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FinishedTaskCell.identificator,
                                                       for: indexPath) as? FinishedTaskCell else {
            return UITableViewCell()
        }
        
        let taskName = finishedTargets[indexPath.row].name
        let date = finishedTargets[indexPath.row].date
        
        DispatchQueue.main.async {
            cell.taskName.text = taskName
            cell.dateLabel.text = date
            cell.fireImage.isHidden = true
        }
        
        return cell
    }
}

extension FinishedTaskList {
    func registerCell() {
        tableView.register(UINib(nibName: FinishedTaskCell.cellName,
                                 bundle: nil),
                           forCellReuseIdentifier: FinishedTaskCell.identificator)
    }
}

extension FinishedTaskList: FinishedTaskDelegate {
    func finishedTask(with result: Target) {
        finishedTargets.append(result)
        tableView.reloadData()
    }
}
