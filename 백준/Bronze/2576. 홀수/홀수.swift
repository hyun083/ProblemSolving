import Foundation

var sum = 0
var target = Int.max

for _ in 0..<7{
    let num = Int(readLine()!)!
    if num%2 == 1{
        target = min(target,num)
        sum += num
    }
}
if sum == 0{
    print(-1)
}else{
    print(sum)
    print(target)
}