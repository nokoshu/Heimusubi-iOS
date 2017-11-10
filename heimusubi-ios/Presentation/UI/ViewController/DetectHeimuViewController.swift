//
//  DetectHeimuViewController.swift
//  heimusubi-ios
//
//  Created by RyoBamboo on 2017/11/09.
//  Copyright © 2017年 RyoBamboo. All rights reserved.
//

import UIKit

class DetectHeimuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate var presenter: DetectHeimuPresenter!
    
    @IBOutlet weak var heimuTableView: UITableView!
    fileprivate var peripheralList: [String] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scanning Peripheral
        self.presenter.searchHeimu()
        
        heimuTableView.delegate = self
        heimuTableView.dataSource = self
        heimuTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func inject(presenter: DetectHeimuPresenter) {
        self.presenter = presenter
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.heimuId.text = peripheralList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peripheralList.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.tappedTableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

}


// MARK: - DetectHeimuPresenterInput
extension DetectHeimuViewController: DetectHeimuPresenterInput {
    func setPeripheralList(peripheralList: Array<String>) {
        self.peripheralList = peripheralList
        self.heimuTableView.reloadData()
    }
}
