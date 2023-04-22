import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }

    func setFrame(_ frame: CGRect?) {
        if let frame {
            self.frame = frame
        }
    }
}
