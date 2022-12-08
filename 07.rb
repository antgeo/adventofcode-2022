#!ruby 
require 'set'
input = File.open("inputs/day7.txt")

class FileTree
    def initialize(name, parent = nil)
        @name = name  
        @children = []
        @parent = parent
        @size = 0 
        @@dirs ||= Set.new
        @@dirs.add self if parent
    end
    def parent
        @parent.nil? ? self : @parent
    end
    def add(child)
        @children.append child
    end
    def incr(s)
        @size = @size + s
    end
    def size
        return @size if @children.count == 0 
        return @children.map{|i| i.size}.reduce(:+) + @size
    end
    def self.all_dir
        @@dirs
    end
end

root = FileTree.new('root')
cwd = root
input.each do |line|
 line.strip!
 case line
 when /\$ cd \//
    cwd = root
 when /\$ cd \.\./
    cwd = cwd.parent
 when /\$ cd (.*)/
    newdir = FileTree.new($1,cwd)
    cwd.add newdir
    cwd = newdir
 else
    next if line =~ /^dir/    
    cwd.incr $1.to_i if line =~ /^(\d+) /
 end
end

directores = FileTree.all_dir + [root]
total_size = directores.map{|i| i.size if i.size < 100001}.compact.reduce(:+)
puts "Part 1: #{total_size}"

needed_space = 30000000 - (70000000 - root.size)
scope_dirs = directores.reject{|i| i.size < needed_space}
puts "Part 2: #{scope_dirs.sort_by{|i| i.size}.first.size}"
