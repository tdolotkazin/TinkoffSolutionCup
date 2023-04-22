import UIKit

public final class Label: UILabel {
    public enum LabelStyle {
        case header
        case subheader
        case title
        case description
    }

    public init(style: LabelStyle, text: String) {
        super.init(frame: .zero)
        self.text = text
        self.numberOfLines = 1
        switch style {
        case .header:
            self.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            self.textColor = Colors.header
        case .subheader:
            self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            self.textColor = Colors.subHeader
        case .title:
            self.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            self.textColor = Colors.title
        case .description:
            self.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            self.textColor = Colors.description
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
