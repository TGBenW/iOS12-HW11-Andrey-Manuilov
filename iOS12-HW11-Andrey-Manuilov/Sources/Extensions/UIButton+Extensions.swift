import UIKit
import SnapKit

extension UIButton {
    func setLeftIcon(_ image: UIImage, padding: CGFloat) {
        let leftIconView = UIImageView(image: image)
        leftIconView.contentMode = .scaleAspectFit
        
        let iconAndTitleContainerView = UIView()
        self.addSubview(iconAndTitleContainerView)
        iconAndTitleContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        iconAndTitleContainerView.addSubview(leftIconView)
        iconAndTitleContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftIconView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10 + padding)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        self.titleLabel?.snp.makeConstraints { make in
            make.left.equalTo(leftIconView.snp.right).offset(padding)
            make.centerY.equalToSuperview()
        }
    }
}
