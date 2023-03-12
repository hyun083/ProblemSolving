//
//  main.swift
//  3653_swift
//
//  Created by Hyun on 2023/03/12.
//

import Foundation

let T = Int(readLine()!)!
var ans = [String]()

for _ in 0..<T{
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let cmd = readLine()!.split(separator: " ").map{Int($0)!-1}
    var result = [String]()
    
    let n = nm[0]
    let m = nm[1]
    var arr = Array(repeating: 0, count: n)
    var tree = Array(repeating: 0, count: (n+m)*4)
    
    func update_tree(start:Int, end:Int, node:Int, idx:Int, value:Int){
        if idx < start || end < idx{
            return
        }
        tree[node] += value
        if start == end{ return }
        
        let mid = (start+end)/2
        update_tree(start: start, end: mid, node: node*2, idx: idx, value: value)
        update_tree(start: mid+1, end: end, node: node*2+1, idx: idx, value: value)
    }
    
    func read_tree(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
        if end < from || to < start{
            return 0
        }
        if from <= start && end <= to{
            return tree[node]
        }
        
        let mid = (start+end)/2
        let left = read_tree(start: start, end: mid, node: node*2, from: from, to: to)
        let right = read_tree(start: mid+1, end: end , node: node*2+1, from: from, to: to)
        return left + right
    }
    
    for i in 0..<n{
        update_tree(start: 0, end: n+m-1, node: 1, idx: i+m, value: 1)
        arr[i] = i+m
    }
    
    var newNumber = m-1
    for i in 0..<m{
        let number = cmd[i]
        let idx = arr[number]
        result.append("\(read_tree(start: 0, end: n+m-1, node: 1, from: 0, to: idx-1))")
        update_tree(start: 0, end: n+m-1, node: 1, idx: idx, value: -1)
        update_tree(start: 0, end: n+m-1, node: 1, idx: newNumber, value: 1)
        arr[number] = newNumber
        newNumber -= 1
    }
    ans.append(result.joined(separator: " "))
}
print(ans.joined(separator: "\n"))
