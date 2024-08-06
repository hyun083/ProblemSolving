import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let NMK = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,M,K) = (NMK[0], NMK[1], NMK[2])
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    var left = 0
    var right = 0
    var ans = 0
    var tmp = 0
    
    for _ in 0..<M{
        tmp += arr[right]
        right += 1
    }
    if tmp<K { ans += 1}
    right %= N
    
    if left < right{
        for _ in 0..<N-1{
            let tail = arr[left]
            let head = arr[right]
            
            tmp -= tail
            tmp += head
            
            left += 1
            right += 1
            left %= N
            right %= N
            
            if tmp<K { ans += 1}
        }
    }
    print(ans)
}