import UIKit
import Lightbox

class ViewController: UIViewController {
  
  lazy var showButton: UIButton = { [unowned self] in
    let button = UIButton()
    button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
    button.setTitle("Show me the lightbox", for: UIControl.State())
    button.setTitleColor(UIColor(red:0.47, green:0.6, blue:0.13, alpha:1), for: UIControl.State())
    button.titleLabel?.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 30)
    button.frame = UIScreen.main.bounds
    button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
    view.backgroundColor = UIColor.white
    view.addSubview(showButton)
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear called")
    }
  
  // MARK: - Action methods
  
  @objc func showLightbox() {
    let images = [
      LightboxImage(imageURL: URL(string: "https://cdn.arstechnica.net/2011/10/05/iphone4s_sample_apple-4e8c706-intro.jpg")!),
      LightboxImage(
        image: UIImage(named: "photo1")!,
        text: "Photography is the science, art, application and practice of creating durable images by recording light or other electromagnetic radiation, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film"
      ),
      LightboxImage(
        image: UIImage(named: "photo2")!,
        text: "Dimple\nToday 12:00 AM",
        videoURL: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      ),
      LightboxImage(
        image: UIImage(named: "photo3")!,
        text: "A lightbox is a translucent surface illuminated from behind, used for situations where a shape laid upon the surface needs to be seen with high contrast."
      )
    ]
    
    let controller = LightboxController(images: images)
//    controller.headerView.closeButton.setImage(UIImage(named: "grid")?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    controller.pageDelegate = self
    LightboxConfig.CloseButton.text = ""
    LightboxConfig.CloseButton.isGridButton = false
    LightboxConfig.CloseButton.image = UIImage(named: "grid")?.withRenderingMode(.alwaysOriginal)
    
    controller.dismissalDelegate = self
    
    
    controller.initialPage = 2
    controller.dynamicBackground = true
    controller.modalTransitionStyle = .crossDissolve
    controller.modalPresentationStyle = .currentContext
    present(controller, animated: true) {
        LightboxConfig.handleVideo(controller, URL(string:"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
    }
    
  }
    
}
extension ViewController : LightboxControllerPageDelegate{
    func lightboxController(_ controller: LightboxController, didMoveToPage page: Int) {
        
    }
}

extension ViewController : LightboxControllerDismissalDelegate{
    func lightboxControllerWillDismiss(_ controller: LightboxController, _ isFromMenuButton: Bool) {
    }
    

    
    
}
