import Foundation

let N = Int(readLine()!)!
let H = readLine()!.split(separator: " ").map{Int($0)!}
let A = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [(height:Int, grow:Int)]()
var ans = 0

for i in 0..<N{
    arr.append((height:H[i]+((N-1)*A[i]), grow:A[i]))
}
arr.sort(by:{$0.grow > $1.grow})

for i in 0..<N{
    ans += arr[i].height - (arr[i].grow*i)
}
print(ans)