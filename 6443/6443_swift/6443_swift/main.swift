//
//  main.swift
//  6443_swift
//
//  Created by Hyun on 2022/06/25.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let arr = readLine()!.split(separator: " ").map{String($0)}
    var ans = Set<String>()
    var str = ""
    let n = arr.count
    func btk(curr:Int){
        if curr == n {return}
        if str.count == n {ans.insert(str)}
        
        btk(curr: curr+1)
        
        str += arr[curr]
        btk(curr: curr+1)
        
        str.removeLast()
    }
    btk(curr: 0)
    print(ans)
}

