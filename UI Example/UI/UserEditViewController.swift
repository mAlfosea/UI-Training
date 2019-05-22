//
//  ViewController.swift
//  UI Example
//
//  Created by Admin on 20/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class UserEditViewController: UIViewController {
    
    var _biography: String = ""
    var _name: String = ""
    var _age: Int = 0
    var _genre: Int = 0
    var _fontSize: Double = 0.0
    
    @IBOutlet weak var ui_editName: UITextField!
    @IBOutlet weak var ui_age_label: UILabel!
    @IBOutlet weak var ui_story_edit: UITextField!
    @IBOutlet weak var ui_story_text_area: UITextView!
    @IBOutlet weak var ui_age_slider: UISlider!
    @IBOutlet weak var ui_toggler_genre: UISegmentedControl!
    @IBOutlet weak var ui_font_size_stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initialize()
    }
    
    
    @IBAction func edit_name_text(_ sender: Any) {
       if let name = ui_editName.text,
            name.count > 0 {
            _name = name
        }
    }
 
    @IBAction func slider_age(_ sender: UISlider) {
        _age = Int(sender.value)
        ui_age_label.text = "Tu as \(_age) ans"
    }
    
    @IBAction func btn_story_submit(_ sender: Any) {
        if let text = ui_story_edit.text,
            text.count > 0 {
            _biography += text + "\n"
            ui_story_text_area.text = _biography
            ui_story_edit.text = ""
            ui_story_edit.resignFirstResponder()
        }
    }
    
    @IBAction func btn_delete_biography(_ sender: Any) {
        _biography = ""
        ui_story_text_area.text = ""
        ui_story_edit.text = ""
        UserData().biographyValue = _biography
    }
    
    @IBAction func toggler_genre(_ sender: Any) {
        _genre = ui_toggler_genre.selectedSegmentIndex
    }
    
    @IBAction func btn_back_button(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepper_font_size(_ sender: Any) {
        _fontSize = ui_font_size_stepper.value
        ui_story_text_area.font = UIFont.systemFont(ofSize: CGFloat(_fontSize))
    }
    
    @IBAction func btn_reset_user_defaults(_ sender: Any) {
        //UserData().registrationValue = false
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn_save(_ sender: Any) {
        let userData = UserData ()
        
        userData.registrationValue = true
        userData.fontSizeValue = _fontSize
        userData.genreValue = _genre
        userData.biographyValue = _biography
        userData.ageValue = _age
        userData.nameValue = _name
        UserDefaults.standard.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
    
    func initialize() {
        
        let userData = UserData()
        
        _biography = userData.biographyValue
        ui_story_text_area.text = _biography
        
        _name = userData.nameValue
        ui_editName.text = _name
        
        _age = userData.ageValue
        ui_age_label.text = "Tu as \(_age) ans"
        ui_age_slider.value = Float(_age)
        
        _genre = userData.genreValue
        ui_toggler_genre.selectedSegmentIndex = _genre
        
        _fontSize = userData.fontSizeValue
        ui_font_size_stepper.value = _fontSize
        ui_story_text_area.font = UIFont.systemFont(ofSize: CGFloat(_fontSize))
    }
}
