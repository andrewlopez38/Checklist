//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Andrew Lopez on 8/26/21.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

class AddItemViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
    
  }
    // MARK: - Table View Delegates
    override func tableView(
      _ tableView: UITableView,
      willSelectRowAt indexPath: IndexPath
    ) -> IndexPath? {
      return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        //revisit
      //textField.becomeFirstResponder()
    }

    // MARK: - Actions
    @IBAction func cancel() {
      navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
      // Add the following line
        //revisit after attribute error changes are complete
      //print("Contents of the text field: \(textField.text!)")

      navigationController?.popViewController(animated: true)
    }
}
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
      doneBarButton.isEnabled = false
      return true
    }
    
    func textField(
      _ textField: UITextField,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String
    ) -> Bool {
      let oldText = textField.text!
      let stringRange = Range(range, in: oldText)!
      let newText = oldText.replacingCharacters(
        in: stringRange,
        with: string)
      if newText.isEmpty {
        doneBarButton.isEnabled = false
      } else {
        doneBarButton.isEnabled = true
      }
      return true
    }

}
