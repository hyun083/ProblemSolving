import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let M = Int(readLine()!)!
    var myMinDiff = Int.max
    var num = 0
    var x = 0
    var y = 0
    
    for i in 0..<61{
        for k in i..<61{
            let A = 1<<i
            let B = 1<<k
            if abs(A+B-M) < myMinDiff{
                myMinDiff = abs(A+B-M)
                num = A+B
                x = i
                y = k
            }else if abs(A+B-M) == myMinDiff && (A+B) < num{
                num = A+B
                x = i
                y = k
            }
        }
    }
    print(x,y)
}