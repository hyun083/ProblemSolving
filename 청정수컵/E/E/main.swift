//
//  main.swift
//  E
//
//  Created by Hyun on 2022/05/15.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
if line[0]%2==1 && line[1]%2==1{
    print("Can win")
}else{
    print("Can't win")
}

