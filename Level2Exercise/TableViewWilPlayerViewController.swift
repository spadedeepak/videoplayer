//
//  TableViewWilPlayerViewController.swift
//  Level2Exercise
//
//  Created by deepak on 30/08/23.
//

import UIKit
import AVKit
class TableViewWilPlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var vwPlayer : UIView!
    @IBOutlet weak var tblList : UITableView!
    var items = [VideoItems]()
    var player : AVQueuePlayer!
    var playerItems = [AVPlayerItem]()
    var currentItem = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblList.delegate = self
        self.tblList.dataSource = self

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        print("view bounds") // respective to self coordination
        print(vwPlayer.bounds)
        print("view frame") // respective to parent coordingation 
        print(vwPlayer.frame)
        
        
        loadVideos()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func loadVideos()
    {
        let video_urls = ["https://test-videos.co.uk/vids/jellyfish/mp4/h264/1080/Jellyfish_1080_10s_1MB.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://test-videos.co.uk/vids/sintel/mp4/h264/1080/Sintel_1080_10s_5MB.mp4"]
        
        let obj1 = VideoItems (_video_title: "Jelly Fish", _video_thumbnail: "jelly", _video_url: "https://test-videos.co.uk/vids/jellyfish/mp4/h264/1080/Jellyfish_1080_10s_1MB.mp4")
        let obj2 = VideoItems (_video_title: "Bunny", _video_thumbnail: "bunny", _video_url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        let obj3 = VideoItems (_video_title: "Sintel", _video_thumbnail: "sintel", _video_url: "https://test-videos.co.uk/vids/sintel/mp4/h264/1080/Sintel_1080_10s_5MB.mp4")
        
        
        items = [obj1,obj2, obj3]
        tblList.reloadData()
        
   
        for item in items
        {
            
            let item = AVPlayerItem (url: URL (string: item.video_url)!)
            playerItems.append(item)
        }
        
         player  = AVQueuePlayer(items: playerItems)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        
        // specific code to fit into the view
        playerController.view.frame = vwPlayer.bounds // boundary of the uiview
        self.addChild(playerController) // add the playerViewcontroller into our main view controller
        vwPlayer.addSubview(playerController.view) // club the playerController view into the custom view
        playerController.didMove(toParent: self) // ask the player controller to move inside the parent (current VC - slef )
        
        player.play()
        

    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "video_cell", for: indexPath) as! VideoTableViewCell
        
        cell.imgVideo.image = UIImage (named: items[indexPath.row].video_thumbnail)
        cell.lblVideo.text = items[indexPath.row].video_title
        
        cell.selectionStyle = .none
     
      
        
        return cell
    }

}
class VideoTableViewCell : UITableViewCell
{
    @IBOutlet weak var imgVideo : UIImageView!
    @IBOutlet weak var lblVideo : UILabel!
    @IBOutlet weak var imgCurrent : UIImageView!
}

class VideoItems : NSObject
{
    var video_title = ""
    var video_thumbnail = ""
    var video_url = ""
    
    override init() {
        super.init()
    }
    init(_video_title : String, _video_thumbnail : String, _video_url : String)
    {
        self.video_title = _video_title
        self.video_thumbnail = _video_thumbnail
        self.video_url = _video_url
    }
}
