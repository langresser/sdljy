--function oldevent_613()
    instruct_1(2288,0,1);   --  1(1):[WWW]说: 韦小宝躲在那里，快叫他出*来．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2289,87,0);   --  1(1):[???]说: 小子你疯了，跑到我五毒教*来大吼大叫的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2290,0,1);   --  1(1):[WWW]说: 你们教主呢？是不是在跟韦*小宝相好．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2291,87,0);   --  1(1):[???]说: 疯小子，想见教主是吧，我*们就拿你去见．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(97,3,0,0) ==false then    --  6(6):战斗[97]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_3(-2,0,-2,-2,690,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [0]
    instruct_3(-2,1,-2,-2,690,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_3(-2,2,-2,-2,690,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_3(-2,3,-2,-2,690,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,4,-2,-2,690,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_17(-2,1,22,26,0);   --  17(11):修改场景贴图:当前场景层1坐标16-1A
    instruct_17(-2,1,22,25,2276);   --  17(11):修改场景贴图:当前场景层1坐标16-19
    instruct_17(-2,1,22,27,2272);   --  17(11):修改场景贴图:当前场景层1坐标16-1B
    instruct_3(-2,5,1,1,616,-1,-1,6804,6804,6804,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [5]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_56(1);   --  56(38):提高声望值1
--end

