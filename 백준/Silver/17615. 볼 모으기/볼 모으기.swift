import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{String($0)}
var ans = N
var flag = false
var res = 0

for i in 0..<N{
    if arr[i] == "R"{
        if flag {res += 1}
    }else{
        flag = true
    }
}
ans = min(ans, res)
flag = false
res = 0

for i in stride(from: N-1, through: 0, by: -1){
    if arr[i] == "R"{
        if flag {res += 1}
    }else{
        flag = true
    }
}
ans = min(ans, res)
flag = false
res = 0

for i in 0..<N{
    if arr[i] == "B"{
        if flag {res += 1}
    }else{
        flag = true
    }
}
ans = min(ans, res)
flag = false
res = 0

for i in stride(from: N-1, through: 0, by: -1){
    if arr[i] == "B"{
        if flag {res += 1}
    }else{
        flag = true
    }
}
ans = min(ans, res)
flag = false
res = 0

print(ans)