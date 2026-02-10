import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let str = readLine()!.map{String($0)}
    if str.count != 7 {
        print(0)
        continue
    }
    let ans = (str[0]==str[1] && str[1]==str[4] &&
               str[2]==str[3] && str[3]==str[5] && str[5]==str[6] &&
               str[0] != str[3])
    print(ans ? 1:0)
}