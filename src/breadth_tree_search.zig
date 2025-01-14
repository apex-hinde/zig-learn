const std = @import("std");
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();

const Node = struct{
    value: u32,
    left: ?*Node,
    right: ?*Node,
    pub fn init(value: u32, left: ?*Node, right: ?*Node) Node{
        return Node{
        .value = value,
        .left = left,
        .right = right,
        }; 
    }

};

    var buffer = std.ArrayList(?*Node)
        .init(allocator);
pub fn main() !void{
    var root = Node.init(5, null, null);
    var branch_1_left = Node.init(4, null, null);
    root.left = &branch_1_left;
    var branch_2_right = Node.init(6, null, null);
    root.right = &branch_2_right;
    var branch_1_1_left = Node.init(3, null, null);
    branch_1_left.left = &branch_1_1_left;
    var branch_1_2_right = Node.init(2, null, null);
    branch_1_left.right = &branch_1_2_right;
    var branch_2_1_left = Node.init(7, null, null);
    branch_2_right.left = &branch_2_1_left;
    var branch_2_2_right = Node.init(8, null, null);
    branch_2_right.right = &branch_2_2_right;

    var lvl: u32 = 0;

    try buffer.append(&root);
    defer buffer.deinit();

    while(true){

        const j = buffer.items.len;
        var i: u32 = 0;

        while (i<j):(i+=1){
            const val = buffer.orderedRemove(0);
            try search(lvl, val);    
    }
        lvl +=1;
        if(buffer.items.len==0){
            break;
        }
    }
}

pub fn search(lvl: u32, treebeard: ?*Node) !void{

    if (treebeard) |node| {
        std.debug.print("lvl: {} ",.{lvl});
        std.debug.print("value: {}\n",.{node.value});
        if(node.left != null){
            try buffer.append(node.left);
        }
        if(node.right != null){
            try buffer.append(node.right);
        }

    }
}