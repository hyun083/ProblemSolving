let N = Int(readLine()!)!
let arr = readLine()!.map{String($0)}
let target:Set<String> = ["a","e","i","o","u"]
var ans = 0
for data in arr{
    if target.contains(data){
        ans += 1
    }
}
print(ans)