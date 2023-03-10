//
//  main.swift
//  6549_swift
//
//  Created by Hyun on 2023/03/10.
//

import Foundation

var ans = [String]()
while let input = readLine(){
    if input == "0" { break }
    var result = 0
    var arr = input.split(separator: " ").map{Int($0)!}
    let N = arr.removeFirst()
    var tree = Array(repeating: 0, count: N*4)
    
    func init_tree(start:Int, end:Int, node:Int) -> Int{
        if start == end{
            tree[node] = start
            return tree[node]
        }
        
        let mid = (start+end)/2
        let left = init_tree(start: start, end: mid, node: node*2)
        let right = init_tree(start: mid+1, end: end, node: node*2+1)
        
        if arr[left] == arr[right]{
            tree[node] = left<right ? left:right
        }else{
            tree[node] = arr[left]<arr[right] ? left:right
        }
        return tree[node]
    }
    
    func read_tree(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
        if end<from || to<start{
            return -1
        }
        if from<=start && end<=to{
            return tree[node]
        }
        
        let mid = (start+end)/2
        let left = read_tree(start: start, end: mid, node: node*2, from: from, to: to)
        let right = read_tree(start: mid+1, end: end, node: node*2+1, from: from, to: to)
        
        if left < 0{
            return right
        }else if right < 0{
            return left
        }else if arr[left] == arr[right]{
            return left<right ? left:right
        }else{
            return arr[left]<arr[right] ? left:right
        }
    }
    
    func update_result(from:Int, to:Int){
        let width = to - from + 1
        let idx = read_tree(start: 0, end: N-1, node: 1, from: from, to: to)
        result = max(result, width*arr[idx])
        if from == to{ return }
        if from < idx{ update_result(from: from, to: idx-1) }
        if idx < to { update_result(from: idx+1, to: to)}
    }
    
    init_tree(start: 0, end: N-1, node: 1)
    update_result(from: 0, to: N-1)
    ans.append("\(result)")
}
print(ans.joined(separator: "\n"))
