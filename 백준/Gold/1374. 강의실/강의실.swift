import Foundation

let N = Int(readLine()!)!
var arr = [(start:Int, end:Int)]()
var ans = [Int]()

for _ in 0..<N{
    let (num, s, e) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    arr.append((s,e))
}
arr.sort(by: {$0.start==$1.start ? $0.end<$1.end:$0.start<$1.start})

for i in 0..<N{
    let next = arr[i]
    var flag = false
    
    for k in 0..<ans.count{
        if ans[k] <= next.start{
            ans[k] = next.end
            flag = true
            break
        }
    }
    if !flag{ ans.append(next.end) }
}
print(ans.count)