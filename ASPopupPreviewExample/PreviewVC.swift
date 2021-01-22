//
//  PreviewVC.swift
//  ASPopupPreviewExample
//
//  Created by kapilmac on 21/01/21.
//

import UIKit

protocol PreviewDelegate {
    func previewWillShow()
    func previewWillHide()
}

class PreviewVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var imgString = ""
    var delegate:PreviewDelegate!
    
    override var previewActionItems: [UIPreviewActionItem] {
        return previewActions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image.image = UIImage(named: imgString)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate.previewWillShow()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate.previewWillHide()
    }
    
    func previewActions() -> [UIPreviewActionItem] {
        let actionDetail = UIPreviewAction.init(title: "View Details", style: .default) { (action, vcRefrence) in
            print("Tapped")
        }
        
        let makeOffer = UIPreviewAction.init(title: "Make Offer", style: .default) { (action, vcRefrence) in
            print("Tapped")
        }
        
        let actionMessage = UIPreviewAction.init(title: "Message", style: .default) { (action, vcRefrence) in
            print("Tapped")
        }
        
        let share = UIPreviewAction.init(title: "Share", style: .default) { (action, vcRefrence) in
            print("Tapped")
        }
        
        return [actionDetail, makeOffer, actionMessage, share]
    }
}
