//
//  main.swift
//  18301_swift
//
//  Created by Hyun on 2022/05/14.
//

//import Foundation

let num = readLine()!.split(separator: " ").map{Int(String($0))!}
print((num[0]+1)*(num[1]+1)/(num[2]+1)-1)

