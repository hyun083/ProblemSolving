import Foundation

let P = Int(readLine()!)!
for _ in 0..<P{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let num = info[0]
    var arr = [Int]()
    var ans = 0
    
    for i in 1...20{
        arr.append(info[i])
        arr.sort(by:<)
        ans += arr.count - 1 - arr.firstIndex(of: info[i])!
    }
    print(num, ans)
}