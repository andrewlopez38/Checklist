//
//  ViewController.swift
//  Checklist
//
//  Created by Andrew Lopez on 8/25/21.
//

import UIKit
//starts with UI = part of UI kit.  checklistviewcontroller is object
class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem]()

    let row0text = "Walk the dog"
    let row1text = "Brush teeth"
    let row2text = "Learn iOS development"
    let row3text = "Soccer practice"
    let row4text = "Eat ice cream"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //allows access to navigation bar and makes large font
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Data Source
    override func tableView(
      _ tableView: UITableView,
      numberOfRowsInSection section: Int
    ) -> Int {
      return items.count
    }
    
    // MARK: - Table View Delegate
    override func tableView(
      _ tableView: UITableView,
      didSelectRowAt indexPath: IndexPath
    ) {
      if let cell = tableView.cellForRow(at: indexPath) {
        let item = items[indexPath.row]
        item.checked.toggle()
        configureCheckmark(for: cell, with: item)
      }
      tableView.deselectRow(at: indexPath, animated: true)
    }

    func configureCheckmark(
      for cell: UITableViewCell,
      with item: ChecklistItem
    ) {
      if item.checked {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
    }
    
    func configureText(
      for cell: UITableViewCell,
      with item: ChecklistItem
    ) {
      let label = cell.viewWithTag(1000) as! UILabel
      label.text = item.text
    }
    
    //adds swipe to delete functionality
    //index path creats t emporary array and row is removed with animation
    override func tableView(
      _ tableView: UITableView,
      commit editingStyle: UITableViewCell.EditingStyle,
      forRowAt indexPath: IndexPath
    ) {
      // 1
      items.remove(at: indexPath.row)

      // 2
      let indexPaths = [indexPath]
      tableView.deleteRows(at: indexPaths, with: .automatic)
    }

    override func tableView(
      _ tableView: UITableView,
      cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: "ChecklistItem",
        for: indexPath)

      let item = items[indexPath.row]

      configureText(for: cell, with: item)
      configureCheckmark(for: cell, with: item)
      return cell
    }
    
    // MARK: - Actions
    @IBAction func addItem() {
        //store variable from array
        let newRowIndex = items.count

        //create object to add to array and append list
        let item = ChecklistItem()
        item.text = "I am a new row"
        items.append(item)

        //use index to identify row, hold line in temporary array
        //insert the new row
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
}



