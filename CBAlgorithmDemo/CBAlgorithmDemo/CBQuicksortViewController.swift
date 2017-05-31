//
//  CBQuicksortViewController.swift
//  CBAlgorithmDemo
//
//  Created by chenbin on 2017/5/28.
//  Copyright © 2017年 ChenBin. All rights reserved.
//

import UIKit

class CBQuicksortViewController: UIViewController {
    var array: [Int] = [57, 68, 59, 52, 72, 28, 96, 33, 24, 19]
    
    func quicksort(sortArr: [Int]) -> [Int] {
        guard sortArr.count > 1 else { return sortArr }
        var result = sortArr
        let X = sortArr[0]
        var left = 0, right = sortArr.count - 1
        while left < right {
            
            //从右往左
            var i = right
            while i >= left {
                if result[i] < X {
                    result[left] = result[i]
                    result[i] = X
                    right = i
                    break
                }
                if i == left {
                    right = left
                }
                i -= 1
            }
            
            //从左往右
            i = left
            while i <= right {
                if result[i] > X {
                    result[right] = result[i]
                    result[i] = X
                    left = i
                    break
                }
                if i == right {
                    left = right
                }
                i += 1
            }
        }
        return quicksort(sortArr: Array(result.prefix(left))) + [result[left]] + quicksort(sortArr: Array(result.suffix(from: left + 1)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let array = quicksort(sortArr: self.array)
        print(array)
    }
    
}
