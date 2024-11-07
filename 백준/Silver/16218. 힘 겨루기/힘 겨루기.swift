import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var sumA = 0
var sumB = 0
var overpower = false
var ans = 0

for _ in 0..<N{
    let AB = readLine()!.split(separator: " ").map{Int($0)!}
    let a = AB[0]
    let b = AB[1]
    sumA += a
    sumB += b
    if !overpower && (sumA+(a/2)>=K && sumB<K) || (sumA+(a/2) >= sumB+50){
        sumA += (a+(a/2))
        overpower = true
    }
    if sumA >= sumB+50{
        ans = 1
        break
    }else if (sumA>=K || sumB>=K){
        if sumA>=K && sumB>=K{
            if overpower{ ans = -1}
            else{ ans = 1 }
        }else if sumA>=K{
            ans = 1
        }else {
            ans = -1
        }
        break
    }
}
print(ans)