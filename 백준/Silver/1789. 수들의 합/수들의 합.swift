var S = Int(readLine()!)!
var N = 1

while S > 0{
    S -= N
    if S <= N{
        break
    }
    N += 1
}
print(N)