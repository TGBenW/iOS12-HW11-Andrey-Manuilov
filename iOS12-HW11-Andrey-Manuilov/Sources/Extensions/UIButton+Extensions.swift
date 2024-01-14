import UIKit

extension UIButton {
    func setLeftIcon(_ image: UIImage, padding: CGFloat) {
        let leftIconView = UIImageView(image: image)
        leftIconView.contentMode = .scaleAspectFit
        
        let iconAndTitleContainerView = UIView()
        self.addSubview(iconAndTitleContainerView)
        iconAndTitleContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        iconAndTitleContainerView.addSubview(leftIconView)
        leftIconView.translatesAutoresizingMaskIntoConstraints = false
        
        iconAndTitleContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        iconAndTitleContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        iconAndTitleContainerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        iconAndTitleContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        leftIconView.leadingAnchor.constraint(equalTo: iconAndTitleContainerView.leadingAnchor, constant: 10 + padding).isActive = true
        leftIconView.centerYAnchor.constraint(equalTo: iconAndTitleContainerView.centerYAnchor).isActive = true
        leftIconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        leftIconView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        if let titleLabel = self.titleLabel {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.leadingAnchor.constraint(equalTo: leftIconView.trailingAnchor, constant: padding).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: iconAndTitleContainerView.centerYAnchor).isActive = true
        }
    }
}
