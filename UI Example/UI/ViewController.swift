//
//  ViewController.swift
//  UI Example
//
//  Created by Admin on 20/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _biography: String = ""
    var _name: String = ""
    var _age: Int = 0
    var _genre: Int = 0
    
    @IBOutlet weak var ui_title_label: UILabel!
    @IBOutlet weak var ui_editName: UITextField!
    @IBOutlet weak var ui_age_label: UILabel!
    @IBOutlet weak var ui_story_edit: UITextField!
    @IBOutlet weak var ui_story_text_area: UITextView!
    @IBOutlet weak var ui_age_slider: UISlider!
    @IBOutlet weak var ui_toggler_genre: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    @IBAction func btn_submitButton() {
        if let name = ui_editName.text,
            name.count > 0 {
            _name = name
            ui_title_label.text = _name
            UserDefaults.standard.set(_name, forKey: "NAME")
        }
    }
    @IBAction func slider_age(_ sender: UISlider) {
        _age = Int(sender.value)
        ui_age_label.text = "Tu as \(_age) ans"
        UserDefaults.standard.set(_age, forKey: "AGE")
    }
    @IBAction func btn_story_submit(_ sender: Any) {
        if let text = ui_story_edit.text,
            text.count > 0 {
            _biography += text + "\n"
            ui_story_text_area.text = _biography
            ui_story_edit.text = ""
            UserDefaults.standard.set(_biography, forKey: "BIOGRAPHY")
            ui_story_edit.resignFirstResponder()
        }
    }
    @IBAction func btn_delete_biography(_ sender: Any) {
        _biography = ""
        ui_story_text_area.text = ""
        ui_story_edit.text = ""
        UserDefaults.standard.set(_biography, forKey: "BIOGRAPHY")
    }
    @IBAction func toggler_genre(_ sender: Any) {
        _genre = ui_toggler_genre.selectedSegmentIndex
        UserDefaults.standard.set(_genre, forKey: "GENRE")
    }
    @IBAction func btn_back_button(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "REGISTRATION")
        dismiss(animated: true, completion: nil)
    }
    
    func initialize() {
        
        if let biographyTemp = UserDefaults.standard.string(forKey: "BIOGRAPHY") {
            _biography = biographyTemp
            ui_story_text_area.text = _biography
        }
        if let nameTemp = UserDefaults.standard.string(forKey: "NAME") {
            _name = nameTemp
            ui_title_label.text = _name
        }
        
        _age = UserDefaults.standard.integer(forKey: "AGE")
        ui_age_label.text = "Tu as \(_age) ans"
        ui_age_slider.value = Float(_age)
        
        _genre = UserDefaults.standard.integer(forKey: "GENRE")
        ui_toggler_genre.selectedSegmentIndex = _genre
    }
}

