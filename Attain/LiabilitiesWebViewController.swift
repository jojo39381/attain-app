import UIKit
import WebKit
class LiabilitiesWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {


    
   var webView: WKWebView!
    var linkToken:String?
    init(linkToken: String?) {
        self.linkToken = linkToken
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
      super.viewDidLoad()
      let myURL = URL(string:"https://link.sandbox.methodfi.com?token=\(linkToken!)")
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
                    self.dismiss(animated: true, completion: nil)
                }
                    decisionHandler(.cancel)
                    return
                }
            }

            decisionHandler(.allow)
        }
}
