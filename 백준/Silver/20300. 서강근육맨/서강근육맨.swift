import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by:<)
var ans = 0

if N%2==0{
    var head = 0
    var tail = N-1
    while head<tail{
        let value = arr[head]+arr[tail]
        ans = max(ans,value)
        head += 1
        tail -= 1
    }
}else{
    ans = max(ans,arr[N-1])
    arr.removeLast()
    
    var head = 0
    var tail = N-2
    while head<tail{
        let value = arr[head]+arr[tail]
        ans = max(ans,value)
        head += 1
        tail -= 1
    }
}
print(ans)