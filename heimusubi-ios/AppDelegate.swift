//
//  AppDelegate.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/10/06.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var backgroundTaskID : UIBackgroundTaskIdentifier = 0


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "isSignin")
        let isSignin = userDefaults.bool(forKey: "isSignin")
        print(isSignin)
        if (isSignin == true) {
            let rootVC = MainTabBarController()
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = rootVC
            self.window?.makeKeyAndVisible()
        } else {
            let rootVC = SigninViewControllerBuilder.build()
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = rootVC
            self.window?.makeKeyAndVisible()
        }

        
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    print("通知許可")
                    
                    let center = UNUserNotificationCenter.current()
                    center.delegate = self
                    
                } else {
                    print("通知拒否")
                }
            })
            
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        self.backgroundTaskID = application.beginBackgroundTask(){
            [weak self] in
            application.endBackgroundTask((self?.backgroundTaskID)!)
            self?.backgroundTaskID = UIBackgroundTaskInvalid
        }

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        application.endBackgroundTask(self.backgroundTaskID)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "fromNotification")
        userDefaults.synchronize()
        print("起動されたよ！")
    
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "applicationWillEnterForeground"), object: nil)


        
        completionHandler()
    }

}

