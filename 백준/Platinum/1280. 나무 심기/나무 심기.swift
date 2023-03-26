import Foundation

let MOD = 1000000007
let N = Int(readLine()!)!
var count_tree = Array(repeating: (count:0,length:0), count: 200000*4)
var ans = 1

func update_count(start:Int, end:Int, node:Int, target_idx:Int){
    if target_idx < start || end < target_idx{ return }
    count_tree[node].count += 1
    count_tree[node].length += target_idx
    if start == end{ return }

    let mid = (start+end)/2
    update_count(start: start, end: mid, node: node*2, target_idx: target_idx)
    update_count(start: mid+1, end: end, node: node*2+1, target_idx: target_idx)
}

func read_info(start:Int, end:Int, node:Int, min:Int, max:Int) -> (Int,Int){
    if end < min || max < start{ return (0,0) }
    if min <= start && end <= max{ return count_tree[node] }

    let mid = (start+end)/2
    let left = read_info(start: start, end: mid, node: node*2, min: min, max: max)
    let right = read_info(start: mid+1, end: end, node: node*2+1, min: min, max: max)
    return (left.0+right.0, left.1+right.1)
}

for idx in 0..<N{
    var cost = 0
    let coord = Int(readLine()!)!
    let left = read_info(start: 0, end: 199999, node: 1, min: 0, max: coord)
    let right = read_info(start: 0, end: 199999, node: 1, min: coord+1, max: 199999)
    
    cost += coord*left.0 - left.1
    cost += right.1 - coord*right.0
    cost %= MOD
    
    update_count(start: 0, end: 199999, node: 1, target_idx: coord)
    if idx == 0 { continue }
    ans *= cost
    ans %= MOD
}
print(ans)