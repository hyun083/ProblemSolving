import Foundation

let N = Int(readLine()!)!
var arr = [[String]]()

for _ in 0..<N {
    let line:[String] = readLine()!.split(separator: " ").map{String($0)}.reversed()
    arr.append(line)
}
let L = readLine()!.split(separator: " ").map{String($0)}
var idx = 0

while idx<L.count {
    let target = L[idx]
    var found = false
    for i in 0..<N {
        if arr[i].last == target {
            arr[i].removeLast()
            found = true
        }
    }
    if found {
        idx += 1
    } else {
        break
    }
}

var count = 0
for i in 0..<N {
    count += arr[i].count
}
if count==0{
    print(idx==L.count ? "Possible":"Impossible")
} else {
    print("Impossible")
}