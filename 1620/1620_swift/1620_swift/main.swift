//
//  main.swift
//  1620_swift
//
//  Created by Hyun on 2021/11/14.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
var pockets = Array<String>()
for _ in 1...inputs[0]{
    pockets.append(readLine()!)
}

for _ in 1...inputs[1]{
    let q = readLine()!
    if let index = Int(q){
        print(pockets[index-1])
    }else{
        print(pockets.firstIndex(of: q)! + 1)
    }
}
