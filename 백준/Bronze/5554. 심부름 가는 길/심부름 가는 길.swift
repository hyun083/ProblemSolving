var time = 0
for _ in 0..<4{
    time += Int(readLine()!)!
}
print(time/60)
print(time%60)