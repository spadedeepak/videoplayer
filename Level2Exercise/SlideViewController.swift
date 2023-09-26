//
//  SlideViewController.swift
//  Level2Exercise
//
//  Created by deepak on 05/09/23.
//

import UIKit

class SlideViewController: UIViewController {

   
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lbltitle: UILabel!
    
    var currentslide : Slideinfo!
    var pageindex : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let _ = currentslide else {return}
        imgView.image = UIImage(named: currentslide.img)
        lbltitle.text = currentslide.title
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
class Slideinfo : NSObject
{
    var img = ""
    var title = ""
    
    
    override init (){
        super.init()
    }
    init (_img : String, _title : String)
    {
        self.img = _img
        self.title = _title
    }
    
}
