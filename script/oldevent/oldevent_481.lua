--function oldevent_481()
    instruct_1(1910,121,0);   --  1(1):[???]说: 所谓德才兼备，对于我们江*湖中人来说，就是要有良好*的品德和非凡的武功。
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_28(0,75,999,0,45) ==true then    --  28(1C):判断AAA品德75-999否则跳转到:Label0

        if instruct_29(0,100,999,0,39) ==true then    --  29(1D):判断AAA武力100-999否则跳转到:Label1
            instruct_1(1911,121,0);   --  1(1):[???]说: 小伙子不错，过去吧。
            instruct_0();   --  0(0)::空语句(清屏)
            instruct_37(1);   --  37(25):增加道德1
            instruct_14();   --  14(E):场景变黑
            instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
            instruct_3(-2,11,1,0,492,0,0,7098,7098,7098,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [11]
            instruct_0();   --  0(0)::空语句(清屏)
            instruct_13();   --  13(D):重新显示场景
            do return; end
        end    --:Label1

    end    --:Label0


    if instruct_5(2,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label2
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label2


    if instruct_6(181,4,0,0) ==false then    --  6(6):战斗[181]是则跳转到:Label3
        instruct_15(0);   --  15(F):战斗失败，死亡
        do return; end
        instruct_0();   --  0(0)::空语句(清屏)
    end    --:Label3

    instruct_37(-1);   --  37(25):增加道德-1
    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,11,1,0,492,0,0,7098,7098,7098,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [11]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
--end

