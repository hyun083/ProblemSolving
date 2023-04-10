var cnt = 1
for output in readLine()!.map{String($0)}{
    print(output,terminator: "")
    if cnt%10==0{
        print()
    }
    cnt+=1
}