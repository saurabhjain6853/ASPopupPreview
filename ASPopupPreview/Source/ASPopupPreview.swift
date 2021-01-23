import UIKit

public protocol ASPopupPreviewDelegate {
func previewView(location:CGPoint) -> UIViewController?
}

public class ASPopupPreview: NSObject {
    
    var vc:UIViewController?
    var delegate:ASPopupPreviewDelegate?
    public var blurEffectView = UIVisualEffectView()
    
    public init(vc:UIViewController, delegate:ASPopupPreviewDelegate) {
        self.vc = vc
        self.delegate = delegate
    }
    
    public func registerForPreview(sourceView:UIView) {
        if let vc = vc {
            if vc.traitCollection.forceTouchCapability == .available {
                vc.registerForPreviewing(with: self, sourceView: sourceView)
            }
        }
    }
    
    public func addBlurView(style:UIBlurEffect) {
        if !UIAccessibility.isReduceTransparencyEnabled, let vc = vc {
            vc.view.backgroundColor = .clear

            let blurEffect = UIBlurEffect(style: .light)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = vc.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            vc.view.addSubview(blurEffectView)
        }
    }
}

extension ASPopupPreview:UIViewControllerPreviewingDelegate {
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let delegate = self.delegate {
            return delegate.previewView(location: location)
        }
        return nil
    }
    
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
}
