import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let X = Int(readLine()!)!
var total = 0
var cnt = 0

func euc (A:Int, B:Int) -> Int{
    let remain = A%B
    if remain == 0{
        return B
    }
    return euc(A: B, B: remain)
}

for num in arr{
    if euc(A: num, B: X)==1{
        total += num
        cnt += 1
    }
}
let ans = Double(total)/Double(cnt)
print(ans)