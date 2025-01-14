const std = @import("std");
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();
const stdout = std.io.getStdOut().writer();

pub fn main() !void{
    var dir = try std.fs.cwd().openDir(".", .{});
    defer dir.close();
    var files = std.ArrayList([]const u8).init(allocator);
    defer files.deinit();
    var dir_iterator = dir.iterate();
    while (try dir_iterator.next()) |file|{
        try files.append(file.name);
        try stdout.print("{s}\n",.{file.name});
    }


    
}