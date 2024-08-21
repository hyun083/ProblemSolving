import Foundation

let T = Int(readLine()!)!
for t in 1...T{
    var NB = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NB[0]
    var B = NB[1]
    var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
    var ans = 0
    for i in 0..<N{
        let cost = arr[i]
        if B-cost>=0 {
            B-=cost
            ans += 1
        }else{
            break
        }
    }
    print("Case #\(t): \(ans)")
}