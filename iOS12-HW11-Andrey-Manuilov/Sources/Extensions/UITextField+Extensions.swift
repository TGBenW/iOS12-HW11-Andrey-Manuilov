import UIKit

extension UITextField {
    
    func setLeftIcon(_ image: UIImage) {
        let tintedIcon = image.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        let leftIconView = UIImageView(frame: CGRect(x: 30, y: 5, width: 22, height: 20))
        leftIconView.image = tintedIcon
        let iconContainerView: UIView = UIView(frame: CGRect(x: 10, y: 20, width: 80, height: 30))
        iconContainerView.addSubview(leftIconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
