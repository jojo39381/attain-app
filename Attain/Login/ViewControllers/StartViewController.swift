import UIKit
class StartViewController: UIViewController {
    
    lazy var signUpButton: UIButton = {
        let button = makeButton(title: "Sign Up", color: .white, cornerRadius: 25, backgroundColor: UIColor(red: 23/255, green: 50/255, blue: 69/255, alpha: 1), shadow: false)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = makeButton(title: "Login", color: UIColor(red: 23/255, green: 50/255, blue: 69/255, alpha: 1), cornerRadius: 25, backgroundColor: UIColor(red: 255/255, green: 255/255, blue: 74/255, alpha: 1), shadow: false)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var background: UIImageView!
    var logo: UIImageView!
    var logoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupButtons()
    }
    
    func setupButtons() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(signUpButton)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.anchor(top: nil, left: view.leadingAnchor, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 50, paddingBottom: -100, paddingRight: 0, width: UIScreen.main.bounds.width - 100, height: 140)
    }
    
    @objc func signUpButtonTapped() {
        let signUpPage = SignUpViewController()
        signUpPage.modalPresentationStyle = .custom
        signUpPage.transitioningDelegate = self
        present(signUpPage, animated: true, completion: nil)
    }
    @objc func loginButtonTapped() {
        let loginPage = LoginViewController()
        loginPage.modalPresentationStyle = .custom
        loginPage.transitioningDelegate = self
        present(loginPage, animated: true, completion: nil)
    }
}
extension StartViewController: UIViewControllerTransitioningDelegate  {
   func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
             return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}
