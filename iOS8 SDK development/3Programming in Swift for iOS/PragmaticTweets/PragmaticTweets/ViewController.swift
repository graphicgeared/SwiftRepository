import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var twitterWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleShowMyTweetsTapped(sender: UIButton) {
        let url = NSURL(string: "https://weibo.com/u/1398613362?refer_flag=1005055010_")
        let urlRequest = NSURLRequest(URL: url!)
        twitterWebView.loadRequest(urlRequest)
        
    }

    @IBAction func handleTweetButtonTapped(sender: UIButton) {
        // test1:
//        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
//            let tweetVC = SLComposeViewController (forServiceType:
//                SLServiceTypeTwitter)
//            tweetVC.setInitialText(
//                "I just finished the first project in iOS 8 SDK Development. #pragsios8")
//            presentViewController(tweetVC, animated: true, completion: nil)
//        } else {
//            print ("Can't send tweet") 
//        }

        // test2: 当用户没有在ios的管理里面配置好微博是不起作用的：
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeSinaWeibo){
            print("in here")
            let tweetVC = SLComposeViewController (forServiceType:
                SLServiceTypeSinaWeibo)
            tweetVC.setInitialText(
                "I am testing things when learning in iOS 8 SDK Development. #pragsios8")
            presentViewController(tweetVC, animated: true, completion: nil)
        } else {
            print ("Can't send tweet")
        }

        // test3: 没配置的时候会蹦出来：
//        let controller: SLComposeViewController = SLComposeViewController(
//            forServiceType: SLServiceTypeSinaWeibo)
//        controller.setInitialText("test sina weibo")
//        self.presentViewController(controller, animated: true, completion: nil)
//

    }

}

