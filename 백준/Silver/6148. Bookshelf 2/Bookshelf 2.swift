import Foundation

let NB = readLine()!.split(separator: " ").map{Int($0)!}
let N = NB[0]
let B = NB[1]
var arr = [Int]()
var ans = Int.max

for _ in 0..<N{
    let height = Int(readLine()!)!
    arr.append(height)
}

func btk(from curr:Int, total:Int){
    var sum = total
    for i in curr..<N{
        sum += arr[i]
        if sum >= B{
            ans = min(ans,sum-B)
        }
        btk(from: i+1, total:sum)
        sum -= arr[i]
    }
}
btk(from: 0, total: 0)
print(ans)