//
//  AppDelegate.swift
//  AbelOperationQueues
//
//  Created by abel on 15/3/9.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    // BEGIN background_process
    
    var backgroundTask : UIBackgroundTaskIdentifier?
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        // Register a background task. This keeps the app from being
        // terminated until we tell the system that the task is complete.
        
        self.backgroundTask =
            application.beginBackgroundTaskWithExpirationHandler {
                () -> Void in
                
                // When this method is run, we're out of time.
                // Clean up, and then run endBackgroundTask.
                
                application.endBackgroundTask(self.backgroundTask!)
                
        }
        
        // Make a new background queue to run our background code on.
        var backgroundQueue = NSOperationQueue()
        
        backgroundQueue.addOperationWithBlock() {
            // Send a request to the server.
            
            // Prepare the URL
            var notificationURL = NSURL(string: "http://www.oreilly.com/")
            
            // Prepare the URL request
            var notificationURLRequest = NSURLRequest(URL: notificationURL!)
            
            // Send the request, and log the reply
            var loadedData =
            NSURLConnection.sendSynchronousRequest(
                notificationURLRequest,
                returningResponse: nil,
                error: nil)
            
            if let theData = loadedData {
                // Convert the data to a string
                var loadedString = NSString(data: theData,
                    encoding: NSUTF8StringEncoding)
                
                println("Loaded: \(loadedString)")
                
            }
            
            
            // Signal that we're done working in the background
            application.endBackgroundTask(self.backgroundTask!)
        }
        
    }
    // END background_process

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
