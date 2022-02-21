//
//  main.swift
//  blobnom_swift
//
//  Created by Hyun on 2022/02/21.
//

import Foundation

let N = Int(readLine()!)!
let blobs = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = [UInt64]()

if N == 1 || N == 2{
    print(blobs.max()!)
}else{
    for i in 1..<N-1{
        dp.append(UInt64(blobs[i] + min(blobs[i-1], blobs[i+1])))
    }
    print(dp.max()!)
}
