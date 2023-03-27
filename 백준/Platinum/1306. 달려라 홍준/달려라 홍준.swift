import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var tree = Array(repeating: 0, count: N*4)

func make_tree(from:Int, to:Int, idx:Int)->Int{
    if from == to{
        tree[idx] = arr[from]
        return tree[idx]
    }
    let mid = (from+to)/2
    let left = make_tree(from: from, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx] = left<right ? right:left
    return tree[idx]
}

func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 0
    }
    if min <= from && to <= max{
        return tree[idx]
    }
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return left<right ? right:left
}

make_tree(from: 0, to: N-1, idx: 1)
var ans = [String]()

for i in M-1..<N-M+1{
    let l = i-(M-1)
    let r = i+(M-1)
    ans.append("\(read_tree(from: 0, to: N-1, idx: 1, min: l, max: r))")
}
print(ans.joined(separator: " "))