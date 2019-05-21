import UIKit

class EditPersonViewController: UIViewController {
    
    @IBOutlet weak var ui_title_label: UILabel!
    @IBOutlet weak var ui_genre_label: UILabel!
    @IBOutlet weak var ui_name_label: UILabel!
    @IBOutlet weak var ui_age_label: UILabel!
    @IBOutlet weak var ui_notes_view: UITextView!
    @IBOutlet weak var stack_user_infos: UIStackView!
    @IBOutlet weak var view_first_conection: UIView!
    @IBOutlet weak var btn_edit_infos: UIButton!
    
    var _genre: Int = 0
    var _name: String = ""
    var _age: Int = 0
    var _notes: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        initiateUI()
    }
    
    func initiateUI() {
        
        registerUserDefault()
        
        let userRegistrationTemp = UserDefaults.standard.bool(forKey: "REGISTRATION")
        if userRegistrationTemp == false {
            stack_user_infos.isHidden = true
            btn_edit_infos.isHidden = true
            view_first_conection.isHidden = false
            initInscriptionView()
        } else {
            stack_user_infos.isHidden = false
            btn_edit_infos.isHidden = false
            view_first_conection.isHidden = true
            initUserInfos()
        }
    }
    
    func initUserInfos() {
        _genre = UserDefaults.standard.integer(forKey: "GENRE")
        switch _genre {
        case 0:
            ui_genre_label.text = "Homme"
        case 1:
            ui_genre_label.text = "Femme"
        default:
            ui_genre_label.text = "Inconnu"
        }
        
        if let nameTemp = UserDefaults.standard.string(forKey: "NAME") {
            _name = nameTemp
            ui_name_label.text = _name
            ui_title_label.text = "Bonjour \(_name)"
        }
        
        _age = UserDefaults.standard.integer(forKey: ("AGE"))
        ui_age_label.text = String(_age)
        
        if let bioTemp = UserDefaults.standard.string(forKey: "BIOGRAPHY") {
            _notes = bioTemp
            ui_notes_view.text = _notes
        }
    }
    
    func initInscriptionView() {
        
    }
    
    func registerUserDefault(){
        UserDefaults.standard.register(defaults: [
            "AGE" : 0,
            "GENRE" : 0,
            "REGISTRATION": false])
        
        //UserDefaults.standard.set(false, forKey: "REGISTRATION")
    }
}
