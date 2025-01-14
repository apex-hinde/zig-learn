const std = @import("std");
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();

pub fn main() !void{
    var args = std.process.args();
    _ = args.skip();
    const name = args.next().?;
    
    var dir = try std.fs.cwd().openDir(".", .{});
    try dir.makeDir(name);
    defer dir.close();
}