import Foundation

let arr = [6,3,2,1,2]
var line1 = readLine()!.split(separator: " ").map{Int(String($0))!}
var line2 = readLine()!.split(separator: " ").map{ Int(String($0))!}

for i in 0..<5{
    line1[i] *= arr[i]
    line2[i] *= arr[i]
}
print(line1.reduce(0, +), line2.reduce(0, +))