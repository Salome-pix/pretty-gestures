//
//  TwoCircleViewController.swift
//  HM18
//
//  Created by Mcbook Pro on 19.07.22.
//

import UIKit

class TwoCircleViewController: UIViewController {
    
    
    @IBOutlet var redCircleView: UIView!
    @IBOutlet var blueCircleView: UIView!
    @IBOutlet weak var triangleView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add obserevr
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundCollor), name: Notification.Name("changeBackgroundCollor"), object: nil)
        
        
        
        //roundingAview
        roundingAview()
        
        createGesture()
        
        self.setRightTriangle()
    }
    
    @objc func changeBackgroundCollor(){
        view.backgroundColor = .yellow
    }
    
    
    //MARK: - Create rectangle
    
    private func setRightTriangle(){
        let heightWidth = triangleView.frame.size.width //you can use triangleView.frame.size.height
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: heightWidth/2, y: 0))
        path.addLine(to: CGPoint(x:heightWidth, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth/2, y:heightWidth))
        path.addLine(to: CGPoint(x:heightWidth/2, y:0))
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.black.cgColor
        
        triangleView.layer.insertSublayer(shape, at: 0)
    }
    
    //MARK: - gestures
    
    private func createGesture(){
        
        let tapGestureToRed = UITapGestureRecognizer(target: self, action: #selector(redCircleTapped))
        let tapGesturToblue = UITapGestureRecognizer(target: self, action: #selector( blueCircleTapped))
        let tapGesturTobRec = UITapGestureRecognizer(target: self, action: #selector( RectTapped))
        
        self.redCircleView.addGestureRecognizer(tapGestureToRed)
        self.blueCircleView.addGestureRecognizer(tapGesturToblue)
        self.triangleView.addGestureRecognizer(tapGesturTobRec)
    }
    
    
    
    //MARK: - instantiate ImageViewVC
    
    private func toImageVC(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let rootVC = storyBoard.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        self.navigationController?.pushViewController(rootVC, animated: true)
        self.navigationController?.modalPresentationStyle = .fullScreen
    }
    
    
    @objc func redCircleTapped(){
        toImageVC()
        
    }
    
    @objc func blueCircleTapped(){
        toImageVC()
    }
    
    @objc func RectTapped(){
        toImageVC()
    }
    

   private func roundingAview(){
        self.redCircleView.layer.cornerRadius = 50
        self.blueCircleView.layer.cornerRadius = 50
    }
    
    
}
