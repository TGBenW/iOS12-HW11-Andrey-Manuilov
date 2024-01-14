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
//        top part positioning
        labelLogin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        labelLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        textFieldUsername.topAnchor.constraint(equalTo: labelLogin.bottomAnchor, constant: 60).isActive = true
        textFieldUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldUsername.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        textFieldUsername.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        textFieldUsername.heightAnchor.constraint(equalToConstant: 60).isActive = true

        textFieldPassword.topAnchor.constraint(equalTo: textFieldUsername.bottomAnchor, constant: 20).isActive = true
        textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        textFieldPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: 60).isActive = true

        loginButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 60).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        forgotPasswordLink.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        forgotPasswordLink.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

//        bottom part positioning
        separatorText.bottomAnchor.constraint(equalTo: facebookButton.topAnchor, constant: -30).isActive = true
        separatorText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        separatorLineLeft.centerYAnchor.constraint(equalTo: separatorText.centerYAnchor, constant: 0).isActive = true
        separatorLineLeft.rightAnchor.constraint(equalTo: separatorText.leftAnchor, constant: -20).isActive = true
        separatorLineLeft.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLineLeft.widthAnchor.constraint(equalToConstant: 80).isActive = true

        separatorLineRight.centerYAnchor.constraint(equalTo: separatorText.centerYAnchor, constant: 0).isActive = true
        separatorLineRight.leftAnchor.constraint(equalTo: separatorText.rightAnchor, constant: 20).isActive = true
        separatorLineRight.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLineRight.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        facebookButton.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -50).isActive = true
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -85).isActive = true
        facebookButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        twitterButton.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -50).isActive = true
        twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 85).isActive = true
        twitterButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    //MARK: - Actions
    
    
}
