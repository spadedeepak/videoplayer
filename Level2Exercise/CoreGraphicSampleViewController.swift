//
//  CoreGraphicSampleViewController.swift
//  Level2Exercise
//
//  Created by deepak on 31/08/23.
//

import UIKit

class CoreGraphicSampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addLabel()
    }
    
    func addLabel()
    {
        
         // UIKIT -> storyboard
            //programatic
        
        // SWIFT UI
        
        // frame - position of an element (x , y width and height) respective to parent
        // Bounds - position of an elements (x, y, width and height ) respetive to itself
        
        let label = UILabel (frame: CGRect (x: 10, y: 10, width: 60, height: 50))
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.text = "vanakkam"
        
        
        let secondView = UIView (frame: CGRect (x: 50, y: 200, width: 200, height: 200))
        secondView.backgroundColor = UIColor.green
        secondView.clipsToBounds = true // to clip the child element
        secondView.addSubview(label)
        
        
        // using this concept. create a Login Form
        // logo
        // email label
         //    .. email field
        // password label
        // password field
        //  button field
        
        // try to match the colors and font sizes .
        
        self.view.backgroundColor = UIColor.brown
        self.view.addSubview(secondView)
      
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
