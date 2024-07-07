import Foundation

let N = Int(readLine()!)!
var arr = [(s:Int, b:Int)]()
var ans = Int.max

for _ in 0..<N{
    let (S,B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((S,B))
}

func btk(curr:(s:Int,b:Int), idx:Int){
    ans = min(ans, abs(curr.s-curr.b))
    if idx == N{ return }
    
    var next = curr
    next.s *= arr[idx].s
    next.b += arr[idx].b
    btk(curr: next, idx: idx+1)
    btk(curr: curr, idx: idx+1)
}

for i in 0..<N{
    btk(curr: arr[i], idx: i+1)
}
print(ans)