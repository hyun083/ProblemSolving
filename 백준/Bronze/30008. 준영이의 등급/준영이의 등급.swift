import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = [Int]()

func ratio(_ res: Int) -> Int{
    if res <= 4{
        return 1
    }else if res <= 11{
        return 2
    }else if res <= 23{
        return 3
    }else if res <= 40{
        return 4
    }else if res <= 60{
        return 5
    }else if res <= 77{
        return 6
    }else if res <= 89{
        return 7
    }else if res <= 96{
        return 8
    }else{
        return 9
    }
}

for score in arr{
    let res = score*100/N
    ans.append(ratio(res))
}
for i in ans{
    print(i, terminator: " ")
}