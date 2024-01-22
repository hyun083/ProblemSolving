import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var preSum = [arr[0]]
var ans = 0

for i in 1..<N{
    preSum.append(arr[i]+preSum[i-1])
}

//벌 벌 꿀통
var temp = preSum[N-1]-preSum[0]
for i in 1..<N-1{
    ans = max(ans, temp-arr[i]+preSum[N-1]-preSum[i])
}

//벌 꿀통 벌
for i in 1..<N-1{
    ans = max(ans, preSum[i]-preSum[0]+preSum[N-2]-preSum[i-1])
}

//꿀통 벌 벌
temp = preSum[N-2]
for i in 1..<N-1{
    ans = max(ans, temp-arr[i]+preSum[i-1])
}
print(ans)