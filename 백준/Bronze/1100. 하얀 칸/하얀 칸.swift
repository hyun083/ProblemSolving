import Foundation

var ans = 0
for i in 0..<8{
    let board = readLine()!.map{String($0)}
    for k in 0..<8{
        ans += (i%2==0&&k%2==0&&board[k]=="F")||(i%2==1&&k%2==1&&board[k]=="F") ? 1:0
    }
}
print(ans)