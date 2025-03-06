import Foundation

for _ in 0..<3{
    let num = readLine()!.map{String($0)}
    var ans = 1
    var curr = 1
    for i in 1..<8{
        if num[i] == num[i-1]{
            curr += 1
            ans = max(ans,curr)
        }else{
            curr = 1
        }
    }
    ans = max(ans,curr)
    print(ans)
}