import Foundation

let T = Int(readLine()!)!
for t in 1...T{
    let NK = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NK[0]
    let K = NK[1]
    var arr = Array(repeating: false, count: N)
    
    for _ in 0..<K{
        for i in (1..<N).reversed(){
            if arr[0..<i].reduce(true, {$0 && $1}){
                arr[i].toggle()
            }
        }
        arr[0].toggle()
    }
    let ans = arr.reduce(true, {$0 && $1}) ? "ON":"OFF"
    print("Case #\(t): \(ans)")
}