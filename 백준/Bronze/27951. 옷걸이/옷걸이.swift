import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{String($0)}
var clothes = readLine()!.split(separator: " ").map{Int($0)!}

var up = clothes[0]
var down = clothes[1]

var res = [String]()
var ans = "YES"

for i in 0..<N{
    let hanger = arr[i]
    if hanger != "1" { continue }
    
    if up>0 {
        arr[i] = "U"
        up -= 1
    } else {
        ans = "NO"
    }
}

for i in 0..<N{
    let hanger = arr[i]
    if hanger != "2" { continue }
    
    if down>0 {
        arr[i] = "D"
        down -= 1
    } else {
        ans = "NO"
    }
}

for i in 0..<N{
    let hanger = arr[i]
    if hanger != "3" { continue }
    if up>0 {
        arr[i] = "U"
        up -= 1
    }else if down>0 {
        arr[i] = "D"
        down -= 1
    }else{
        ans = "NO"
    }
}

print(ans)
if ans=="YES"{
    print(arr.joined())
}