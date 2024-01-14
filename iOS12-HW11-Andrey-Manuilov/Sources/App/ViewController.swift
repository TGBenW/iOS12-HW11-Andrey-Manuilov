import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets

    private lazy var labelLogin: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Login", attributes: [.kern: 3.0])
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var textFieldUsername: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Username"
        textField.setLeftIcon(UIImage(systemName: "person")!)
        textField.layer.cornerRadius = 30
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 12
        textField.layer.shouldRasterize = true
        textField.layer.rasterizationScale = UIScreen.main.scale
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = "Password"
        textField.setLeftIcon(UIImage(systemName: "lock")!)
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 30
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 12
        textField.layer.shouldRasterize = true
        textField.layer.rasterizationScale = UIScreen.main.scale
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        let loginButtonColor = UIColor(red: 0.3843, green: 0.4627, blue: 0.8196, alpha: 1)
        button.backgroundColor = loginButtonColor
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 12
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var forgotPasswordLink: UILabel = {
        let label = UILabel()
        label.text = "Forgot your password?"
        label.isUserInteractionEnabled = true
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var separatorText: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var separatorLineLeft: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var separatorLineRight: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.systemGray5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        let facebookColor = UIColor(red: 0.2235, green: 0.6431, blue: 0.9333, alpha: 1.0)
        button.backgroundColor = facebookColor
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setLeftIcon(UIImage(named: "facebook")!, padding: 10)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 12
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        let twitterColor = UIColor(red: 0.3176, green: 0.4431, blue: 0.7059, alpha: 1.0)
        button.backgroundColor = twitterColor
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setLeftIcon(UIImage(named: "twitter")!, padding: 10)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 12
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var signUpLink: UILabel = {
        let label = UILabel()
        label.text = "Sign up"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signUpLabel, signUpLink])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - Lifestyle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setup
    
    private func setupView() {
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "BG_image")
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }

    private func setupHierarchy() {
        textFieldUsername.delegate = self
        textFieldUsername.addTarget(self, action: #selector(onTextFieldEdit(_:)), for: .editingChanged)

        textFieldPassword.delegate = self
        textFieldPassword.addTarget(self, action: #selector(onTextFieldEdit(_:)), for: .editingChanged)
        
        view.addSubview(labelLogin)
        view.addSubview(textFieldUsername)
        view.addSubview(textFieldPassword)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLink)
        view.addSubview(separatorText)
        view.addSubview(separatorLineLeft)
        view.addSubview(separatorLineRight)
        view.addSubview(facebookButton)
        view.addSubview(twitterButton)
        view.addSubview(stackView)
    }
    
    private func setupLayout() {
        //top part positioning
        labelLogin.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalToSuperview()
        }
        
        textFieldUsername.snp.makeConstraints { make in
            make.top.equalTo(labelLogin.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(60)
        }

        textFieldPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldUsername.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(60)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldPassword.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }

        forgotPasswordLink.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }

        separatorText.snp.makeConstraints { make in
            make.bottom.equalTo(facebookButton.snp.top).offset(-30)
            make.centerX.equalToSuperview()
        }

        separatorLineLeft.snp.makeConstraints { make in
            make.centerY.equalTo(separatorText.snp.centerY)
            make.right.equalTo(separatorText.snp.left).offset(-20)
            make.width.equalTo(80)
            make.height.equalTo(1)
        }

        separatorLineRight.snp.makeConstraints { make in
            make.centerY.equalTo(separatorText.snp.centerY)
            make.left.equalTo(separatorText.snp.right).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(1)
        }
        
        facebookButton.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-50)
            make.centerX.equalToSuperview().offset(-85)
            make.width.greaterThanOrEqualTo(150)
            make.height.equalTo(40)
        }
        
        twitterButton.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-50)
            make.centerX.equalToSuperview().offset(85)
            make.width.greaterThanOrEqualTo(150)
            make.height.equalTo(40)
        }

        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
    }
    
    //MARK: - Actions
    
    @objc func onTextFieldEdit(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty {
            if let checkmarkImage = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal) {
                sender.setRightIcon(checkmarkImage)
            }
        } else {
            sender.rightView = nil
            sender.rightViewMode = .never
        }
    }
}
