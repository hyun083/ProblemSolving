import Foundation

let line = readLine()!.split(separator: " ").map{String($0)}
let LV = Int(line[0])!
let K = line[1]
var ans = 0

if K == "miss"{
    ans = 0
}else if K=="bad"{
    ans = 200*LV
}else if K=="cool"{
    ans = 400*LV
}else if K=="great"{
    ans = 600*LV
}else{
    ans = 1000*LV
}
print(ans)