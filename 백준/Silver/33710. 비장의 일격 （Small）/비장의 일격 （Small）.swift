import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var S = readLine()!.map{String($0)}
var removedLength0 = 0
var removedLength1 = 0

for i in 0..<S.count-1{
    for k in i+1..<S.count{
        if S[i]==S[k] && S[i] != "X"{
            removedLength0 = max(removedLength0, (k-i+1))
        }
    }
}

for i in stride(from: 0, to: S.count-3, by: +1){
    for k in stride(from: i+1, to: S.count-2, by: +1){
        for o in stride(from: k+1, to: S.count-1, by: +1){
            for p in stride(from: o+1, to: S.count, by: +1){
                if S[i]==S[k] && S[o]==S[p] && S[i] != "X" && S[o] != "X"{
                    removedLength1 = max(removedLength1, (k-i+1)+(p-o+1))
                }
            }
        }
    }
}
print(min(N-removedLength0, N-removedLength1))