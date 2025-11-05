import Foundation

let arr = readLine()!.map{String($0)}
var one = ["A","a","b","D","d","e","g","O","o","P","p","Q","q","R","@"]
var ans = 0

for S in arr{
    if S == "B"{
        ans += 2
    }else if one.contains(S){
        ans += 1
    }else {
        continue
    }
}
print(ans)