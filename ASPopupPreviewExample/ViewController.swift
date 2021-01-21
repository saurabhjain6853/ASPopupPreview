//
//  ViewController.swift
//  ASPopupPreviewExample
//
//  Created by Saurabh Jain on 21/01/21.
//

import UIKit
import ASPopupPreview

enum ScreenSize: Int {
    case WIDTH
    case HEIGHT
    
    var value: CGFloat {
        switch self {
        case .WIDTH: return UIScreen.main.bounds.width
        case .HEIGHT: return UIScreen.main.bounds.height
        }
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var imgArr = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg"]
    var asPopup:ASPopupPreview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        asPopup = ASPopupPreview(vc: self, delegate: self)
        
        asPopup?.registerForPreview(sourceView: self.collectionView)
        asPopup?.addBlurView(style: .init(style: .light))
        
        asPopup?.blurEffectView.isHidden = true
    }
}

extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.image.image = UIImage(named: imgArr[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 - 8, height: 250)
    }
}

extension ViewController:ASPopupPreviewDelegate {
    func previewView(location: CGPoint) -> UIViewController? {
        let selectedIndexPath = collectionView.indexPathForItem(at: location)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
        destVC.preferredContentSize = CGSize.init(width: ScreenSize.WIDTH.value, height: ScreenSize.WIDTH.value)
        let str = imgArr[selectedIndexPath?.row ?? 0]
        destVC.imgString = str
        destVC.delegate = self
        return destVC
    }
}

extension ViewController:PreviewDelegate {
    func previewWillShow() {
        asPopup?.blurEffectView.isHidden = false
    }
    
    func previewWillHide() {
        asPopup?.blurEffectView.isHidden = true
    }
}
