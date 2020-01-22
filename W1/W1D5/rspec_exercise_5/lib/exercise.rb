

def zip(*arr)
    arr.transpose
end

def prizz_proc(arr, prc1, prc2)
    arr.select { |el| (prc1.call(el) || prc2.call(el)) && !(prc1.call(el) && prc2.call(el)) }
end

def zany_zip(*arr)
    #check array length for each array
    #if not the same, need to add the nil value to make their length the same

    lengths = []
    arr.each do |subs|
        lengths << subs.length
    end

    longest = lengths.max

    arr.each do |subs|
        if subs.length != longest
             (longest - subs.length).times do
                subs << nil
             end
        end
    end
    
    arr.transpose
end


def maximum(arr, &prc)
    
    arr.inject do |acc,el|
        if (prc.call(el) > prc.call(acc)) || (prc.call(el) == prc.call(acc))
            el
        else
            acc
        end     
    end

end


def my_group_by(arr, &prc)
    groups = Hash.new

    arr.each do |ele|
        groups[prc.call(ele)] = ele
    end

    #I cant hear you; sorry one second!
    #sorry let me restart my machines; gi
    ok
end