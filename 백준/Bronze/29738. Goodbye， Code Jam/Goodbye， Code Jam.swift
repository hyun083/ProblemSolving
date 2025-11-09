import Foundation

let T = Int(readLine()!)!

for t in 1...T{
    let N = Int(readLine()!)!
  
    if N > 4500{
        print("Case #\(t): Round 1")
    }else if N > 1000{
        print("Case #\(t): Round 2")
    }else if N > 25{
        print("Case #\(t): Round 3")
    }else{
        print("Case #\(t): World Finals")
    }
}