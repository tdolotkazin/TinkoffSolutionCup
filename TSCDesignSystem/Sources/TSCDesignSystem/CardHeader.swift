import UIKit

public enum HeaderAccessory {
    case avatar(UIImage?)
    case button(String)
}

public struct HeaderConfiguration {

    var headerText: String
    var subheaderText: String?
    var accessory: HeaderAccessory
    
    public init(headerText: String, subheaderText: String? = nil, accessory: HeaderAccessory) {
        self.headerText = headerText
        self.subheaderText = subheaderText
        self.accessory = accessory
    }
}
public final class CardHeader: UIView {

    enum Spec {
        static let headerInsets = UIEdgeInsets(top: 16, left: 20, bottom: 8, right: 16)
        static let avatarInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        static let subheaderInsets = UIEdgeInsets(top: 0, left: 0, bottom: 18, right: 0)
        static let cornerRadius: CGFloat = 24
    }

    private let header: Label
    private var subheader: Label?
    private var avatar: Avatar?
    private let accessory: HeaderAccessory

    init(configuration: HeaderConfiguration) {
        header = Label(style: .header, text: configuration.headerText)
        self.accessory = configuration.accessory
        super.init(frame: .zero)
        addSubview(header)
        if let subheaderText = configuration.subheaderText {
            let subheaderLabel = Label(style: .subheader, text: subheaderText)
            addSubview(subheaderLabel)
            subheader = subheaderLabel
        }
        switch accessory {
        case .avatar(let image):
            let avatar = Avatar(image: image)
            addSubview(avatar)
            self.avatar = avatar
        case .button:
            break
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        let size = frame.size
        let avatarSize = avatar?.sizeThatFits(frame.size) ?? .zero
        avatar?.setFrame(CGRect(
            origin: CGPoint(
                x: size.width - (avatarSize.width) - Spec.avatarInsets.right,
                y: Spec.avatarInsets.top),
            size: avatarSize))
        let headerMaxWidth = size.width - Spec.avatarInsets.right - avatarSize.width - Spec.avatarInsets.left - Spec.headerInsets.left
        let headerSize = header.sizeThatFits(CGSize(
            width: headerMaxWidth,
            height: size.height))
        header.setFrame(CGRect(
            origin: CGPoint(
                x: Spec.headerInsets.left,
                y: Spec.headerInsets.top
            ), size: headerSize))
        let subheaderSize = subheader?.sizeThatFits(
            CGSize(
                width: headerMaxWidth,
                height: size.height - headerSize.height - Spec.headerInsets.top - Spec.headerInsets.bottom
            )
        ) ?? .zero
        subheader?.setFrame(CGRect(
            origin: CGPoint(
                x: header.frame.minX,
                y: header.frame.maxY + Spec.headerInsets.bottom),
            size: subheaderSize
        ))
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        var height: CGFloat
        if subheader != nil {
            height = 80
        } else if case .avatar = accessory  {
            height = 68
        } else {
            height = 52
        }
        return CGSize(width: size.width, height: height)
    }
}
