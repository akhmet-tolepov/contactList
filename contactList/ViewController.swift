

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var numberField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addContact(_ sender: Any) {
        let name = nameField.text!
        let surname = surnameField.text!
        let number = numberField.text!
        
        let newContact = Contacts(name: name, surname: surname, phone: number)
        
        do {
            if let data = UserDefaults.standard.data(forKey: "contactArray") {
                var array = try JSONDecoder().decode([Contacts].self, from: data)
                array.append(newContact)
                let encodedata = try JSONEncoder().encode(array)
                UserDefaults.standard.set(encodedata, forKey: "contactArray")
            } else {
                let encodedata = try JSONEncoder().encode([newContact])
                UserDefaults.standard.set(encodedata, forKey: "contactArray")
            }
        } catch {
            print("unable to encode \(error)")
        }
        
        nameField.text = ""
        surnameField.text = ""
        numberField.text = ""
    }
    
}

