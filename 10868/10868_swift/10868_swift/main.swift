//
//  main.swift
//  10868_swift
//
//  Created by Hyun on 2023/02/18.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = [Int]()
var tree = Array(repeating: 0, count: N*4)
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}

func make_tree(from:Int, to:Int, idx:Int) -> Int{
    if from==to{
        tree[idx] = arr[from]
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = make_tree(from: from, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx] = left<right ? left:right
    return tree[idx]
}

func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 1000000001
    }
    if min <= from && to <= max{
        return tree[idx]
    }
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return left<right ? left:right
}

make_tree(from: 0, to: N-1, idx: 1)
var ans = [String]()

for _ in 0..<M{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    let l = num[0]-1
    let r = num[1]-1
    ans.append("\(read_tree(from: 0, to: N-1, idx: 1, min: l, max: r))")
}
print(ans.joined(separator: "\n"))
