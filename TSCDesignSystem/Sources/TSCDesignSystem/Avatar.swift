import UIKit

public final class Avatar: UIImageView {

    public enum AvatarSize {
        case regular

        public func cgSize() -> CGSize {
            switch self {
            case .regular:
                return CGSize(width: 40, height: 40) 
            }
        }
    }

    public init(image: UIImage? = nil, size: AvatarSize = .regular) {
        super.init(image: image)
        if image == nil {
            self.image = UIImage(named: "AvatarPlaceholder", in: Bundle.module, with: nil)
        }
        frame.size = AvatarSize.regular.cgSize()
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
