import UIKit

public final class Card: UIView, ShadowHolder {

    struct Layout {
        let headerFrame: CGRect
        let subheaderFrame: CGRect
        let avatarFrame: CGRect
        let size: CGSize
    }

    enum Spec {
        static let headerInsets = UIEdgeInsets(top: 16, left: 20, bottom: 8, right: 16)
        static let avatarInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        static let subheaderInsets = UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
        static let cornerRadius: CGFloat = 24
    }

    private let header: Label
    private let subheader: Label
    private let avatar: Avatar
    private var layout: Layout?

    var shadowLayer: CAShapeLayer?

    public init(header: String, subheader: String, avatar: UIImage?) {
        self.header = Label(style: .header, text: header)
        self.subheader = Label(style: .subheader, text: subheader)
        self.avatar = Avatar(image: avatar)
        super.init(frame: .zero)
        addSubviews(self.header, self.subheader, self.avatar)
        backgroundColor = Colors.cardBackgorund
        layer.cornerRadius = Spec.cornerRadius
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        header.setFrame(layout?.headerFrame)
        subheader.setFrame(layout?.subheaderFrame)
        avatar.setFrame(layout?.avatarFrame)
        addShadow()
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let avatarSize = avatar.sizeThatFits(size)
        let avatarFrame = CGRect(
            origin: CGPoint(
                x: size.width - avatarSize.width - Spec.avatarInsets.right,
                y: Spec.avatarInsets.top),
            size: avatarSize)
        let headerMaxWidth = size.width - Spec.avatarInsets.right - avatarSize.width - Spec.avatarInsets.left - Spec.headerInsets.left
        let headerSize = header.sizeThatFits(CGSize(
            width: headerMaxWidth,
            height: size.height)) // Add subheader to calculation
        let headerFrame = CGRect(
            origin: CGPoint(
                x: Spec.headerInsets.left,
                y: Spec.headerInsets.top
            ), size: headerSize)
        let subheaderSize = subheader.sizeThatFits(
            CGSize(
                width: headerMaxWidth,
                height: size.height - headerSize.height - Spec.headerInsets.top - Spec.headerInsets.bottom
            )
        )
        let subheaderFrame = CGRect(
            origin: CGPoint(
                x: headerFrame.minX,
                y: headerFrame.maxY + Spec.headerInsets.bottom),
            size: subheaderSize
        )
        let calculatedSize = CGSize(
            width: size.width,
            height: headerSize.height + Spec.headerInsets.top + Spec.headerInsets.bottom + subheaderSize.height + Spec.subheaderInsets.bottom)
        layout = Layout(
            headerFrame: headerFrame,
            subheaderFrame: subheaderFrame,
            avatarFrame: avatarFrame,
            size: calculatedSize)
        return calculatedSize
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
