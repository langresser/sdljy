--function oldevent_408()
    instruct_1(1552,7,0);   --  1(1):[何太冲]说: 你看看这一条的注解：*”吴钩者，吴王阖庐之宝刀*也．”为什麽．． ．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_16(38,2,0) ==false then    --  16(10):队伍是否有[石破天]是则跳转到:Label0
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label0

    instruct_1(1553,38,1);   --  1(1):[石破天]说: 大哥，*我的”巨骨穴”好热．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,1,0,409,0,0,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_26(-2,4,0,0,1);   --  26(1A):增加场景事件编号的三个触发事件编号
    instruct_26(-2,5,0,0,1);   --  26(1A):增加场景事件编号的三个触发事件编号
    instruct_26(-2,6,0,0,1);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

