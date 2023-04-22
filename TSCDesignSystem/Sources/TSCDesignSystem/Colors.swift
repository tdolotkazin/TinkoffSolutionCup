import UIKit

public enum Colors {
    public static let background = UIColor(hex: "#FAFAFAFF")
    public static let header = UIColor(hex: "#333333FF")
    public static let subHeader = UIColor(hex: "#9299A2FF")
    public static let title = UIColor(hex: "#333333FF") // TODO: - Gradient
    public static let description = UIColor(hex: "#9299A2FF")
    public static let regularCardBackgorund = UIColor(hex: "#FFFFFFFF")
    public static let paleCardBackgorund = UIColor(hex: "#F6F7F8FF")
}

private extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
