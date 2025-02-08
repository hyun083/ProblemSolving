import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    var credit = 0.0
    var grade = 0.0
    for _ in 0..<N{
        let CG = readLine()!.split(separator: " ").map{Double($0)!}
        let C = CG[0]
        let G = CG[1]
        credit += C
        grade += G*C
    }
    print(Int(credit), grade/credit)
}