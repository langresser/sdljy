--function oldevent_780()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2680,74,0);   --  1(1):[北丑]说: 神算子瑛姑住的黑龙潭，经*过她巧妙的布置後，常人难*以进入．*给你个提示：带某个女人去*就解决了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,1,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

