--function oldevent_631()
    instruct_2(99,1);   --  2(2):得到物品[天山折梅手][1]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号

    if instruct_16(49,0,5) ==true then    --  16(10):队伍是否有[虚竹]否则跳转到:Label0
        instruct_33(49,14,0);   --  33(21):虚竹学会武功天山折梅手
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label0

--end

