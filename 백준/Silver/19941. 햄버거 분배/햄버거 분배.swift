import Foundation

let (N,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var ham = [Bool]()
var arr = readLine()!.map{String($0)}
var ans = 0

for i in 0..<N{
    ham.append(arr[i]=="H")
}

for i in 0..<N{
    if arr[i]=="P"{
        for k in max(0,i-K)...min(N-1,i+K){
            if ham[k]{
                ham[k] = false
                ans += 1
                break
            }
        }
    }
}
print(ans)