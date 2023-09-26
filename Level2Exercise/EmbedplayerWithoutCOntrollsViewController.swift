//
//  EmbedplayerWithoutCOntrollsViewController.swift
//  Level2Exercise
//
//  Created by deepak on 29/08/23.
//

import UIKit
import AVKit
class EmbedplayerWithoutCOntrollsViewController: UIViewController {

    @IBOutlet weak var vwPlayer: UIView!
    var player : AVPlayer!
    
    var isPlay = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playVideo(_ sender: Any) {
        
        
        if player == nil
        {
            let videoString = "https://test-videos.co.uk/vids/jellyfish/mp4/h264/1080/Jellyfish_1080_10s_1MB.mp4";
            let videoURL = URL(string: videoString)
            guard let _ = videoURL else {return}
            
             player = AVPlayer(url: videoURL!)
      
            let playerLayer = AVPlayerLayer (player: player)
            playerLayer.frame = vwPlayer.bounds
            vwPlayer.layer.addSublayer(playerLayer)
            player.play()
            isPlay = true
        }else
        {
                if (isPlay)
            {
                player.pause()
                isPlay = false
            }else
            {
                player.play()
                isPlay = true 
            }
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
