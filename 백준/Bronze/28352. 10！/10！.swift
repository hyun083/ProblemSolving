var N = Int(readLine()!)!
var ans = 1
while N > 0{
    ans *= N
    N -= 1
}
print(ans/(86400*7))