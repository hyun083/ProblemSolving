import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var dic = Dictionary<Int,Int>()
var ans = 0
var right = 0
var left = 0

while left < N{
    if dic.count > 2 || right >= N{
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
    if dic.count <= 2{
        ans = max(right - left,ans)
    }
}
print(ans)