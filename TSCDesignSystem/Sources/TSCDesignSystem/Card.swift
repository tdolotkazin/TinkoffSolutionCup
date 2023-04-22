import UIKit

public final class Card: UIView, ShadowHolder {

    enum Spec {
        static let headerInsets = UIEdgeInsets(top: 16, left: 20, bottom: 8, right: 16)
        static let avatarInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        static let subheaderInsets = UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
        static let cornerRadius: CGFloat = 24
    }

    private var header: CardHeader    
    private let style: Theme

    // MARK: ShadowHolder
    var shadowLayer: CAShapeLayer?

    public init(headerConfiguration: HeaderConfiguration, style: Theme = .regular) {
        self.header = CardHeader(configuration: headerConfiguration)
        self.style = style
        super.init(frame: .zero)
        addSubviews(header)
        switch style {
        case .regular:
            backgroundColor = Colors.regularCardBackgorund
        case .pale:
            backgroundColor = Colors.paleCardBackgorund
        }

        layer.cornerRadius = Spec.cornerRadius
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        if case .regular = style {
            addShadow()
        }
        header.frame = CGRect(
            origin: .zero,
            size: header.sizeThatFits(CGSize(width: frame.width, height: frame.height)))
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let headerHeight = header.sizeThatFits(size).height
        let contentMinHeight: CGFloat = 4
        let calculatedSize = CGSize(width: size.width, height: headerHeight + contentMinHeight)
        return calculatedSize
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
