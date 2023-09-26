//
//  SLidesPagesViewController.swift
//  Level2Exercise
//
//  Created by deepak on 31/08/23.
//

import UIKit

protocol SlidePageDelegate
{
    func pageFinishedAtPosition(_position : Int)
}


class SLidesPagesViewController: UIPageViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    

    var slides = [SlideInfo]()

    var slideDelegate : SlidePageDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = UIColor.white
        setupPageControl()
        loadSlides()
       
        
  
        
        
                    setViewControllers([getViewContoller(_index: 0)], direction: .forward, animated: true)
        // Do any additional setup after loading the view.
    }
    private func setupPageControl() {
            let appearance = UIPageControl.appearance()
            appearance.pageIndicatorTintColor = UIColor.lightGray
            appearance.currentPageIndicatorTintColor = UIColor.darkGray
            appearance.backgroundColor = UIColor.white
        }
    
    func loadSlides()
    {
        let slide1 = SlideInfo (_img: "bunny", _title: "bunny title")
        let slide2 = SlideInfo (_img: "sintel", _title: "sintel")
        let slide3 = SlideInfo (_img: "jelly", _title: "jelly")
        
        
        slides = [slide1, slide2, slide3]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        let page = viewControllers?.first! as! SingleSlideViewController

        var  index : Int = page.pageIndex

        if (index > 0)
        {
            index = index - 1
            return getViewContoller(_index: index)
        }else
        {
            return nil
        }

    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let page = viewControllers?.first! as! SingleSlideViewController

        var  index : Int = page.pageIndex

        if (index < (slides.count - 1 ))
        {
            index = index + 1
            return getViewContoller(_index: index)
        }else
        {
            return nil
        }
    }

    
    func getViewContoller(_index : Int) -> SingleSlideViewController
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "single_slide") as! SingleSlideViewController
        
        let obj = slides[_index]
        vc.currentSLide = obj
        vc.pageIndex = _index
        return vc
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return slides.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
    
    
    // finish
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let page = viewControllers?.first as! SingleSlideViewController
        let index : Int =  page.pageIndex
        
        
       // self.slideDelegate.pageFinishedAtPosition(_position: index)
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
