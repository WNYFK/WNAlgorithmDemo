//
//  CBSellSortViewController.swift
//  CBAlgorithmDemo
//
//  Created by chenbin on 2017/5/29.
//  Copyright © 2017年 ChenBin. All rights reserved.
//

import UIKit

class CBSellSortViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let array: [Int] = [49, 38, 65, 97, 26, 13, 27, 49, 55, 4]
        print("原数组： \(array)")
        print("希尔排序后: \(sellSort(list: array))")
    }
    
    fileprivate func sellSort(list: [Int]) -> [Int]{
        var gap: Int = list.count / 2
        var result = list
        while gap >= 1 {
            var index: Int = 0
            while index + gap < result.count {
                if index + gap < result.count && result[index] > result[index + gap] {
                    let tmp = result[index + gap]
                    result[index + gap] = result[index]
                    result[index] = tmp
                }
                index += 1
            }
            print(result)
            gap /= 2
        }
        
        return result
    }
}
