import Foundation
import UIKit
class viewController1: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let label:UILabel = UILabel()
        label.text = "2"
        label.textColor = .black
        label.backgroundColor = .red
        view.addSubview(label)
    }
}
