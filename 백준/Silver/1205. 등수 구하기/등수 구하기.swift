import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0]
let target = line[1]
let p = line[2]

var record = [Int]()

if n != 0{
    record = readLine()!.split(separator: " ").map{Int(String($0))!}
}

var rank = 1
for score in record{
    if target <= score{
        rank += 1
    }
}

if rank > p{
    print(-1)
}else{
    var ans = 1
    for score in record{
        if score > target{
            ans += 1
        }else{
            break
        }
    }
    print(ans)
}