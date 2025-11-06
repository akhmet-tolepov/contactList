//
//  ContactViewController.swift
//  contactList
//
//  Created by Кенжебаева Аиша on 06.11.2025.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var changeName: UITextField!
    @IBOutlet weak var changeSurname: UITextField!
    @IBOutlet weak var changePhone: UITextField!
    
    var contact = Contacts()
    var contactIndex: Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        changeName.text = contact.name
        changeSurname.text = contact.surname
        changePhone.text = contact.phone
    }
    
    @IBAction func change(_ sender: Any) {
        let name = changeName.text!
        let surname = changeSurname.text!
        let number = changePhone.text!
        
        let newContact = Contacts(name: name, surname: surname, phone: number)
        
        guard let index = contactIndex! as Int? else {return}
        
        do {
            if let data = UserDefaults.standard.data(forKey: "contactArray") {
                var array = try JSONDecoder().decode([Contacts].self, from: data)
                array[index] = newContact
                let encodedata = try JSONEncoder().encode(array)
                UserDefaults.standard.set(encodedata, forKey: "contactArray")
            } else {
                let encodedata = try JSONEncoder().encode([newContact])
                UserDefaults.standard.set(encodedata, forKey: "contactArray")
            }
        } catch {
            print("unable to encode \(error)")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
