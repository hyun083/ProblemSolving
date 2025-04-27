import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.map{String($0)}
var red = 0
var blue = 0
var curr = ""
for i in 0..<N{
    if curr == ""{
        curr = arr[i]
    }else if curr != arr[i]{
        curr = arr[i]
        if curr == "R"{
            blue += 1
        }else{
            red += 1
        }
    }else{
        continue
    }
}
red += curr=="R" ? 1:0
blue += curr=="B" ? 1:0
let ans = min(red,blue)+1
print(ans)