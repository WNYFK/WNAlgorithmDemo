//: Playground - noun: a place where people can play

import UIKit

var array: [Int] = [57, 68, 59, 52, 72, 28, 96, 33, 24, 19]

func quicksort(sortArr: [Int]) -> [Int] {
    guard sortArr.count > 1 else { return sortArr }
    var result = sortArr
    let X = sortArr[0]
    var left = 0, right = sortArr.count - 1
    while left < right {
        
        //从右往左
        for i in (right...left) {
            if result[i] < X {
                result[left] = result[i]
                result[i] = X
                right = i
                break
            }
            if i == left {
                right = left
            }
        }
        
        //从左往右
        for i in (left...right) {
            if result[i] > X {
                result[right] = result[i]
                result[i] = X
                left = i
                break
            }
            if i == right {
                left = right
            }
        }
        
    }
    return result
}

let result = quicksort(sortArr: array)
