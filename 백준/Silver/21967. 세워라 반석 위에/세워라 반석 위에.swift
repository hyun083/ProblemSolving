import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dic = Dictionary<Int,Int>()
var left = 0
var right = 0
var ans = 0
var diff = 0

while left<N{
    if right>=N || diff>2{
        let num = arr[left]
        dic[num]! -= 1
        if dic[num]! == 0{
            dic.removeValue(forKey: num)
        }
        left += 1
    }else{
        let num = arr[right]
        if dic[num] == nil{
            dic[num] = 1
        }else{
            dic[num]! += 1
        }
        right += 1
    }
    if !dic.isEmpty{
        let mx = dic.keys.max()!
        let mn = dic.keys.min()!
        diff = mx-mn
    }
    if diff<=2{
        ans = max(ans, right-left)
    }
}
print(ans)