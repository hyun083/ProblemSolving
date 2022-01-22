//
//  main.swift
//  1541_swift
//
//  Created by Hyun on 2022/01/21.
//

import Foundation

let input = readLine()!

if input.contains("-"){
    let arr = input.split(separator: "-")
    var temp = [Int]()
    for a in arr{
        if a.contains("+"){
            temp += a.split(separator: "+").map{Int(String($0))! * -1}
        }else{
            temp.append(Int(a)!)
        }
    }
    print(temp.reduce(0, +))
}else{
    let arr = input.split(separator: "+").map{Int(String($0))!}
    print(arr.reduce(0, +))
}

