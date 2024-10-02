import Foundation

let N = Int(readLine()!)!
var arr = [[String]]()
var check = Array(repeating: true, count: N)
var ans = 0

for _ in 0..<N{
    let str = readLine()!.map{String($0)}
    arr.append(str)
}
arr.sort(by: {$0.count < $1.count})

for i in 0..<N-1{
    for k in i+1..<N{
        if arr[k].starts(with: arr[i]){
            check[i] = false
            break
        }
    }
}
for i in 0..<N{
    if check[i]{
        ans += 1
    }
}
print(ans)