import Foundation

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int($0)!}
let M = Int(readLine()!)!
var B = readLine()!.split(separator: " ").map{Int($0)!}
var ans = [Int]()


while !A.isEmpty && !B.isEmpty{
    let Amax = A.max()!
    let Bmax = B.max()!
    let Aidx = A.firstIndex(of: Amax)!
    let Bidx = B.firstIndex(of: Bmax)!
    
    if Amax==Bmax{
        ans.append(Amax)
        A = Array(A[Aidx+1..<A.count])
        B = Array(B[Bidx+1..<B.count])
    }else if Amax>Bmax{
        A.remove(at: Aidx)
    }else{
        B.remove(at: Bidx)
    }
}
    
print(ans.count)
if ans.count>0{
    for num in ans{
        print(num,terminator: " ")
    }
}