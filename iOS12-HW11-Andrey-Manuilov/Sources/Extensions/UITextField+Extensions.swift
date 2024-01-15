import UIKit
import SnapKit

extension UITextField {
    
    func setLeftIcon(_ image: UIImage) {
        let tintedIcon = image.withTintColor(UIColor.lightGray, renderingMode: .alwaysOriginal)
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
        
        iconContainerView.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        rightIconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(15)
            make.width.height.equalTo(30)
        }
    }
}
