# ASPopupPreview
ASPopupPreview use long press gesture to enable a quick preview on a 3D touch Devices. On Swipe up you can see the preview action. ASPopupPreview support iOS 13 or later.

# Demo

![](demo.gif)

# Features
1. Long press to preview
2. Swipe up for show action
3. Swipe down for dismiss

# Get Start

## CocoaPods

```
target 'MyApp' do
  pod 'ASPopupPreview', '~> 1.0'
end
```
# Usage

## Import Header File

```
import ASPopupPreview
```
## Add the popup preview
```
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        asPopup = ASPopupPreview(vc: self, delegate: self)
        asPopup?.registerForPreview(sourceView: Your Source View)
        asPopup?.addBlurView(style: .init(style: .light))
        asPopup?.blurEffectView.isHidden = true
    }
```
## Implement ASPopupPreviewDelegate
```
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
```
# Issues & Contact
* If you have any question regarding the usage, please refer to the example project for more details. First build the framework before run the example project.
* If you find any bug, please submit an issue.
