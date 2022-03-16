//
//  main.swift
//  10998_swift
//
//  Created by Hyun on 2022/03/16.
//

//import Foundation

print(readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(1){$0*$1})

