import Foundation

let N = Int(readLine()!)!
var cnt = Int(readLine()!)!

if N==1 || N==5{
    let ans = N+(cnt*8)-1
    print(ans)
}else{
    let tmp = N==2 ? 6 : N==3 ? 4 : 2
    let ans = N+(cnt/2*8)+(cnt%2*(tmp))-1
    print(ans)
}