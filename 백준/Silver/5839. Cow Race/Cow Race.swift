import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var bessie = [Int]()
var elsie = [Int]()

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let length = input[0]
    let time = input[1]
    for _ in 0..<time{
        if bessie.isEmpty{
            bessie.append(length)
        }else{
            bessie.append(bessie.last! + length)
        }
    }
}
for _ in 0..<M{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let length = input[0]
    let time = input[1]
    for _ in 0..<time{
        if elsie.isEmpty{
            elsie.append(length)
        }else{
            elsie.append(elsie.last! + length)
        }
    }
}
var ans = 0
var idx = 0

for i in 0..<elsie.count{
    if bessie[i] == elsie[i]{
        continue
    }else if bessie[i] > elsie[i]{
        if bessie[idx] < elsie[idx]{
            idx = i
            ans += 1
        }else{
            idx = i
        }
    }else if bessie[i] < elsie[i]{
        if bessie[idx] > elsie[idx]{
            idx = i
            ans += 1
        }else{
            idx = i
        }
    }
}
print(ans)