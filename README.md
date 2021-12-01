# iOSWKWebViewAppTemplatePersistentCookiesWorkLikeACharm
iOS WKWebView webview App Template with fully working persistent cookies functionality (httpcookie, web cookie, browser cookie), custom status bar background color, option for white/black status bar text color, option to disable pinch to zoom and double tap to zoom in webview

You have probably noticed that by default iOS WKWebView resets all cookies if you swipe app off memory or every time app is reloaded and new app session started

This WKWebView app template has a solution and a fix to preserve and save cookies to provide expected functionality from web apps

Supported iOS 13, iOS 15, iOS 15

**Successfully tested and working on multiple physical iOS 15.1 devices and one physical iPadOS 15.1 device**

**INFORMATION NOTE: Apple, officially: Starting April 2022, all iOS and iPadOS apps submitted to the App Store must be built with Xcode 13 and the iOS 15 SDK.** [Official source](https://developer.apple.com/ios/submit/)
This very XCode App Project is created on my Mac Mini Late 2012 running latest supported macOS Catalina 10.15.17 on this device with all latest security updates and patches installed as of November 2021 with as well latest supported Xcode 12.4 (12D4e) on this macOS version

Also, some useful links:
[Xcode and iOS SDK version minimum macOS supported list](https://developer.apple.com/support/xcode/)

From upper link you will understand that all XCode 13 versions starting 13, 13.1 and 13,2 (latest at the moment) require macOS Big Sur 11.3 as minimum
[macOS Big Sur compatible Apple computers list](https://support.apple.com/en-us/HT211238)

Upper link provides Apple official macOS Big Sur 11 compatible Apple computers list, but I couldn't quickly find if all of those on the list are also support macOS Big Sur 11.3 version

In conclusion of all above, if you are developing something and planning to publish something on App Store in coming months before April 2020 and your device doesn't support Xcode 13 and iOS 15 SDK, you'd better hurry a little or consider your hardware and device update/purchase strategy




Ok, here we go:

A very well-commented webview app template (probably even too much commented, probably I've failed all and every KISS principle while commenting this app template, but I wanted this app template to be easily understandable for absolute iOS beginners who had little or no previous iOS experience)

There are 5 ATTENTION: ACTION REQUIRED marks in the code  
You can Cmd+F to quickly find them in code  
Those steps are:
1. Choose Status Bar background color
2. Put your remote website URL here
3. Choose if you want to allow users to use pinch to zoom gesture and double tap to zoom in webview
4. Choose if you want Status Bar Text Color to be white or black
5. Put your remote website URL here (one more time)

Currently, this iOS WKWebView App Template works by opening and browsing remote website by its URL  

If you want to hide visibility of scroll bar you should do that in your remote website/webapp CSS code by adding:
```
*::-webkit-scrollbar {
   display: none;
}
```

If you want to enable iOS smooth scrolling everywhere or on specific elements, you also do it in remote website/webapp CSS code

Apply to whole website/webapp (CSS)
```
* {
   -webkit-overflow-scrolling: touch;
}
```

or apply to specific elements, for example: (CSS)
```
.someclass {
   overflow-y: scroll;
   -webkit-overflow-scrolling: touch;
}
```
    
More on smooth scrolling here:
https://stackoverflow.com/questions/37313872/vertical-scrolling-in-ios-not-smooth
https://css-tricks.com/snippets/css/momentum-scrolling-on-ios-overflow-elements/


Planned features and TO-DO's (feel free to pull request or fork):
1. Option to browse local website (web app) shipped within iOS app bundle content (not only remote website by URL)
2. Option to open external links (not your web app's URLs, other domains, website, external URLs, "You're leaving our website/app feature") in a visible mini-browser in app or even open some links or domains in Safari (or preferred default iOS web browsing app)
3. Option to display "no internet connection" if there is no internet connection currently or browsing remote website fails by some other reason, or even "our servers currently down" if the internet connection is OK, but your remote web app fails by certain HTTP status codes. With button "Try to connect again"
4. Add russian translation to README.md and even probably all the code comments (when I realize how, also feel free to pull request your translation to your native language or other you know well or fork!)

If you're looking for Android WebView App Template, my best recommendation would be https://github.com/slymax/webview - also works like a charm! (other author, not me)

Contact me easily anytime!  
Email ilya.minichev [at] gmail [dot] com  
[Telegram](https://t.me/ilyaminichev) | [VK](https://vk.com/ilyaminichev) | [VK Quick DM](https://vk.me/ilyaminichev) | [Facebook](https://facebook.com/ilyaminichev) | [FB Messenger](https://m.me/ilyaminichev) | [Instagram](https://instagram.com/ilyaminichev) | [Twitter](http://twitter.com/ilyaminichev)

If you want to tip, donate or buy me a coffee  
[Paypal](https://paypal.me/ilyaminichev/) or [YooMoney (ex-Yandex.Money)](https://yoomoney.ru/to/41001860338656) 
