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
    
    func setRightIcon(_ image: UIImage) {
        let rightIconView = UIImageView()
        rightIconView.contentMode = .scaleAspectFit
        rightIconView.image = image
        rightIconView.translatesAutoresizingMaskIntoConstraints = false

        let iconContainerView = UIView()
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.rightView = iconContainerView
        self.rightViewMode = .always

        iconContainerView.addSubview(rightIconView)
        
        iconContainerView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconContainerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        rightIconView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor).isActive = true
        rightIconView.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor, constant: -15).isActive = true
        rightIconView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightIconView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
