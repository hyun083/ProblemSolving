import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var groupOne = 0
var groupTwo = [0,0]
var groupThree = [0,0]
var ans = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let gender = info[0]
    let grade = info[1]
    if grade < 3{
        groupOne += 1
    }else if grade < 5{
        groupTwo[gender] += 1
    }else{
        groupThree[gender] += 1
    }
}
ans += groupOne%K==0 ? groupOne/K:groupOne/K+1
ans += groupTwo[0]%K == 0 ? groupTwo[0]/K:groupTwo[0]/K+1
ans += groupTwo[1]%K == 0 ? groupTwo[1]/K:groupTwo[1]/K+1
ans += groupThree[0]%K == 0 ? groupThree[0]/K:groupThree[0]/K+1
ans += groupThree[1]%K == 0 ? groupThree[1]/K:groupThree[1]/K+1
print(ans)