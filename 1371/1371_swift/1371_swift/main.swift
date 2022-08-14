//
//  main.swift
//  1371_swift
//
//  Created by Hyun on 2022/08/14.
//

import Foundation

var ans = [String:Int]()

while let line = readLine(){
    let inputs = line.split(separator: " ").map{String($0)}
    for input in inputs{
        for ch in input.map{String($0)}{
            if ans[ch] == nil{
                ans[ch] = 1
            }else{
                ans[ch]! += 1
            }
        }
    }
}

let target = ans.values.max()!

for key in ans.sorted(by: {$0.key < $1.key}){
    if key.value == target{
        print(key.key,terminator: "")
    }
}
