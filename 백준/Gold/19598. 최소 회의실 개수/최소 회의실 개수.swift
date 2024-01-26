import Foundation

let N = Int(readLine()!)!
var arr = [(s:Int, e:Int)]()

for _ in 0..<N{
    let (S,E) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    arr.append((S,E))
}

arr.sort(by: {$0.s==$1.s ?  $0.e<$1.e:$0.s < $1.s})
var ans = [Int]()

for i in 0..<N{
    let next = arr[i]
    if ans.isEmpty{
        ans.append(next.e)
        continue
    }
    
    var flag = false
    
    for k in 0..<ans.count{
        if ans[k] <= next.s {
            ans[k] = next.e
            flag = true
            break
        }
    }
    
    if !flag{ ans.append(next.e) }
}
print(ans.count)