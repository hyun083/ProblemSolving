import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
var belt = readLine()!.split(separator: " ").map{(false,Int($0)!)}

let N = NK[0]
var K = NK[1]
var ans = 0

func rotate(){
    while K>0{
        ans += 1
        belt[N-1].0 = false
        
        let tmp = belt.last!
        for i in (1..<(2*N)).reversed(){
            belt[i] = belt[i-1]
        }
        belt[0] = tmp
        belt[N-1].0 = false
        
        for i in (1..<N).reversed(){
            if !belt[i].0 && belt[i].1>0 && belt[i-1].0{
                belt[i-1].0 = false
                belt[i].0 = true
                belt[i].1 -= 1
                K -= belt[i].1==0 ? 1:0
                if K<0 { return }
            }
        }
        belt[N-1].0 = false
        
        if belt[0].1>0{
            belt[0].0 = true
            belt[0].1 -= 1
            K -= belt[0].1==0 ? 1:0
            if K<0 { return }
        }
    }
}
rotate()
print(ans)