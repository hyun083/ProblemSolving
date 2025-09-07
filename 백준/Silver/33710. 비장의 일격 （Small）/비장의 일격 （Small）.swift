import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var S = readLine()!.map{String($0)}
var U = 0
var V = 0
var X = 0
var Y = 0

var targetLength0 = 0
var targetLength1 = 0

for i in 0..<S.count-1{
    for k in i+1..<S.count{
        if S[i]==S[k] && S[i] != "X"{
            if targetLength0 < (k-i+1){
                U = i
                V = k
                targetLength0 = (k-i+1)
            }
        }
    }
}

U = 0
V = 0
for i in stride(from: 0, to: S.count-3, by: +1){
    for k in stride(from: i+1, to: S.count-2, by: +1){
        for o in stride(from: k+1, to: S.count-1, by: +1){
            for p in stride(from: o+1, to: S.count, by: +1){
                if S[i]==S[k] && S[o]==S[p] && S[i] != "X" && S[o] != "X"{
                    if targetLength1 < (k-i+1)+(p-o+1){
                        U = i
                        V = k
                        X = o
                        Y = p
                        targetLength1 = (k-i+1)+(p-o+1)
                    }
                }
            }
        }
    }
}
print(min(N-targetLength0, N-targetLength1))