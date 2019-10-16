//
//  AppDelegate.swift
//  42_events
//
//  Created by Tyrone Stephen on 2019/10/16.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
        // Determine who sent the URL.
        let sendingAppID = options[.sourceApplication]
        print("source application = \(sendingAppID ?? "Unknown")")

        // Process the URL.
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
            let params = components.queryItems else {
                print("Invalid URL or code in path missing")
                return false
        }

        if let code = params.first(where: { $0.name == "code" })?.value {
            
            let url = URL(string: "https://api.intra.42.fr/oauth/token")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let json = [
                "grant_type": "authorization_code",
                "client_id": "253c24da3a92d302d3aa9388a7fd8e5218d7e395a84ae8f95a06d04db5918843",
                "client_secret": "1f0a0d4fcb43f0e56619fae1f79f47a97054ac0841f6a26d6d354674087d13ff",
                "code": code,
                "redirect_uri": "events://oauth/callback"
            ]
            
            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
            let task = URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
                print(response)
                if let data = data,
                    let jsonD = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    for (k, v) in jsonD! {
                        print("\(k): \(v)")
                    }
                }
                //print(error)
            }
            task.resume()
            return true
        } else {
            print("Code missing")
            return false
        }
    }
    
}

