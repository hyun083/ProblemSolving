import Foundation

let T = Int(readLine()!)!
for t in 1...T{
    let _ = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    while arr.count > 2{
        var tmp = [Int]()
        for i in 0...arr.count/2{
            let num = arr[i] + arr[arr.count-1-i]
            tmp.append(num)
        }
        arr = tmp
    }
    print(arr[0]>arr[1] ? "Case #\(t): Alice":"Case #\(t): Bob")
}