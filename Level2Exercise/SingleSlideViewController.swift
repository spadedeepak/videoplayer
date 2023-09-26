//
//  SingleSlideViewController.swift
//  Level2Exercise
//
//  Created by deepak on 31/08/23.
//

import UIKit

class SingleSlideViewController: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblTitle : UILabel!
    var currentSLide : SlideInfo!
    var pageIndex : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let _ = currentSLide else {return }
        imgView.image = UIImage (named: currentSLide.slideImg)
        lblTitle.text = currentSLide.slideTitle

        // Do any additional setup after loading the view.
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
class SlideInfo : NSObject
{
    var slideImg = ""
    var slideTitle = ""
    override init() {
        super.init()
    }
    init(_img : String , _title : String)
    {
        self.slideImg = _img
        self.slideTitle = _title
    }
}
