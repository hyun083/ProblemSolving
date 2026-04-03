import Foundation

let N = Int(readLine()!)!
var arr = Dictionary<String,Int>()
let time = [4,6,4,10]

for _ in 0..<N {
    for i in 0..<4 {
        let info = readLine()!.split(separator: " ").map{String($0)}
        for employee in info {
            if employee == "-" { continue }
            arr[employee,default: 0] += time[i]
        }
    }
}
let myMax = arr.max(by: { $0.value < $1.value })?.value ?? 0
let myMin = arr.min(by: { $0.value < $1.value })?.value ?? 0
print(myMax - myMin <= 12 ? "Yes":"No")