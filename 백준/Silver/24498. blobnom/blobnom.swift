let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = max(arr.first!, arr.last!)
 
if N > 1{
    for num in 1..<N-1{
        let side = min(arr[num-1], arr[num+1])
        ans = max(ans, arr[num]+side)
    }
}
print(ans)