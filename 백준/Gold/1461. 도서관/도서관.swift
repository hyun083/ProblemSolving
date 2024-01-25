import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
var negative = [Int]()
var positive = [Int]()

var ans = 0
var res = [Int]()

for i in 0..<N{
    if arr[i]<0{
        negative.append(arr[i])
    }else{
        positive.append(arr[i])
    }
}
negative.sort(by: <)
positive.sort(by: >)

var idx = 0
while idx < negative.count{
    res.append(negative[idx] * -1)
    idx += M
}

idx = 0
while idx < positive.count{
    res.append(positive[idx])
    idx += M
}

res.sort()
ans += res.removeLast()

while !res.isEmpty{
    ans += res.removeLast() * 2
}
print(ans)