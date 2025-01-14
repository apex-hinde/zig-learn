const std = @import("std");

pub fn main() void{
    var i:u32 = 1;
    while(i<=100):(i+=1){
        if(i%15==0){
            std.debug.print("fizzbuzz\n",.{});
            continue;
        }  
        if(i%5==0){
            std.debug.print("fizz\n",.{});
            continue;
        }
        if(i%3==0){
            std.debug.print("buzz\n",.{});
            continue;
        }
        else{
            std.debug.print("{}\n",.{i});
            continue;
        }
    }
}