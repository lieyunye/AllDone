//
//  ADUserInfoDetailViewController.swift
//  AllDone
//
//  Created by lieyunye on 4/6/17.
//  Copyright © 2017 lieyunye. All rights reserved.
//

import UIKit

class ADUserInfoDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let headerView:ADUserInfoHeaderView = ADUserInfoHeaderView()
        headerView.frame = CGRect(x:0,y:0,width:self.view.bounds.width,height:105)
        self.tableView.tableHeaderView = headerView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let className:String = String(describing:type(of: ADUserInfoVideoListTableViewCell()))
        self.tableView.register(UINib.init(nibName: className, bundle: nil), forCellReuseIdentifier: className)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: -

}

extension ADUserInfoDetailViewController
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let className:String = String(describing:type(of: ADUserInfoVideoListTableViewCell()))
        let cell = tableView.dequeueReusableCell(withIdentifier: className, for: indexPath)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    
    
}
