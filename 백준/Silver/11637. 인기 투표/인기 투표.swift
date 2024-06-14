import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    var sum = 0
    var max = -1
    var ans = -1
    
    for idx in 0..<N{
        let num = Int(readLine()!)!
        sum += num
        if max < num{
            max = num
            ans = idx+1
        }else if max==num{
            ans = -1
        }
    }
    print(ans<0 ? "no winner":max>sum/2 ? "majority winner \(ans)":"minority winner \(ans)")
}