//
//  UserData.swift
//  UI Example
//
//  Created by Admin on 22/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class UserData {
    
    func setDefaultValues() {
        UserDefaults.standard.register(defaults: [
            "AGE" : 0,
            "GENRE" : 0,
            "REGISTRATION": false,
            "FONT-SIZE": 14.0])
    }
    
    var registrationValue: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "REGISTRATION")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "REGISTRATION")
        }
    }
    
    var genreValue: Int {
        get {
            return UserDefaults.standard.integer(forKey: "GENRE")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "GENRE")
        }
    }
    
    var nameValue: String {
        get {
            return UserDefaults.standard.string(forKey: "NAME") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "NAME")
        }
    }
    
    var ageValue: Int {
        get {
            return UserDefaults.standard.integer(forKey: ("AGE"))
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AGE")
        }
    }
    
    var biographyValue: String {
        get {
            return UserDefaults.standard.string(forKey: "BIOGRAPHY") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "BIOGRAPHY")
        }
    }
    
    var fontSizeValue: Double {
        get {
            return UserDefaults.standard.double(forKey: "FONT-SIZE")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "FONT-SIZE")
        }
    }
    
}
