//
//  GalleryTestingViewController.swift
//  Level2Exercise
//
//  Created by deepak on 29/08/23.
//

import UIKit

class GalleryTestingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func gallery(_ sender: Any) {
        Galleryopening()
    }
    @IBOutlet weak var imgview: UIImageView!
    var imagepicker : UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker = UIImagePickerController()
        imagepicker.delegate = self
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
    
    func Galleryopening() {
        
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            imagepicker.sourceType = .photoLibrary
            imagepicker.allowsEditing = true
            present(imagepicker, animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let originalimage = info[.originalImage] as! UIImage
        if let _ = info[.editedImage]{
            let _ = info[.editedImage] as! UIImage
        }
        
        imgview.image = originalimage
        picker.dismiss(animated: true)
        
    }
    
    
}



