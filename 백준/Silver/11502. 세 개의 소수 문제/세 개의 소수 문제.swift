import Foundation

let T = Int(readLine()!)!
var prime = Array(repeating: true, count: 10001)
var arr = [Int]()
prime[0] = false

for num in 2...1000{
    if !prime[num] { continue }
    arr.append(num)
    for n in stride(from: num+num, through: 1000, by: num){
        prime[n] = false
    }
}

for _ in 0..<T{
    let K = Int(readLine()!)!
    var ans = "0"

    for i in 0..<arr.count{
        if ans != "0" { break }
        for k in 0..<arr.count{
            if ans != "0" { break }
            for p in 0..<arr.count{
                if arr[i] + arr[k] + arr[p] == K{
                    ans = "\(arr[i]) \(arr[k]) \(arr[p])"
                    break
                }
            }
        }
    }
    print(ans)
}