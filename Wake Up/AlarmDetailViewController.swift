//
//  AlarmDetailViewController.swift
//  Wake Up
//
//  Created by Robbie Zuazua  on 1/30/18.
//  Copyright © 2018 HackMind. All rights reserved.
//

import UIKit

class AlarmDetailViewController: UIViewController {

    @IBOutlet weak var testlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AlarmDetailViewController.cancel))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
