import Foundation

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NK[0]
let K = NK[1]

var arr = Array(1...N)
var josephus = [Int]()

var cnt = 0
var idx = -1

while josephus.count < arr.count{
    cnt += 1
    idx += 1
    if idx >= arr.count{
        idx = 0
    }
    if arr[idx] == 0{
        while arr[idx] == 0{
            idx += 1
            if idx >= arr.count{
                idx = 0
            }
        }
    }
    if cnt == K{
        josephus.append(arr[idx])
        arr[idx]=0
        cnt = 0
        continue
    }
}

var text = "<"
for j in josephus{
    if j == josephus.last{
        text+=String(j)
    }else{
        text+=String(j)+", "
    }
}
text += ">"
print(text)