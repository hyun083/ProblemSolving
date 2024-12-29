import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let A = readLine()!.split(separator: " ").map{Int($0)!}
    let B = readLine()!.split(separator: " ").map{Int($0)!}
    
    let res = compare(A, B)
    print(res == 0 ? "D":res == 1 ? "A":"B")
}

func compare(_ a: [Int], _ b: [Int]) -> Int{
    var DA = [Int:Int]()
    var DB = [Int:Int]()
    
    for i in 1...a[0]{
        let num = a[i]
        if DA[num] == nil{
            DA[num] = 1
        }else{
            DA[num]! += 1
        }
    }
    
    for i in 1...b[0]{
        let num = b[i]
        if DB[num] == nil{
            DB[num] = 1
        }else{
            DB[num]! += 1
        }
    }
    
    for key in stride(from: 4, through: 1, by: -1){
        let da = DA[key] ?? 0
        let db = DB[key] ?? 0
        if da == db { continue }
        if da > db{
            return 1
        }else if da < db{
            return -1
        }
    }
    return 0
}