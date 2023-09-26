//
//  PageTextViewController.swift
//  Level2Exercise
//
//  Created by deepak on 05/09/23.
//

import UIKit

class PageTextViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    var slides = [Slideinfo]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        self.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadslides()
    {
        let slide1  = Slideinfo(_img: "bunny", _title: "0")
        let slide2 = Slideinfo(_img: "jelly", _title: "1")
        let slide3 = Slideinfo(_img: "sintel", _title: "2")
        
        
        slides = [slide1,slide2,slide3]
        
    }

    func getviewcontroller(_index : Int) -> SlideViewController
    {
        let vc = self.storyboard?.instantiateViewController(identifier: "Slide_View") as! SlideViewController
        
        let obj = slides[_index]
        vc.currentslide = obj
        vc.pageindex = _index
        
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let obj = self.viewControllers?.first as! SlideViewController
        
        var index = obj.pageindex
        if (index > 0 ){
            index = index - 1
            return getviewcontroller(_index: index)
            
        }else{
            return nil
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let obj = self.viewControllers?.first as! SlideViewController
        
        var index = obj.pageindex
        if (index < (slides.count - 1)) {
            index =  index + 1
            return getviewcontroller(_index: index)
            
        }else{
            return nil
        }
    }
}
