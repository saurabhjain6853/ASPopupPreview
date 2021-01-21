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
}
