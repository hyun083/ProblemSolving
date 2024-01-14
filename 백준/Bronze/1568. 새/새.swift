import Foundation

var N = Int(readLine()!)!
var song = 1
var ans = 0

while N>0{
    if N<song{ song = 1 }
    N -= song
    song += 1
    ans += 1
}
print(ans)