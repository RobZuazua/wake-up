//
//  AlarmTableViewController.swift
//  Wake Up
//
//  Created by Robbie Zuazua  on 1/30/18.
//  Copyright © 2018 HackMind. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController {

    var alarms = WakeUpController.sharedController.availableAlarms()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        tableView.backgroundColor = UIColor.black
        
        NotificationCenter.default.addObserver(self, selector: #selector(AlarmTableViewController.reloadTableView), name: NSNotification.Name("addedNewAlarm"), object: nil)
    }

    @IBAction func addNewAlarm(_ sender: Any) {
        let alarmVC = CreateNewAlarmViewController()
        let navController = UINavigationController(rootViewController: alarmVC)
        navigationController?.present(navController, animated: true)
    }
    
    @IBAction func edit(_ sender: Any) {
    }
    
    @objc func reloadTableView() {
        alarms = WakeUpController.sharedController.availableAlarms()
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let alarm = alarms[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarm-cell", for: indexPath) as! AlarmTableViewCell
        cell.timeLabel.text = DateFormatter.localizedString(from: alarm.fireDate, dateStyle: .none, timeStyle: .short)
        cell.alarmSwitch.isOn = alarm.isEnabled
        cell.alarmDescriptionLabel.text = alarm.alarmName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
 
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
