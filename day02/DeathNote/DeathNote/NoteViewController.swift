//
//  NoteViewController.swift
//  DeathNote
//
//  Created by Tyrone STEPHEN on 2019/10/11.
//  Copyright © 2019 Tyrone STEPHEN. All rights reserved.
//

import UIKit
import os.log

class NoteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var selectedDate: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var nameButton: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    var deathNote: Death?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameButton.delegate = self
        updateDoneButtonState()
        // Do any additional setup after loading the view.
    }

    //MARK: navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === doneButton else {
            os_log("The done button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameButton.text ?? ""
        let desc = descriptionField.text ?? ""
        let date = selectedDate.date
        
        // format date
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        // Make new note
        deathNote = Death(name: name, desc: desc, date: dateFormatterPrint.string(from: date))
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        doneButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateDoneButtonState()
    }
    
    private func updateDoneButtonState() {
        let text = nameButton.text ?? ""
        doneButton.isEnabled = !text.isEmpty
    }
    
}

