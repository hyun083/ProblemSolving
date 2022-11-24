//
//  main.swift
//  12015_swift
//
//  Created by Hyun on 2022/11/23.
//

import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [numbers[0]]

func bin(num:Int){
    var head = 0
    var trail = arr.count-1
    while head <= trail{
        let mid = (head+trail)/2
        if arr[mid] < num{
            head = mid+1
        }else{
            trail = mid-1
        }
    }
    arr[head] = num
}

for i in 1..<n{
    if arr.last! < numbers[i]{
        arr.append(numbers[i])
    }else if arr.last! > numbers[i]{
        bin(num: numbers[i])
    }
}
print(arr.count)
