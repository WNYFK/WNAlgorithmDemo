//
//  ViewController.swift
//  CBAlgorithmDemo
//
//  Created by chenbin on 2017/5/28.
//  Copyright © 2017年 ChenBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var subVCArr: [(String,UIViewController)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame = self.view.bounds
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        self.view.addSubview(self.tableView)
        self.setupViewControllers()
    }

    fileprivate func setupViewControllers() {
        self.subVCArr.append(("快排", CBQuicksortViewController()))
        self.subVCArr.append(("归并排序", CBMergingSortViewController()))
        self.subVCArr.append(("堆排序", CBHeapSortViewController()))
        self.subVCArr.append(("希尔排序", CBSellSortViewController()))
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.subVCArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = self.subVCArr[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = self.subVCArr[indexPath.row].1
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

