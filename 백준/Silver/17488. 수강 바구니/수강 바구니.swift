import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0], M = NM[1]
var remain = readLine()!.split(separator: " ").map{Int($0)!}

var cart = Array(repeating: 0, count: M)
var ans = Array(repeating: [Int](), count: N)
var student = Array(repeating: [Int](), count: N)

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    for num in info{
        if num == -1{ break }
        remain[num-1] -= 1
        student[i].append(num)
    }
}

for i in 0..<N{
    let curr = student[i]
    for num in curr{
        if remain[num-1] >= 0{
            ans[i].append(num)
        }
    }
}

student = Array(repeating: [Int](), count: N)

for i in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    for num in info{
        if num == -1{ break }
        remain[num-1] -= 1
        student[i].append(num)
    }
}
for i in 0..<N{
    let curr = student[i]
    for num in curr{
        if remain[num-1]>=0{
            ans[i].append(num)
        }
    }
}

for res in ans{
    if res.isEmpty { print("망했어요"); continue }
    for num in res.sorted(by: <) {
        print(num,terminator: " ")
    }
    print()
}