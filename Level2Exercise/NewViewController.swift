//
//  NewViewController.swift
//  Level2Exercise
//
//  Created by deepak on 28/08/23.
//

import UIKit
import AVKit
import CoreMedia
class NewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationBarDelegate {

    @IBOutlet weak var DisplayImage: UIImageView!
    
    @IBAction func PlayVideo(_ sender: Any) {
           Videoplaying()
    }
    
    @IBAction func LoadUrl(_ sender: Any) {
        LoadImage()
    }
    
    @IBOutlet weak var TextEntered: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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

    func Videoplaying() {
        let videostring = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        let VideoUrl = URL(string: videostring)
        
        let player = AVPlayer (url: VideoUrl!)
        let controller = AVPlayerViewController()
        
        controller.player = player
        
        
        self.present(controller, animated: true)
        controller.player!.play()
        
    }
    
    func LoadImage() {
        
        let value : String = TextEntered.text!
        let url = URL(string: value)
        guard let _ = url
        else {return}
        
        
//        DispatchQueue.global(priority: .background).async {
//            do {
//
//            }catch
//        }
        
//        DispatchQueue.global(priority: .background).async {
//            do {
//                let data = Data(contentsOf: url!)
//                let img = UIImage(data: data)
//
//                DispatchQueue.main.async {
//                    self.DisplayImage.image = img
//
//                }catch let err
//                {
//                    print("exception")
//                    print(err.localizedDescription)
//                }
//            }
//        }
        
    }
    
    
}
