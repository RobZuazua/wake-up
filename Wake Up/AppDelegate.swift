//
//  AppDelegate.swift
//  Wake Up
//
//  Created by Frederik Riedel on 1/30/18.
//  Copyright © 2018 HackMind. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var audioPlayer: AVAudioPlayer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        playSilence()
        Timer.scheduledTimer(withTimeInterval: 55, repeats: false) { (_) in
            self.playAlarm()
        }
    }
    
    func playAlarm() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .duckOthers)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
            
            let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Wake Up", ofType: "m4a")!)
            print(alertSound)
            
            self.audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
        } catch {
            print(error)
        }
        
        (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(1, animated: false)
        self.audioPlayer!.prepareToPlay()
        self.audioPlayer!.play()
    }
    
    func playSilence() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .duckOthers)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
            
            let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "wake", ofType: "mp3")!)
            print(alertSound)
            
            self.audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
        } catch {
            print(error)
        }
        
        (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(1, animated: false)
        self.audioPlayer!.numberOfLoops = -1
        self.audioPlayer!.volume = 0.1
        self.audioPlayer!.prepareToPlay()
        self.audioPlayer!.play()
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
}

