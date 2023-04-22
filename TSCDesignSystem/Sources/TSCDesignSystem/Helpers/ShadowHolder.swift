import UIKit

protocol ShadowHolder: UIView {
    var shadowLayer: CAShapeLayer? { get set }
    func addShadow()
}

extension ShadowHolder {
    func addShadow() {
        if shadowLayer == nil {
            let shadow = CAShapeLayer()
            shadow.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
            shadow.fillColor = UIColor.white.cgColor
            shadow.shadowColor = UIColor.black.cgColor
            shadow.shadowPath = shadow.path
            shadow.shadowOffset = CGSize(width: 0.0, height: 6)
            shadow.shadowOpacity = 0.12
            shadow.shadowRadius = 24
            shadow.masksToBounds = false
            shadowLayer = shadow
            layer.insertSublayer(shadow, at: 0)
        }
    }
}
