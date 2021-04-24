import UIKit
import WebKit
class LiabilitiesWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {


    
   var webView: WKWebView!
    var linkToken:String?
    var publicToken:String?
    init(linkToken: String?, publicToken: String?) {
        self.linkToken = linkToken
        self.publicToken = publicToken
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
      super.viewDidLoad()
      let myURL = URL(string:"https://link.sandbox.methodfi.com?token=\(linkToken!)")
        print("///")
        print(myURL)
      let myRequest = URLRequest(url: myURL!)
      webView.load(myRequest)
   }
   override func loadView() {
      let webConfiguration = WKWebViewConfiguration()

      webView = WKWebView(frame: .zero, configuration: webConfiguration)
      webView.uiDelegate = self
        webView.navigationDelegate = self
      view = webView
   }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        
       
        if let url = navigationAction.request.url {
            
            if url.absoluteString.hasPrefix("methodlink://") {
//                    print(url)
                let eventType = url.host
                if eventType == "exit" {
                    self.dismiss(animated: true, completion: nil)
                }
                
                if eventType == "success" {
                    
                    Utilities.fetchAPIKey { [self] (api_key) in
                        let method_token = self.getQueryStringParameter(url: url.absoluteString, param: "public_account_token")
                        
                        print(method_token)
                        let temp = saveLiabilityAccessToken(uuid:api_key, public_token: publicToken!, method_token: method_token! )
                    }
                    
                    self.navigationController?.popToRootViewController(animated: true)
                }
                    decisionHandler(.cancel)
                    return
                }
            }

            decisionHandler(.allow)
        }
    func getQueryStringParameter(url: String, param: String) -> String? {
      guard let url = URLComponents(string: url) else { return nil }
      return url.queryItems?.first(where: { $0.name == param })?.value
    }
}

