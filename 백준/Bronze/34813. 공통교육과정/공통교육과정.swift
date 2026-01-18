let str = readLine()!.map{String($0)}
if str[0] == "F"{
    print("Foundation")
}else if str[0] == "C"{
    print("Claves")
}else if str[0] == "V"{
    print("Veritas")
}else{
    print("Exploration")
}