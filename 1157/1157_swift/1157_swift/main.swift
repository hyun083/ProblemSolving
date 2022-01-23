//
//  main.swift
//  1157_swift
//
//  Created by Hyun on 2022/01/23.
//

import Foundation

let text = readLine()!.uppercased()
var set = [Character:Int]()

for t in text{
    if set[t] != nil{
        set[t]! += 1
    }else{
        set[t] = 1
    }
}

let arr = set.sorted{$0.value>$1.value}
if arr.count == 1{
    print(arr[0].key)
}else if arr[0].value == arr[1].value{
    print("?")
}else{
    print(arr[0].key)
}
