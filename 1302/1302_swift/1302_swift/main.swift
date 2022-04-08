//
//  main.swift
//  1302_swift
//
//  Created by Hyun on 2022/04/08.
//

//import Foundation

var arr = [String:Int]()
for _ in 0..<Int(readLine()!)!{
    let key = readLine()!
    if arr[key] == nil{
        arr[key] = 1
    }else{
        arr[key]! += 1
    }
}
print(arr.sorted(by: {
    if $0.value == $1.value{
        return $0.key < $1.key
    }else{
        return $0.value > $1.value
    }
}).first!.key)
