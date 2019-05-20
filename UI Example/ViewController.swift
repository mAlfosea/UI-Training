//
//  ViewController.swift
//  UI Example
//
//  Created by Admin on 20/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ui_title_label: UILabel!
    @IBOutlet weak var ui_editName: UITextField!
    @IBOutlet weak var ui_age_label: UILabel!
    @IBOutlet weak var ui_story_edit: UITextField!
    @IBOutlet weak var ui_story_text_area: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_submitButton() {
        if let name = ui_editName.text {
            if name == "" {
            ui_title_label.text = "Pas de nom ?"
            } else {
                ui_title_label.text = name
            }
        } else {
            ui_title_label.text = "Personne"
        }
    }
    @IBAction func slider_age(_ sender: UISlider) {
        let ageTemp = Int(sender.value)
        ui_age_label.text = "Tu as \(ageTemp) ans"
    }
    @IBAction func btn_story_submit(_ sender: Any) {
        if let text = ui_story_edit.text {
            if text == "" {
                
            } else {
            ui_story_text_area.text += text + "\n"
            ui_story_edit.text = ""
            }
        }
    }
}

