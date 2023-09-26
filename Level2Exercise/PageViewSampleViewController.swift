//
//  PageViewSampleViewController.swift
//  Level2Exercise
//
//  Created by deepak on 04/09/23.
//

import UIKit

class PageViewSampleViewController: UIPageViewController , UIPageViewControllerDelegate , UIPageViewControllerDataSource{
 
    var slides = [SlideInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = UIColor.white
        setupPageControl()
        loadSlides()

        
        
        // view did load -> when a view controller object started creating programmatically
        // view will appear -> when the ui of the view controller is about to present in device
        // view did appear -> when the UI if finally presented in the screen
        // view will disappear -> when any navigation /  popup / other overlay about to present on the screen
        // view did disappear -> when screeen is in stack but hidden by another screen
        
        
        // pageViewController
        // -> series of viewCOntrollers
        // current screen
        // next screen
        // previous screen 
        
        
        // to set initial screen
        
        
        
        setViewControllers([getViewContoller(_index: 0)], direction: .forward, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
    }
    
    // delegate to show next page


    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
        let obj = self.viewControllers?.first as! SingleSlideViewController
    
        var index : Int = obj.pageIndex
        
        if (index < (slides.count - 1 ))
        {
            index = index + 1
            return getViewContoller(_index: index)
        }else
        {
            return nil
        }
        
    }
// to print page indicator
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    private  func setupPageControl() {
            let appearance = UIPageControl.appearance()
            appearance.pageIndicatorTintColor = UIColor.lightGray
            appearance.currentPageIndicatorTintColor = UIColor.darkGray
            appearance.backgroundColor = UIColor.white
        }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    // page control code ends

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let obj = self.viewControllers?.first as! SingleSlideViewController
        var index : Int = obj.pageIndex
        
        if (index > 0)
        {
            index = index - 1
            return getViewContoller(_index: index)
        }else
        {
            return nil
        }
    }
    
    func loadSlides()
    {
        let slide1 = SlideInfo (_img: "bunny", _title: "bunny title")
        let slide2 = SlideInfo (_img: "sintel", _title: "sintel")
        let slide3 = SlideInfo (_img: "jelly", _title: "jelly")
        
        
        slides = [slide1, slide2, slide3]
    }

    // to generate the view controller page as per the index using the slide array
    func getViewContoller(_index : Int) -> SingleSlideViewController
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "single_slide") as! SingleSlideViewController
        
        let obj = slides[_index]
        vc.currentSLide = obj
        vc.pageIndex = _index
        return vc
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
