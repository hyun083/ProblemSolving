import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    var ans = 1
    for i in 0..<N{
        let curr = arr[i]
        ans += ans==curr ? 1:0
        ans += i<N-1 ? 1:0
    }
    print(ans)
}