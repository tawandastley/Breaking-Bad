//
//  LandingViewController.swift
//  Breaking Bad
//
//  Created by Tawanda Chandiwana on 2023/06/21.
//

import UIKit
import Lottie

class LandingViewController: UIViewController {
    
    //private var animationView: LottieAnimationView!
    @IBOutlet var animationView: LottieAnimationView!
    let service = Service()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLottie()
        
    }
    

    func setupLottie() {
        animationView = .init(name: "breaking bad")
        animationView.frame = view.frame
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        animationView.play()
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        let vc = ViewController()
//        service.fetchQuotes { quotes in
//            
//            vc.breakingBadQoutes = quotes
//            print(quotes)
//            DispatchQueue.main.async {
//               
//                vc.tableView.reloadData()
//            }
//        }
        self.present(vc, animated: true)
        
    }
    
    
}
