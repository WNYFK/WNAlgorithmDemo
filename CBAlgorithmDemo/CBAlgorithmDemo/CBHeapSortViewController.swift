//
//  CBHeapSortViewController.swift
//  CBAlgorithmDemo
//
//  Created by chenbin on 2017/5/29.
//  Copyright © 2017年 ChenBin. All rights reserved.
//

import UIKit

class CBHeapSortViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let array = [10, 15, 56, 25, 30, 70]
        print("原数组: \(array)")
        print("插入后： \(MinHeapFixup(list: array, newItem: 20))")
        
        print("删除后： \(deleteHeapFixup(list: array, deleteIndex: 3))")
        let array1 = [80, 20, 30, 50, 25, 40]
        print("排序前: \(array1)")
        print("排序后：\(heapSort(list: array1))")
    }
    
    fileprivate func MinHeapFixup(list: [Int], newItem: Int) -> [Int] {
        guard list.count > 0 else { return [newItem] }
        var result = list
        result.append(newItem)
        var i = list.count
        while i > 0 {
            let fi: Int = (i - 1) / 2
            if result[fi] > newItem {
                let tmpValue = result[fi]
                result[fi] = newItem
                result[i] = tmpValue
                i = fi
            } else {
                break
            }
        }
        return result
    }
    
    fileprivate func deleteHeapFixup(list: [Int], deleteIndex: Int) -> [Int] {
        guard list.count > deleteIndex else { return list }
        var result = list
        result.remove(at: deleteIndex)
        let lastItem = result.removeLast()
        result.insert(lastItem, at: deleteIndex)
        var pi = deleteIndex
        var subi = 2 * deleteIndex + 1
        while subi < result.count {
            var tmp = result[subi]
            if subi + 1 < result.count && result[subi + 1] < tmp {
                subi = subi + 1
                tmp = result[subi]
            }
            if tmp < result[pi] {
                let tmpValue = result[pi]
                result[pi] = tmp
                result[subi] = tmpValue
                pi = subi
                subi = 2 * subi + 1
            } else {
                break
            }
        }
        return result
    }
    
    fileprivate func heapSort(list: [Int]) -> [Int] {
        guard list.count > 0 else { return list }
        return list.reduce([Int]()) { (result, item) -> [Int] in
            return MinHeapFixup(list: result, newItem: item)
        }
        
    }
    
    
    
    fileprivate func MinHeapFixDown(list: [Int], i: Int, n: Int) {
        
    }
}
