--function oldevent_1057()
    instruct_27(10,6420,6448);   --  27(1B):显示动画
    instruct_1(3963,0,1);   --  1(1):[AAA]说: 哇，鳄鱼！
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(89,4,0,0) ==false then    --  6(6):战斗[89]是则跳转到:Label0
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_15(0);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_3(-2,-2,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,10,0,0,0,0,0,0,0,0,0,0,0);   --  3(3):修改事件定义:当前场景:场景事件编号 [10]
    instruct_17(-2,0,33,13,358);   --  17(11):修改场景贴图:当前场景层0坐标21-D
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_2(210,10);   --  2(2):得到物品[食材][10]
--end

