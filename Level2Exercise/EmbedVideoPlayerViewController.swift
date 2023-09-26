//
//  EmbedVideoPlayerViewController.swift
//  Level2Exercise
//
//  Created by deepak on 29/08/23.
//

import UIKit
import AVKit
class EmbedVideoPlayerViewController: UIViewController {

    @IBOutlet weak var vwPlayer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func playVideoAction(_ sender: Any) {
        
        let videoString = "https://test-videos.co.uk/vids/jellyfish/mp4/h264/1080/Jellyfish_1080_10s_1MB.mp4";
        let videoURL = URL(string: videoString)
        guard let _ = videoURL else {return}
        
        let player = AVPlayer(url: videoURL!)
        
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        
        // specific code to fit into the view
        playerController.view.frame = vwPlayer.bounds // boundary of the uiview
        self.addChild(playerController) // add the playerViewcontroller into our main view controller
        vwPlayer.addSubview(playerController.view) // club the playerController view into the custom view
        playerController.didMove(toParent: self) // ask the player controller to move inside the parent (current VC - slef )
        
        player.play()
//        let playerLayer = AVPlayerLayer (player: player)
//        playerLayer.frame = vwPlayer.bounds
//        vwPlayer.layer.addSublayer(playerLayer)
//        player.play()
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
