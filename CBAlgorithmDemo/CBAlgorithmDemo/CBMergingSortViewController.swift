//
//  CBMergingSortViewController.swift
//  CBAlgorithmDemo
//
//  Created by chenbin on 2017/5/28.
//  Copyright © 2017年 ChenBin. All rights reserved.
//

import UIKit

class CBMergingSortViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        orderArraySort()
    }
    
    fileprivate func orderArraySort() {
        let array1: [Int] = [1, 5, 7, 9, 10]
        let array2: [Int] = [3, 6, 7, 8, 11]
        
        func sort() -> [Int] {
            var tmpArray: [Int] = []
            var indexArray1: Int = 0
            var indexArray2: Int = 0
            
            while indexArray1 < array1.count && indexArray2 < array2.count {
                if array1[indexArray1] < array2[indexArray2] {
                    tmpArray.append(array1[indexArray1])
                    indexArray1 += 1
                } else {
                    tmpArray.append(array2[indexArray2])
                    indexArray2 += 1
                }
            }
            
            if indexArray1 < array1.count {
                tmpArray.append(contentsOf: array1.suffix(from: indexArray1))
            }
            if indexArray2 < array2.count {
                tmpArray.append(contentsOf: array2.suffix(from: indexArray2))
            }
            return tmpArray
        }
        print("子数组1：\(array1)\n子数组2：\(array2)")
        print("有序归并结果" + "\(sort())")
    }
    
    fileprivate func mergeSort(list: [Int], low: Int, high: Int) {
        let mid: Int = (low + high) / 2
        if low < high {
            mergeSort(list: list, low: low, high: mid)
            mergeSort(list: list, low: mid + 1, high: high)
            
        }
    }
    
    fileprivate func merge( list: [Int], low: Int, mid: Int, high: Int) -> [Int] {
        var list = list
        var i = low
        var j = mid + 1
        var tmpArr: [Int] = []
        while i <= mid && j <= high {
            if list[i] <= list[j] {
                tmpArr.append(list[i])
            } else {
                tmpArr.append(list[j])
            }
        }
        while i <= mid {
            tmpArr.append(list[i])
            i += 1
        }
        while j <= high {
            tmpArr.append(list[j])
            j += 1
        }
        list.replaceSubrange((low...high), with: tmpArr)
        return list
    }
}







