//
//  HighlightsDetailsViewController.swift
//  775775Sports
//
//  Created by Remya on 9/3/22.
//

import UIKit
import AVKit

class HighlightsDetailsViewController: BaseViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var videoView:UIView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblTime:UILabel!
    @IBOutlet weak var tableViewVideos:UITableView!
    @IBOutlet weak var lblHeader:UILabel!
    @IBOutlet weak var lblAutoPlay: UILabel!
    @IBOutlet weak var switchAutoPlay: UISwitch!
    //MARK: - Variables
    var selectedVideo:VideoList?
   // var videoList:[VideoList]?
    var smallVideoPlayerViewController = AVPlayerViewController()
    var player:AVPlayer?
    var viewModel = NewsViewModel()
    var videoPage = 1
    var isFullScreenTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player?.pause()
        player = nil
        smallVideoPlayerViewController.removeFromParent()
    }
    
    
    
    func initialSettings(){
        setHeaderLabel()
        viewModel.delegate = self
        setTitle(title: "Highlights".localized)
        lblAutoPlay.text = "AUTOPLAY".localized
        lblHeader.text = "Most Watched".localized
        setBackButton()
        tableViewVideos.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableViewVideos.register(UINib(nibName: "LoaderTableViewCell", bundle: nil), forCellReuseIdentifier: "loaderCell")
        configureVideoPlayer()
        displaySelectedVideo()
       
        
    }
    
    func setHeaderLabel(){
        let gradient = lblHeader.getGradientLayer(bounds: lblHeader.bounds)
        lblHeader.textColor = lblHeader.gradientColor(bounds: lblHeader.bounds, gradientLayer: gradient)
    }
    
    func configureVideoPlayer(){
        // smallVideoPlayerViewController.showsPlaybackControls = false
        smallVideoPlayerViewController.delegate = self
        player = AVPlayer()
        smallVideoPlayerViewController.player = player
        smallVideoPlayerViewController.view.frame = videoView.bounds
        smallVideoPlayerViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        smallVideoPlayerViewController.updatesNowPlayingInfoCenter = false
        self.addChild(smallVideoPlayerViewController)
        videoView.addSubview(smallVideoPlayerViewController.view)
        smallVideoPlayerViewController.didMove(toParent: self)
        
    }
    
    func displaySelectedVideo(){
        //player.replaceCurrentItem(with: AVPlayerItem(url: streamingURL))
        lblTitle.text = selectedVideo?.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Utility.dateFormat.ddMMyyyyWithTimeZone.rawValue
        lblTime.text = Utility.formatDate(date: dateFormatter.date(from: selectedVideo?.createTime ?? ""), with: .ddMMyyyyWithTimePretty)
       
        guard let videoUrl = URL(string: selectedVideo?.path ?? "") else{return}
        player?.replaceCurrentItem(with: AVPlayerItem(url: videoUrl))
        NotificationCenter.default
            .addObserver(self,
            selector: #selector(playerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
                         object: player?.currentItem
        )
        player?.play()
       
    }
    
   @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
       if switchAutoPlay.isOn{
       if let index = viewModel.videoList?.firstIndex(where: {$0.id == self.selectedVideo?.id}){
           if index + 1 < (viewModel.videoList?.count ?? 0){
               
                   selectedVideo = viewModel.videoList?[index+1]
                   displaySelectedVideo()
           }
           
       }
       }
    }
    
    func resetPlayer(){
                player?.pause()
                player = nil
                guard let videoUrl = URL(string: selectedVideo?.path ?? "") else{return}
                player = AVPlayer(playerItem: AVPlayerItem(url: videoUrl))
                smallVideoPlayerViewController.player = player
        NotificationCenter.default
            .addObserver(self,
            selector: #selector(playerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
                         object: player?.currentItem
        )
        player?.play()
        isFullScreenTapped = false
    }
}

extension HighlightsDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.videoList?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == ((viewModel.videoList?.count ?? 0) - 1) && videoPage <= (viewModel.videoPageData?.lastPage ?? 0){
            viewModel.getVideos(page: videoPage)
            let cell = tableView.dequeueReusableCell(withIdentifier: "loaderCell", for: indexPath) as! LoaderTableViewCell
            cell.activity.startAnimating()
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        cell.configureCell(obj: viewModel.videoList?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedVideo = viewModel.videoList?[indexPath.row]
        if isFullScreenTapped{
            resetPlayer()
        }
        else{
        displaySelectedVideo()
        }
        
    }
    
    
}


extension HighlightsDetailsViewController:NewsViewModelDelegates{
    func didFinishFetchNews() {
        
    }
    
    func didFinishFetchVideos() {
        videoPage += 1
        tableViewVideos.reloadData()
        
    }
    
    
}


extension HighlightsDetailsViewController:AVPlayerViewControllerDelegate{
    func playerViewController(_ playerViewController: AVPlayerViewController, willEndFullScreenPresentationWithAnimationCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        isFullScreenTapped = true

       print("tiggered")
        
    }
    
}
