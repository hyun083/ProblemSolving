//
//  main.swift
//  1342_swift
//
//  Created by Hyun on 2022/11/24.
//

import Foundation

let s = readLine()!.map{String($0)}
var arr = Array(repeating: 0, count: 26)
var ans = 0

for i in 0..<s.count{
    let idx = Int(Character(s[i]).asciiValue!) - 97
    arr[idx] += 1
}

func btk(n:Int, curr:String){
    if n == s.count{
        ans += 1
        return
    }
    for i in 0..<26{
        if arr[i]==0 { continue }
        if curr.count>0 && curr.last!.asciiValue!-97==i{ continue }
        let str = String(UnicodeScalar(97+i)!)
        arr[i] -= 1
        btk(n: n+1, curr: curr+str)
        arr[i] += 1
    }
}

btk(n: 0, curr: "")
print(ans)
