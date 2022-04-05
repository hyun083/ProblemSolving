//
//  main.swift
//  2941_swift
//
//  Created by Hyun on 2022/04/04.
//

import Foundation

var str = readLine()!
let arr = ["c=","c-","dz=","d-","lj","nj","s=","z="]
for a in arr{
    str = str.replacingOccurrences(of: a, with: "@")
}
print(str.count)

