import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let reversedArr = arr.map{$0==1 ? 0:1}

var leftCntArr = Array(repeating: 0, count: N)
var rightCntArr = Array(repeating: 0, count: N)
leftCntArr[0] = 1
rightCntArr[N-1] = 1

for i in 1..<N{
    if arr[i-1] == arr[i]{
        leftCntArr[i] = leftCntArr[i-1]+1
    }else{
        leftCntArr[i] = 1
    }
}

for i in stride(from: N-2, through: 0, by: -1){
    if arr[i+1] == arr[i]{
        rightCntArr[i] = rightCntArr[i+1]+1
    }else{
        rightCntArr[i] = 1
    }
}
var ans = leftCntArr.max()!
for i in 0..<N-1{
    if reversedArr[i] == arr[i+1]{
        ans = max(ans,leftCntArr[i]+rightCntArr[i+1])
    }
}
print(ans)