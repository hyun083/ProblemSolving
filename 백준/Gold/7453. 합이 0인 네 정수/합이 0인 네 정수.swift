import Foundation

let N = Int(readLine()!)!
var A = [Int]()
var B = [Int]()
var C = [Int]()
var D = [Int]()

var cntAB = Dictionary<Int,Int>()
var cntCD = Dictionary<Int,Int>()

for _ in 0..<N{
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    A.append(arr[0])
    B.append(arr[1])
    C.append(arr[2])
    D.append(arr[3])
}

for k in 0..<N{
    for i in 0..<N{
        if cntAB[A[i]+B[k]]==nil{
            cntAB[A[i]+B[k]] = 1
        }else{
            cntAB[A[i]+B[k]]! += 1
        }
        
        if cntCD[C[i]+D[k]] == nil{
            cntCD[C[i]+D[k]] = 1
        }else{
            cntCD[C[i]+D[k]]! += 1
        }
    }
}

var ans = 0

for ab in cntAB.keys{
    let cd = -1*ab
    if cntCD[cd] == nil{
        continue
    }else{
        ans += cntAB[ab]! * cntCD[cd]!
    }
}

print(ans)