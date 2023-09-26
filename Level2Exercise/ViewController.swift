//
//  ViewController.swift
//  Level2Exercise
//
//  Created by deepak on 27/06/23.
//

import UIKit
import AVKit // AudioVideoKit 


import CoreMedia
class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var imgExample : UIImageView!
    var imagePicker : UIImagePickerController!
    @IBOutlet weak var tfUrl : UITextField!
  
    override func viewDidLoad() { // parent class - UIVIewCOntroller -> it has the function viewdidload
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraAction()
    {
        openCamera()
    }
    
    @IBAction func galleryAction()
    {
        openGallery()
    }

    @IBAction func videoAction(_ sender: Any) {
        
     presentVideo() // external player controller
                    // with in existing viewController // tomorrow
        
    }
    
    func playInside()
    {
        
    }
    

    
    func presentVideo()
    {
        
        
        
//        / 1. get video string
//        2. convert string into a url
//        3. create a video player using the url
//        4. create an object of the AvPlayerCOntroller
//        5. assign the player to the avPLayerController player
//        6. present the playerController
//
//
        let video_urls = ["https://test-videos.co.uk/vids/jellyfish/mp4/h264/1080/Jellyfish_1080_10s_1MB.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://test-videos.co.uk/vids/sintel/mp4/h264/1080/Sintel_1080_10s_5MB.mp4"]
        
        let videoString = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        
        let videoURL = URL(string: videoString)
        guard let _ = videoURL else {return}
        
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    @IBAction func loadUrl()
    {
        let string : String = tfUrl.text!
        let url = URL (string: string) // create an uRL object out of string
        // in case of special symbol / white spaces or some issues, url might be invalid,
        // to prevent  we use guard
        guard let _ = url
        else {return} // guard -> to prevent nullable crashes
        
        
        
        
        // default - main thread / UI thread
        
        // 1. from url -> create a raw data
        // 2. From raw data -> convert int to image
        // 3 . assign that image into imageView
        
        // wri
        // why background thread?
        
        // when there is a need for external resource // hardware (bluetooth / camera / hardDisk  ) // resources outside app
        // background thread
        
         // DispatchQueue -> to move the current thread to any queue
        
        DispatchQueue.global(priority: .background).async {
            do
            {
                let dataValues = try Data ( contentsOf: url!)
                let img = UIImage (data: dataValues)
                print("image created")
               
                
                
                DispatchQueue.main.async {
                    self.imgExample.image = img // UI Widgets must be called from main thread -> so code need to moved to main thread
                }
                
             
                
            }catch let err
            {
                print("exception")
                print(err.localizedDescription)
            }
            
        }
    

        
        
//        DispatchQueue.global(priority: .background).async {
//            do
//            {
//
//                let dataValues = try Data (contentsOf: url!)
//                let img = UIImage (data: dataValues)
//
//
//                DispatchQueue.main.async {
//                    self.imgExample.image = img
//                }
//
//
//
//
//
//            }catch let ex
//            {
//                print(ex.localizedDescription)
//            }
//        }
    
    
    }
    func openCamera()
    {
        if (UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
            
        }
    }
    
    func openGallery()
    {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("image picker cancelled")
       picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let originalIMage = info[.originalImage] as! UIImage
        if let _ = info[.editedImage]
        {
            let editedImage = info[.editedImage] as! UIImage
            
        }
     
        imgExample.image = originalIMage
        picker.dismiss(animated: true)
    }
}


