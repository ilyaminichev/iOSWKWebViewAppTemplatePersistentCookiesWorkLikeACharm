//
//  ViewController.swift
//  iOSWKWebViewAppTemplateCookiesWorkLikeACharm
//
//  Created by Ilya Minichev on 18.08.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private let webView = WKWebView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let app = UIApplication.shared
        
        //Even though XCode warns you that
        //'statusBarFrame' was deprecated in iOS 13.0: Use the statusBarManager property of the window scene instead
        //For me using this deprecated trick was the only working way to get statusBarHeight
        //
        //(No modifications needed below)
        
        let statusBarHeight: CGFloat = app.statusBarFrame.size.height
        
        let statusbarView = UIView()
        
        //ATTENTION: ACTION REQUIRED (1/5): Choose Status Bar background color
        //Set color for status bar background that fits your app design, UI & color scheme in the non-commented next line
        //
        //I've especially made my webview app template Status Bar background color for several reasons:
        //  1. To demonstrate this webview app template feature to set custom Status Bar background color
        //  2. For you as developer not to forget to choose Status Bar background color that will fit your app
        //  3. Red Status Bar color in iOS is used when the microphone is recording,
        //     Blue when GPS is used or Internet sharing Personal Hotspot enabled
        //     Green when phone call is active
        //     So I decided to go with this color different from all others used by iOS system in multiple usual scenarios
        //
        //
        //By default in my webview app template Status Bar background color is pink (Not every app design, UI & color scheme is pink, but
        //even if your app is pink you still should set the color below to match perfectly with your app's pink color shade
        //Keep in mind that all ranges for red, green blue and alpha are 0-1 with decimals
        
        statusbarView.backgroundColor = UIColor(red: 0.93, green: 0, blue: 1, alpha: 1)
        view.addSubview(statusbarView)
        
        //Setting the correct sizes and positioning for our custom color status bar background
        //
        //(No modifications needed below)
        
        statusbarView.translatesAutoresizingMaskIntoConstraints = false
        statusbarView.heightAnchor
            .constraint(equalToConstant: statusBarHeight).isActive = true
        statusbarView.widthAnchor
            .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        statusbarView.topAnchor
            .constraint(equalTo: view.topAnchor).isActive = true
        statusbarView.centerXAnchor
            .constraint(equalTo: view.centerXAnchor).isActive = true
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.webView)
        NSLayoutConstraint.activate([
            self.webView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
        ])
        self.view.setNeedsLayout()
        
        //ATTENTION: ACTION REQUIRED (2/5): Put your remote website URL here
        //
        //This iOS WKWebView template app will browse your remote website fullscreen (with Status Bar visible)
        //So keep in mind that your remote website should look and feel like iOS app (as much as possible),
        //especially if you are planning to distribute it via App Store and expect to successfully pass Apple's App Review
        
        if let url = URL(string: "https://google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
            
            webView.uiDelegate = self
            webView.navigationDelegate = self
            
            //ATTENTION: ACTION REQUIRED (3/5): Choose if your want to allow users to use pinch to zoom gesture and double tap to zoom in webview
            //By default WKWebView allows users to use pinch to zoom gesture and double tap to zoom in webview
            //Code segment below prevents users from using pinch to zoom gesture and double tap to zoom in webview
            //If you don't remove code segment below pinch to zoom gesture and double tap to zoom in webview will be diasbled
            //If you remove code segment below pinch to zoom gesture and double tap to zoom in webview will work
            //
            //Next code segment prevents user from using pinch to zoom gesture, double tap to zoom webview
            //
            //I found this solution on Stackoverflow, it appears in many answered question
            //Sadly, I don't remember exact answer from which I took next code segment, so sadly I can't credit exact author
            //
            //  YOUR OPTIONS WITH CODE SEGMENT BELOW:
            //
            //      1. COMPLETELY REMOVE CODE SEGMENT BELOW to allow users to use pinch to zoom gesture and double tap to zoom in webview
            //          You can completely remove next code segment if you want to allow webview app users
            //          to use pinch to zoom gesture or double tap to zoom in webview
            //
            //      2. KEEP CODE SEGMENT BELOW UNMODIFIED to prevent users from using pinch to zoom gesture and double tap to zoom
            //          (No modifications needed below) if you want to keep preventing user
            //          from using pinch to zoom gesture, double tap to zoom webview
            //
            
            //Code Segment START - Prevent user from using pinch to zoom gesture, double tap to zoom webview
            let source: String = "var meta = document.createElement('meta');" +
                "meta.name = 'viewport';" +
                "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
                "var head = document.getElementsByTagName('head')[0];" +
                "head.appendChild(meta);"
            
            let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
            //Code Segment END - Prevent user from using pinch to zoom gesture, double tap to zoom webview
            
            webView.configuration.userContentController.addUserScript(script)
        }
        
        //Let's put our custom colored Status Bar to front so it's not behind everything anymore
        //
        //(No modifications needed below)
        
        self.view.bringSubviewToFront(statusbarView);
        
    }
    
    //ATTENTION: ACTION REQUIRED (4/5): Choose if you want Status Bar Text Color to be white or black
    //By default Stats Bar Text Color is black
    //Code segment below switches Status Bar Text Color to white
    //If you don't remove code segment below that Status Bar Text Color will be white
    //If you remove code segment below that Status Bar Text Color will be black
    //
    //Next code segment is for in case you want to switch Stats Bar Text Color to white
    //If you don't need switching to white Status Bar Text Color you can remove
    //the whole next code segment because the Status Bar Text Color is already black by default
    //
    //  YOUR OPTIONS WITH CODE SEGMENT BELOW:
    //
    //      1. COMPLETELY REMOVE CODE SEGMENT BELOW if you want to keep default Status Bar Text Color - Black
    //
    //      2. KEEP CODE SEGMENT BELOW UNMODIFIED if you want to switch Stats Bar Text Color to White
    //          Also the code segment below contains commented swift code line example how to switch back to default
    //          Status Bar black text color programmatically anytime (including more detailed explanation about it)
    //
    
    //Code Segment START - Status Bar Text Color
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        //Next lines makes Status Bar Text Color white
        return UIStatusBarStyle.lightContent
        
        //In case you want to switch back Status Bar Text Color to black from white programmatically under some condition
        //here's an example for you how to do it in nearest commented swift code line below
        //
        //Don't be confused, if you don't need to set Status Bar text color to white and then change back to black
        //you can safely remove this whole code segment from START to END, I just gave you example code syntax and name how
        //to programmatically set and use Status Bar black text color
        //
        //  (the Status Bar Text Color is always black by default, but you can use commented swift line below
        //   as example when you want to switch it back to black if it has been set white some time before,
        //   for example, under some condition)
        //
        // So here's this commented swift code line below finally (setting Status Bar text color to black)
        //
        //return UIStatusBarStyle.default
        
    }
    
    //Code Segment END - Status Bar Text Color
    
}

//Solution credit Stackoverflow user Moussa Ndour https://stackoverflow.com/users/6275180/moussa-ndour
//From his answer here (link below)
//https://stackoverflow.com/questions/39772007/wkwebview-persistent-storage-of-cookies/53512299#53512299
//
//(No modifications needed below)

extension WKWebView {
    
    enum PrefKey {
        static let cookie = "cookies"
    }
    
    func writeDiskCookies(for domain: String, completion: @escaping () -> ()) {
        fetchInMemoryCookies(for: domain) { data in
            print("write data", data)
            UserDefaults.standard.setValue(data, forKey: PrefKey.cookie + domain)
            completion();
        }
    }
    
    
    func loadDiskCookies(for domain: String, completion: @escaping () -> ()) {
        if let diskCookie = UserDefaults.standard.dictionary(forKey: (PrefKey.cookie + domain)){
            fetchInMemoryCookies(for: domain) { freshCookie in
                
                let mergedCookie = diskCookie.merging(freshCookie) { (_, new) in new }
                
                for (cookieName, cookieConfig) in mergedCookie {
                    let cookie = cookieConfig as! Dictionary<String, Any>
                    
                    var expire : Any? = nil
                    
                    if let expireTime = cookie["Expires"] as? Double{
                        expire = Date(timeIntervalSinceNow: expireTime)
                    }
                    
                    let newCookie = HTTPCookie(properties: [
                        .domain: cookie["Domain"] as Any,
                        .path: cookie["Path"] as Any,
                        .name: cookie["Name"] as Any,
                        .value: cookie["Value"] as Any,
                        .secure: cookie["Secure"] as Any,
                        .expires: expire as Any
                    ])
                    
                    self.configuration.websiteDataStore.httpCookieStore.setCookie(newCookie!)
                }
                
                completion()
            }
            
        }
        else{
            completion()
        }
    }
    
    func fetchInMemoryCookies(for domain: String, completion: @escaping ([String: Any]) -> ()) {
        var cookieDict = [String: AnyObject]()
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { (cookies) in
            for cookie in cookies {
                if cookie.domain.contains(domain) {
                    cookieDict[cookie.name] = cookie.properties as AnyObject?
                }
            }
            completion(cookieDict)
        }
    }}

//ATTENTION: ACTION REQUIRED (5/5): Put your remote website URL here
//
//This iOS WKWebView template app will browse your remote website fullscreen (with Status Bar visible)
//So keep in mind that your remote website should look and feel like iOS app (as much as possible),
//especially if you are planning to distribute it via App Store and expect to successfully pass Apple's App Review

let url = URL(string: "https://google.com")!

extension ViewController: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //load cookie of current domain
        webView.loadDiskCookies(for: url.host!){
            decisionHandler(.allow)
        }
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        //write cookie for current domain
        webView.writeDiskCookies(for: url.host!){
            decisionHandler(.allow)
        }
    }
}
