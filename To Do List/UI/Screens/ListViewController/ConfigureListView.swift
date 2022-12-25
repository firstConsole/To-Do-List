//
//  ConfigureListView.swift
//  To Do List
//
//  Created by Алексей Артамонов on 24.12.2022.
//

import UIKit

extension ListViewController {
    func addTarget() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: TargetViewController.identifier) as? TargetViewController else {
            return
        }
        
        vc.targetDelegate = self
        
        DispatchQueue.main.async {
            self.present(vc, animated: true)
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        targets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identificator,
                                                       for: indexPath) as? ListViewCell else {
            return UITableViewCell()
        }
        
        let taskName = targets[indexPath.row].name
        let date = targets[indexPath.row].date
        
        DispatchQueue.main.async {
            cell.configure()
            cell.taskName.text = taskName
            cell.dateLabel.text = date
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            targets.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ListViewController {
    func registerCells() {
        tableView.register(UINib(nibName: ListViewCell.nib,
                                 bundle: nil),
                           forCellReuseIdentifier: ListViewCell.identificator)
    }
}

extension ListViewController: TargetDelegate {
    func didAddTarget(with result: Target) {
        targets.append(result)
        tableView.reloadData()
    }
}
