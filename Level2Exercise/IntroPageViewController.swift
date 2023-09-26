//
//  IntroPageViewController.swift
//  Level2Exercise
//
//  Created by deepak on 31/08/23.
//

import UIKit

class IntroPageViewController: UIViewController , SlidePageDelegate{

    @IBOutlet weak var vwIntro : UIView!
    @IBOutlet weak var btnInfo : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupPageView()
    }
    
    func setupPageView()
    {
        let page = self.storyboard?.instantiateViewController(identifier: "page_view") as! SLidesPagesViewController
        page.view.frame = vwIntro.bounds
        
        self.addChild(page)
        vwIntro.addSubview(page.view)
        page.didMove(toParent: self)
        page.slideDelegate = self
        
//        playerController.view.frame = vwPlayer.bounds // boundary of the uiview
//        self.addChild(playerController) // add the playerViewcontroller into our main view controller
//        vwPlayer.addSubview(playerController.view) // club the playerController view into the custom view
//        playerController.didMove(toParent: self)
//
        
    }
    func pageFinishedAtPosition(_position: Int) {
        
        if (_position == 2)
        {
            btnInfo.setTitle("Done", for: [])
        }else
        {
            btnInfo.setTitle("Next", for: [])
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
