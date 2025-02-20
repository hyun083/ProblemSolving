import Foundation

let NLD = readLine()!.split(separator: " ").map{Int($0)!}
let N = NLD[0]
let L = NLD[1]
let D = NLD[2]
let total = (L*N)+(5*(N-1))

var arr = [Bool]()
var ans = (total)%D==0 ? total:((total)/D)*D+D

for i in 0..<N{
    let tmp = Array(repeating: false, count: L)
    let mute = Array(repeating: true, count: 5)
    arr += i==N-1 ? tmp:tmp+mute
}

for i  in stride(from: 0, to: total, by: +D){
    if arr[i] {
        ans = i
        break
    }
}
print(ans)