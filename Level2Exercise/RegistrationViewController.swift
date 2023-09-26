//
//  RegistrationViewController.swift
//  Level2Exercise
//
//  Created by deepak on 03/09/23.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Registration()
    }
    
    
    func Registration()
    {
        let firstname = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 20))
        firstname.text = "FIRSTNAME"
        firstname.textColor = UIColor.black
        
        let FnameField = UITextField(frame: CGRect(x: 20, y: 160, width: 200, height: 20))
        FnameField.borderStyle = .roundedRect
        
        let lastname = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 20))
        lastname.text = "LASTNAME"
        lastname.textColor = UIColor.black
        
        let LnameField = UITextField(frame: CGRect(x: 20, y: 240, width: 200, height: 20))
        LnameField.borderStyle = .roundedRect
        LnameField.backgroundColor = UIColor.black
        
        let email = UILabel(frame: CGRect(x: 20, y: 280, width: 200, height: 20))
        email.text = "EMAIL"
        email.textColor = UIColor.black
        
        let emailfield = UITextField(frame: CGRect(x: 20, y: 320, width: 200, height: 20))
        emailfield.borderStyle = .roundedRect
        
        let password = UILabel(frame: CGRect(x: 20, y: 360, width: 200, height: 20))
        password.text = "PASSWORD"
        password.textColor = UIColor.black
        
        let Passwordfield = UITextField(frame: CGRect(x: 20, y: 400, width: 200, height: 20))
        Passwordfield.borderStyle = .roundedRect
        
        let conformpassword = UILabel(frame: CGRect(x: 20, y: 440, width: 200, height: 20))
        conformpassword.text = "CONFORM PASSWORD"
        conformpassword.textColor = UIColor.black
        
        let conformfield = UITextField(frame: CGRect(x: 20, y: 480, width: 200, height: 20))
        conformfield.borderStyle = .roundedRect
        
        let button = UIButton(frame: CGRect(x: 20, y: 550, width: 100, height: 25))
        button.setTitle("SUBMIT", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.yellow
        
        let ProfileImage = UIImageView(frame: CGRect(x: 20, y: 600, width: 200, height: 180))
        ProfileImage.image = UIImage(named: "bunny")
        
        
        
        self.view.addSubview(firstname)
        self.view.addSubview(FnameField)
        self.view.addSubview(lastname)
        self.view.addSubview(LnameField)
        self.view.addSubview(email)
        self.view.addSubview(emailfield)
        self.view.addSubview(password)
        self.view.addSubview(Passwordfield)
        self.view.addSubview(conformpassword)
        self.view.addSubview(conformfield)
        self.view.addSubview(button)
        self.view.addSubview(ProfileImage)
        
        
        
        
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
