import Foundation

var ans = 0
let (N,S,R) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = Array(repeating: 1, count: N)

let lost = readLine()!.split(separator: " ").map{Int($0)!-1}
for num in lost{
    arr[num] -= 1
}

let remain = readLine()!.split(separator: " ").map{Int($0)!-1}
for num in remain{
    arr[num] += 1
}

for i in 0..<N{
    if arr[i]==0{
        if i>0 && arr[i-1]>1{
            arr[i-1] -= 1
            continue
        }else if i<N-1 && arr[i+1]>1{
            arr[i+1] -= 1
            continue
        }else{
            ans += 1
        }
    }
}
print(ans)