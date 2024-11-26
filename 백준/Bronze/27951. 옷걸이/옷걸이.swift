import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var clothes = readLine()!.split(separator: " ").map{Int($0)!}

var U = 0
var D = 0
var B = 0

var up = clothes[0]
var down = clothes[1]

var res = [String]()
var ans = "YES"

for info in arr{
    U += info==1 ? 1 : 0
    D += info==2 ? 1 : 0
    B += info==3 ? 1 : 0
}

for info in arr{
    if info==1 && up>0{
        res.append("U")
        up -= 1
    }else if info==2 && down>0{
        res.append("D")
        down -= 1
    }else if info==3 && up>0{
        res.append("U")
        up -= 1
    }else if info==3 && down>0{
        res.append("D")
        down -= 1
    }else{
        ans = "NO"
        res = []
    }
}

print(ans)
if ans=="YES"{
    print(res.joined())
}