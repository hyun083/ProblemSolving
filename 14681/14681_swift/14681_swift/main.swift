//
//  main.swift
//  14681_swift
//
//  Created by Hyun on 2022/04/25.
//

import Foundation

let x = Int(readLine()!)!
let y = Int(readLine()!)!

if x>0 && y>0{
    print(1)
}else if x<0 && y>0{
    print(2)
}else if x<0 && y<0{
    print(3)
}else{
    print(4)
}
