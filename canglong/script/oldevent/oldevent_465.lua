--function oldevent_465()

    if instruct_16(78,2,0) ==false then    --  16(10):队伍是否有[梅超风]是则跳转到:Label0
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_14();   --  14(E):场景变黑
    instruct_13();   --  13(D):重新显示场景
    instruct_1(1746,78,1);   --  1(1):[???]说: 这里……这里是桃花岛？…*…不……我不能回来……我*不能回来……
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_21(78);   --  21(15):[梅超风]离队
    instruct_3(70,59,1,0,171,0,0,7106,7106,7106,-2,-2,-2);   --  3(3):修改事件定义:场景[小村]:场景事件编号 [59]
--end

