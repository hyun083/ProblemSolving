import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let width = info[0]
let height = info[1]

let K = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<K+1{
    let shop = readLine()!.split(separator: " ").map{Int($0)!}
    var pos = 0
    
    if shop[0] == 1{
        pos += shop[1]
    }else if shop[0] == 2{
        pos += width + height + (width-shop[1])
    }else if shop[0] == 3{
        pos += (2*width) + height + (height-shop[1])
    }else if shop[0] == 4{
        pos += width + shop[1]
    }
    arr.append(pos)
}

let X = arr.removeLast()
var ans = 0
let length = (2*width)+(2*height)

for shop in arr{
    let left = shop<X ? X-shop:X+(length-shop)
    let right = shop<X ? shop+(length-X):shop-X
    ans += min(left, right)
}
print(ans)