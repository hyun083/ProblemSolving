//
//  main.swift
//  27563_swift
//
//  Created by Hyun on 2023/03/05.
//

import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let Q = readLine()!.map{String($0)}
    var res = 0
    var flag = false
    op(from: Q, count: 0)
    
    func op(from q:[String], count:Int){
        if q == ["M","O","O"]{
            res = count
            flag = true
            return
        }
        if q.count < 3{
            res = -1
            flag = true
            return
        }
        if flag{ return }
        
        var tmp = q
        tmp.removeLast()
        op(from: tmp, count: count+1)
        tmp = q
        
        tmp.removeFirst()
        op(from: tmp, count: count+1)
        tmp = q
        
        tmp[0] = q.first!=="M" ? "O":"M"
        op(from: tmp, count: count+1)
        tmp = q
        
        let n = q.count-1
        tmp[n] = q.last!=="M" ? "O":"M"
        op(from: tmp, count: count+1)
        tmp = q
    }
    print(res)
}

