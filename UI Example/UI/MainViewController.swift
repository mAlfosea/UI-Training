import UIKit

class MainViewController: UIViewController {
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initiateUI()
    }
    
    func initiateUI() {
        let userData = UserData()
        
        let userRegistrationTemp = userData.registrationValue
        if userRegistrationTemp == false {
            ui_title_label.text = "Bonjour"
            stack_user_infos.isHidden = true
            btn_edit_infos.isHidden = true
            view_first_conection.isHidden = false
        } else {
            stack_user_infos.isHidden = false
            btn_edit_infos.isHidden = false
            view_first_conection.isHidden = true
            initUserInfos()
        }
    }
    
    func initUserInfos() {
        let userData = UserData()
        
        _genre = userData.genreValue
        switch _genre {
        case 0:
            ui_genre_label.text = "Homme"
        case 1:
            ui_genre_label.text = "Femme"
        default:
            ui_genre_label.text = "Inconnu"
        }
        
        _name = userData.nameValue
        ui_name_label.text = _name
        ui_title_label.text = "Bonjour \(_name)"
        
        _age = userData.ageValue
        ui_age_label.text = "\(String(_age)) an(s)"
        
        _notes = userData.biographyValue
        ui_notes_view.text = _notes
    }
}
