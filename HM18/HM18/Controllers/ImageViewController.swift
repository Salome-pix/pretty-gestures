//
//  ViewController.swift
//  HM18
//
//  Created by Mcbook Pro on 19.07.22.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLongGesture()
        createTapGesture()
        createPinch()

    }
    
    private func createTapGesture(){
        var tapGesture = UITapGestureRecognizer()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        myImageView.addGestureRecognizer(tapGesture)
    }
    
    private func createLongGesture(){
        var longgesture = UILongPressGestureRecognizer()
        longgesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        myImageView.addGestureRecognizer(longgesture)
    }
   
    private func createPinch(){
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        self.myImageView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        self.myImageView.fadeOut()
    }
    
    @objc func tapped(_ sender: UILongPressGestureRecognizer) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         let VC = storyBoard.instantiateViewController(withIdentifier: "TwoCircleViewController") as! TwoCircleViewController
        self.present(VC, animated: true, completion: nil)
    }
    
    
    @objc func pinched(_ gesture: UIPinchGestureRecognizer){
        if gesture.state == .began || gesture.state == .changed {
        NotificationCenter.default.post(name: NSNotification.Name("changeBackgroundCollor"), object: nil, userInfo: nil)
        let scaleResult = gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        gesture.view?.transform = scale
        gesture.scale = 1
        }else if gesture.state == .ended {
            self.myImageView.transform = CGAffineTransform.identity
         }
    }
}
    
extension UIImageView {
    func fadeOut(duration: TimeInterval = 2) {
    UIImageView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
      }
}
