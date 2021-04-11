//
//  ViewController.swift
//  myToDoList
//
//  Created by Григорий Виняр on 02.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let identifier = "cell"
    
    var arrayOfNotes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func addAlert() {
        let alert = UIAlertController(title: "Add new note", message: "", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields![0].placeholder = "New note"
        let actionOne = UIAlertAction(title: "Add", style: .default, handler: { action in
            // TODO: Доделать action, где добавить в cell новую заметку
            if let text = alert.textFields![0].text {
                self.arrayOfNotes.append(text)
                self.tableView.reloadData()
                print(self.arrayOfNotes)
            }
            
        })
        let actionTwo = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonAdd(_ sender: UIBarButtonItem) {
        //tableView.reloadData()
        addAlert()
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = arrayOfNotes[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayOfNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
}
    

// MARK: some test mark
