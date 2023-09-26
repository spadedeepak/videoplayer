//
//  CoreGraphicsByLegendViewController.swift
//  Level2Exercise
//
//  Created by deepak on 31/08/23.
//

import UIKit

class CoreGraphicsByLegendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Login()
    }
    
    func Login()
    {
        let username = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 20))
        username.backgroundColor = UIColor.white
        username.text = "ENTER USERNAME"
        username.textColor = UIColor.black
      
        
        let usernameField = UITextField(frame: CGRect(x: 30, y: 140, width: 200, height: 20))
        usernameField.backgroundColor = UIColor.gray
        let password = UILabel(frame: CGRect(x: 20, y: 180, width: 200, height: 20))
        password.backgroundColor = UIColor.white
        password.text = "ENTER PASSWORD"
        password.textColor = UIColor.black
        
        
        let passwordfield = UITextField(frame: CGRect(x: 30, y: 220, width: 200, height: 20))
        passwordfield.backgroundColor = UIColor.gray
        let button = UIButton(frame: CGRect(x: 50, y: 280, width: 100, height: 30))
        button.backgroundColor = UIColor.gray
        button.setTitle("SUBMIT", for: .normal)
        button.setTitleColor(.black, for: .normal)
    
        self.view.addSubview(username)
        self.view.addSubview(usernameField)
        self.view.addSubview(password)
        self.view.addSubview(passwordfield)
        self.view.addSubview(button)
        
        
//        self.view.backgroundColor = UIColor.gray
       // self.view.addSubview(Login())
    }
    
   // recursion
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
