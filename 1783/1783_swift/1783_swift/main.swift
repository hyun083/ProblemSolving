//
//  main.swift
//  1783_swift
//
//  Created by Hyun on 2022/10/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

if n==1{
    print(1)
}else if n==2{
    print(min(4,(m+1)/2))
}else{
    if m<7{
        print(min(4, m))
    }else{
        print(m-2)
    }
}
