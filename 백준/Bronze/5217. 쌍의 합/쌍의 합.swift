import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    var arr = [(Int,Int)]()
    for num in 1..<N{
        if num >= N-num{
            break
        }else{
            arr.append((num,N-num))
        }
    }
    print("Pairs for \(N):",terminator: " ")
    for i in 0..<arr.count{
        let ans = arr[i]
        print("\(ans.0) \(ans.1)",terminator: i==arr.count-1 ? "":", ")
    }
    print()
}