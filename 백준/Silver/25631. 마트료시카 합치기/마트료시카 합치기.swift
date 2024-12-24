import Foundation

var ans = 0
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)

while !arr.isEmpty {
    ans += 1
    var last = arr.removeLast()
    var tmp = [Int]()
    for i in stride(from: arr.count-1, through: 0, by: -1){
        if arr[i] < last{
            last = arr[i]
        }else{
            tmp.append(arr[i])
        }
    }
    arr = tmp.sorted(by: <)
}
print(ans)