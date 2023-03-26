import Foundation

let n = Int(readLine()!)!
var myMax = readLine()!.split(separator: " ").map{Int($0)!}
var myMin = myMax

for _ in 1..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let mx = myMax
    let mm = myMin
    
    myMax[0] = max(mx[0], mx[1]) + line[0]
    myMax[1] = max(mx[0], max(mx[1], mx[2])) + line[1]
    myMax[2] = max(mx[1], mx[2]) + line[2]
    
    myMin[0] = min(mm[0], mm[1]) + line[0]
    myMin[1] = min(mm[0], min(mm[1], mm[2])) + line[1]
    myMin[2] = min(mm[1], mm[2]) + line[2]
}
print(myMax.max()!,myMin.min()!)