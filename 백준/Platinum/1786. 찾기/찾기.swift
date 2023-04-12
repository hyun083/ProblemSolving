import Foundation

let S = readLine()!.map{String($0)}
let W = readLine()!.map{String($0)}

let N = S.count
let M = W.count

var fail = Array(repeating: 0, count: M)
var k = 0
for i in 1..<M{
    while k>0 && W[i] != W[k] { k = fail[k-1] }
    if W[i] == W[k] {
        k += 1
        fail[i] = k
    }
}

var ans = [String]()
k=0
for i in 0..<N{
    while k>0 && S[i] != W[k] { k = fail[k-1] }
    
    if S[i] == W[k]{
        if k == M-1{
            ans.append("\(i-k+1)")
            k = fail[k]
        }else{
            k += 1
        }
    }
}
print(ans.count)
print(ans.joined(separator: " "))