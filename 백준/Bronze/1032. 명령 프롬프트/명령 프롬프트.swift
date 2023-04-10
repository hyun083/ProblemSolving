import Foundation

let N = Int(readLine()!)!
var ans = readLine()!.map{String($0)}

for _ in 0..<N-1{
    let line = readLine()!.map{String($0)}
    for i in 0..<ans.count{
        ans[i] = line[i]==ans[i] ? ans[i]:"?"
    }
}
print(ans.joined())