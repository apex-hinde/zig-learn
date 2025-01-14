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
    pub fn get_value() u32{
        return .value;
    }
};

pub fn create_tree() Node{


}
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


    try search(0, &root);    
}
pub fn search(lvl: u32, treebeard: ?*Node) !void{
    if (treebeard) |node| {
        std.debug.print("lvl: {} ",.{lvl});
        std.debug.print("value: {}\n",.{node.value});
    if(node.left != null){
        try search(lvl+1,node.left);
    }
    if(node.right != null){
        try search(lvl+1,node.right);
    }
    }
}