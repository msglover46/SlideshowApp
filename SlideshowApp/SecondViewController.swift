//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 三輪駿 on 2020/11/28.
//

import UIKit

class SecondViewController: UIViewController {

    var imageFile: String = ""
    
    @IBOutlet weak var expandImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.expandImage.image = UIImage(named: imageFile)

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

}
