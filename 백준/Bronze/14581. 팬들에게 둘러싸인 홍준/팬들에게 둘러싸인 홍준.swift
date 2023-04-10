import Foundation
var ans = [":fan:",":fan:",":fan:",
           ":fan:",":fan:",":fan:",
           ":fan:",":fan:",":fan:"]
ans[4] = ":"+readLine()!+":"
for i in 0..<9{
    print(ans[i],terminator: "")
    if (i+1)%3==0{ print()}
}