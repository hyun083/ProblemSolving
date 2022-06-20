//
//  main.swift
//  4101_swift
//
//  Created by Hyun on 2022/06/20.
//

import Foundation

while let line = readLine(){
    if line == "0 0"{
        break
    }
    let ab = line.split(separator: " ").map{Int(String($0))!}
    print(ab[0] > ab[1] ? "Yes":"No")
}

