//
//  main.swift
//  3649_swift
//
//  Created by Hyun on 2022/06/06.
//
import Foundation

var ans = ""
while let line = readLine(){
    let x = Int(line)! * 10000000
    let n = Int(readLine()!)!
    var arr = [Int]()
    for _ in 0..<n{
        arr.append(Int(readLine()!)!)
    }
    arr.sort(by: <)
    var start = 0
    var end = arr.count-1
    var str = "danger\n"
    while start<end{
        let sum = arr[start]+arr[end]
        if sum == x{
            str = "yes \(arr[start]) \(arr[end])\n"
            break
        }
        if sum < x{
            start += 1
        }
        if sum > x{
            end -= 1
        }
    }
    ans += str
}
print(ans)
