//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 三輪駿 on 2020/11/27.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!
    
    var imageFile = ["IMG01.JPG", "IMG02.JPG", "IMG03.JPG", "IMG04.jpeg", "IMG05.jpeg", "IMG06.jpeg", "IMG07.jpeg"] // 画像ファイル名を配列で保持
    
    var numOfTaps = 0 // 進む、戻るボタンを押下した回数（進む：＋、戻る：ー）
    var displayImage = 0 // imaageFlie配列の何番目の画像を表示するか
    
    @IBOutlet weak var ImageView: UIImageView!
    
    // ロード時の処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.SlideshowButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        self.ImageView.image = UIImage(named: imageFile[displayImage])
    }
    
    // 画像の再表示
    func setImage() {
        self.displayImage = numOfTaps % imageFile.count
        if self.displayImage < 0 {
            self.displayImage += imageFile.count
        }
        self.ImageView.image = UIImage(named: imageFile[displayImage])
    }
    // 戻るボタン
    @IBOutlet weak var backwardButton: UIButton!
    @IBAction func backwardImage(_ sender: Any) {
        self.numOfTaps -= 1
        self.setImage()
    }
    
    // 進むボタン
    @IBOutlet weak var forwardButton: UIButton!
    @IBAction func forwardImage(_ sender: Any) {
        self.numOfTaps += 1
        self.setImage()
    }
    
    // 再生・停止ボタン
    @IBOutlet weak var SlideshowButton: UIButton!
    @IBAction func startSlideshow(_ sender: Any) {

        if self.timer == nil {
            // 再生ボタン押下時の処理
            self.SlideshowButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)
            self.backwardButton.isEnabled = false
            self.forwardButton.isEnabled = false
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImage(_ :)), userInfo: nil, repeats: true)
            
        } else {
            // 停止ボタン押下時の処理
            self.SlideshowButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.backwardButton.isEnabled = true
            self.forwardButton.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    // 再生ボタン押下時に呼び出される、次の画像を表示する処理
    @objc func nextImage(_ timer:Timer) {
        self.numOfTaps += 1
        self.setImage()
    }
    
    // 拡大画面.戻るボタン押下時に実行される処理
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    // 画像をタップした時の処理
    @IBAction func tapImage(_ sender: Any) {
        if self.timer != nil {
            self.SlideshowButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.backwardButton.isEnabled = true
            self.forwardButton.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
        }
        performSegue(withIdentifier: "toSecond", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let secondViewController: SecondViewController = segue.destination as! SecondViewController
            secondViewController.imageFile = imageFile[displayImage]
        }
    }
}
