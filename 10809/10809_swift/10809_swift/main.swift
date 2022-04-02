//
//  main.swift
//  10809_swift
//
//  Created by Hyun on 2022/04/02.
//

import Foundation

var arr = Array(repeating: "-1", count: 26)
let str = readLine()!.map{Character(String($0))}
for i in 0..<str.count{
    let idx = Int(str[i].asciiValue! - 97)
    if arr[idx] == "-1"{
        arr[idx] = String(i)
    }else{
        arr[idx] = Int(arr[idx])!>i ? String(i):arr[idx]
    }
}
print(arr.joined(separator: " "))
//for (idx,value) in "asdzxcv".utf8.enumerated(){
//    print(idx,value)
//}
