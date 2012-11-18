 
function WarSetGlobal()            --设置战斗全程变量
    WAR={};

    WAR.Data={};              --战斗信息，war.sta文件

    WAR.SelectPerson={}            --设置选择参战人  0 未选，1 选，不可取消，2 选，可取消。选择参展人菜单调用使用

    WAR.Person={};                 --战斗人物信息
    for i=0,100-1 do
        WAR.Person[i]={};
        WAR.Person[i]["人物编号"]=-1;
        WAR.Person[i]["我方"]=true;            --true 我方，false敌人
        WAR.Person[i]["坐标X"]=-1;
        WAR.Person[i]["坐标Y"]=-1;
        WAR.Person[i]["死亡"]=true;
        WAR.Person[i]["人方向"]=-1;
        WAR.Person[i]["贴图"]=-1;
        WAR.Person[i]["贴图类型"]=0;        --0 wmap中贴图，1 fight***中贴图
        WAR.Person[i]["轻功"]=0;
        WAR.Person[i]["移动步数"]=0;
        WAR.Person[i]["点数"]=0;
        WAR.Person[i]["经验"]=0;
        WAR.Person[i]["自动选择对手"]=-1;     --自动战斗中每个人选择的战斗对手
		WAR.Person[i]["Status"]=0;
		WAR.Person[i]["Move"]={};
		WAR.Person[i]["Action"]={};
		WAR.Person[i]["Time"]=0;
		WAR.Person[i]["TimeAdd"]=0;
		WAR.Person[i]["SpdAdd"]=0;
		WAR.Person[i]["Point"]=0;
		WAR.Person[i][CC.TXDH]=-1;
		WAR.Person[i]["反击武功"]=-1;
		WAR.Person[i][CC.TXWZ1]=nil;
		WAR.Person[i][CC.TXWZ2]=nil;
		WAR.Person[i][CC.TXWZ3]=nil;
   end

    WAR.PersonNum=0;               --战斗人物个数

    WAR.AutoFight=0;               --我方自动战斗参数 0 手动，1 自动。

    WAR.CurID=-1; 	--当前操作战斗人id

	WAR.SXTJ=0; 
	
	WAR.WGWL=0; 
	
	WAR.EVENT1=0;
	
    WAR.ZYHB=0
	WAR.ZYHBP=-1

    WAR.BJ=0
	
	WAR.XK=0 
	
	WAR.XK2=nil
	
	WAR.TD=-1 
	
	WAR.HTSS=0 
	
	WAR.YTFS=0 
	WAR.SQFJ=0 
	WAR.YT1=0
	WAR.YT2=0
	
	WAR.ZSF=0 
	WAR.ZSF2=0 
	
	WAR.XZZ=0 	
	
	WAR.WCY=0 
	
	WAR.MCF=0 
	
	WAR.FS=0 
	
	WAR.DYSZ=0 
	
	WAR.TFH=0  
	
	WAR.WQQ=0 
	
	WAR.ZBT=1 
	
	WAR.HQT=0 
	
	WAR.CY=0 
	
	WAR.LRZ=0 
	
	WAR.HDWZ=0 
	
	WAR.ZJZ=0 
	
	WAR.TGN=0 
	
	WAR.YJ=0 
	
	WAR.XMH=0 
	
	WAR.PYZ=0 
	
	WAR.YZB=0
	
	WAR.YZB2=0
	
	WAR.YZB3=0
	
	WAR.GBWZ=0 
	
	WAR.SSQX=0 
	
	WAR.BSMT=0 
	
	WAR.XDLZ=0 
	
	WAR.DJGZ=0 
	
	WAR.XDDF=0 
	
	WAR.XXCC=0 
	
	WAR.XDXX=0 
	
	WAR.WS=0 
	
	WAR.ACT=1
	
	WAR.ZDDH=-1 
	WAR.NO1=-1  
	
	WAR.TJAY=0 
	
	WAR.DZXY=0 
	WAR.DZXYLV={}
		
	WAR.QKNY=0 
	WAR.fthurt=0
	WAR.NYSH={}
	
	WAR.LXZQ=0
	WAR.JSYX=0
	WAR.ASKD=0
	WAR.GCTJ=0
	WAR.JSTG=0
	
	WAR.FLHS1=0 
	WAR.FLHS2=0 	
	WAR.FLHS4=0 
	WAR.FLHS5=0 
	WAR.FLHS6=0 
	
	WAR.NGJL=0 	
	WAR.NGHT=0 
	
	WAR.BMXH=0 
	
	WAR.ZYYD=0 
	
	WAR.SSFwav=0 
	WAR.LMSJwav=0 
	
	WAR.JGZ_DMZ=0 
    WAR.LHQ_BNZ=0 

	WAR.ShowHead=0;                --是否显示头像

    WAR.Effect=0;              --效果，用来确认人物头上数字的颜色
	                           --2 杀生命 , 3 杀内力, 4 医疗 ， 5 用毒 ， 6 解毒

    WAR.EffectColor={};      ---定义人物头上数字的颜色
    WAR.EffectColor[2]=RGB(236, 200, 40);
    WAR.EffectColor[3]=RGB(112, 12, 112);
    WAR.EffectColor[4]=RGB(236, 200, 40);
    WAR.EffectColor[5]=RGB(96, 176, 64)
    WAR.EffectColor[6]=RGB(104, 192, 232);
	WAR.Delay=0;
	WAR.LifeNum=0;
	WAR.EffectXY=nil            --保存武功效果产生的坐标
	WAR.EffectXYNum=0;          --坐标个数
	WAR.tmp={}
	WAR.Actup={} 
	WAR.Defup={} 
	
	WAR.KHBX=0 
	WAR.KHCM={} 
	
	WAR.LQZ={} 
	
	WAR.FXDS={} 
	WAR.FXXS={}
	WAR.LXZT={} 
	WAR.LXXS={}
	
	WAR.SZJPYX={} 
	
	WAR.TZ_DY=0 
	WAR.TZ_XZ=0 
	WAR.TZ_XZ_SSH={};
	
	WAR.BFX=0;
	WAR.BLX=0;
	
	WAR.JQSDXS={}; 
	WAR.JQSD_WMM=0;

end

function WarLoad(warid)              --加载战斗数据
    WarSetGlobal();         --初始化战斗变量
    local data=Byte.create(CC.WarDataSize);      --读取战斗数据
    Byte.loadfile(data,CC.WarFile,warid*CC.WarDataSize,CC.WarDataSize);
    LoadData(WAR.Data,CC.WarData_S,data);
	WAR.ZDDH=warid
end

function WarMain(warid,isexp)           --战斗主函数
--战斗主函数
--warid  战斗编号
--isexp  输后是否有经验 0 没经验，1 有经验
--返回  true 战斗胜利，false 失败
    lib.Debug(string.format("war start. warid=%d",warid));		
    WarLoad(warid);
    WarSelectTeam();          --选择我方
    WarSelectEnemy();         --选择敌人

    CleanMemory()
    lib.PicInit();
 	lib.ShowSlow(50,1) ;      --场景变暗

    WarLoadMap(WAR.Data["地图"]);       --加载战斗地图
	--migong()
	
	if WAR.ZDDH==42 then
	   SetS(2,24,31,1,0)
       SetS(2,30,34,1,0)
       SetS(2,27,27,1,0)
	end
	
	for i=0,63 do
		for j=0,63 do
			lib.SetWarMap(i,j,0,lib.GetS(JY.SubScene,i,j,0))
			lib.SetWarMap(i,j,1,lib.GetS(JY.SubScene,i,j,1))
		end
	end
	
	if WAR.ZDDH==238 then
	    for x=24,34 do
			for y=24,34 do
				 lib.SetWarMap(x,y,0,515*2)
			end
		end
		for y=23,35 do     
			lib.SetWarMap(23,y,1,587*2)
			lib.SetWarMap(35,y,1,587*2)
		end
		for x=24,35 do   
			lib.SetWarMap(x,35,1,587*2)
			lib.SetWarMap(x,23,1,587*2)
		end
		lib.SetWarMap(23,23,0,587*2)
		lib.SetWarMap(35,35,0,587*2)
		lib.SetWarMap(23,35,0,587*2)
		lib.SetWarMap(35,23,0,587*2)
		lib.SetWarMap(23,23,1,1480*2)
		lib.SetWarMap(35,35,1,1480*2)
		lib.SetWarMap(23,35,1,1480*2)
		lib.SetWarMap(35,23,1,1480*2)
	end
	
	if WAR.ZDDH==54 then lib.SetWarMap(11,36,1,2) end
	   	
    JY.Status=GAME_WMAP;

	--加载贴图文件
   -- lib.PicLoadFile(CC.WMAPPicFile[1],CC.WMAPPicFile[2],0);
    lib.PicLoadFile(CC.WMAPPicFile[1],CC.WMAPPicFile[2],0);
    lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	if JY.HEADXZ==1 then
	   CC.SXTFDJ={CONFIG.DataPath .. "tfdj.idx",CONFIG.DataPath .. "tfdj.grp"};
    else
	   CC.SXTFDJ={CONFIG.DataPath .. "tfdjb.idx",CONFIG.DataPath .. "tfdjb.grp"};
    end
	lib.PicLoadFile(CC.SXTFDJ[1],CC.SXTFDJ[2],91);
	lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],99,25);
    --lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],100,200);
	--lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2]);
	if CC.LoadThingPic==1 then
        lib.PicLoadFile(CC.ThingPicFile[1],CC.ThingPicFile[2],2);
	end
    lib.PicLoadFile(CC.EffectFile[1],CC.EffectFile[2],3);
    	
	if CONFIG.MP3~=1 and (WAR.ZDDH==133 or WAR.ZDDH==134) then
       WAR.Data["音乐"]=6
	end
	
	local mu=math.random(5)+49
	PlayMIDI(mu)--(WAR.Data["音乐"]);
	if WAR.ZDDH==238 then PlayMIDI(27) end
	if WAR.ZDDH==217 then PlayMIDI(55) end
	
    local first=0;            --第一次显示战斗标记
    local warStatus;          --战斗状态
	
	
			  
	WarPersonSort();    --战斗人按轻功排序
	CleanWarMap(2,-1);
	for i=0,WAR.PersonNum-1 do
		if i==0 then
			WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"]=WE_xy(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"])
		else
			WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"]=WE_xy(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],0)
		end
        SetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],2,i);
        local pid=WAR.Person[i]["人物编号"];
		lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[pid]["头像代号"]),
		                string.format(CC.FightPicFile[2],JY.Person[pid]["头像代号"]),
						4+i);
	end
	
	local function getnewmove(x)
		if x>150 then
			return 7+(x-150)/80
		elseif x>70 then
			return 5+(x-70)/40
		elseif x>30 then
			return 3+(x-30)/20
		else 
			return	x/10
		end
	end
	
	local function getnewmove1(a,b)
		local x=(a*2+b)/3
		if x>4000 then
			return 8+(x-4000)/1000
		elseif x>2400 then
			return 6+(x-2400)/800
		elseif x>1200 then
			return 4+(x-1200)/600
		elseif x>400 then
			return 2+(x-400)/400
		else 
			return	x/200
		end
	end
	
	local function getdelay(x,y)
	--[[
		if x>100 then return math.modf((x-100)/10+10+WAR.Person[0]["轻功"]/10)
		else return math.modf(x/5+WAR.Person[0]["轻功"]/10)
		end
	]]--
		return math.modf(1.5*(x/y+y-3))
	end
	
	--战斗主循环，改成半即时制，重写
	--首先随机决定各人的初始进度值
        for i=0,WAR.PersonNum-1 do
            WAR.Person[i]["贴图"]=WarCalPersonPic(i);
        end
		--WarPersonSort()

		WarSetPerson();     --设置战斗人物位置
	WAR.CurID=0
                    WarDrawMap(0);
					--DrawSMap(0)
	                lib.ShowSlow(50,0)
	for i=0,WAR.PersonNum-1 do
		WAR.Person[i]["Time"]=800-i*1000/WAR.PersonNum 
                if WAR.Person[i]["人物编号"]==35 then --立即行动
                   WAR.Person[i]["Time"]=999
                end 
                if WAR.Person[i]["人物编号"]==79 then
				   local JF=0;
				   for i=1,10 do
						 if JY.Person[79]["武功"..i]<50 and JY.Person[79]["武功"..i]>26 then
							if JY.Person[79]["武功等级"..i]==999 then
							   JF=JF+1
							end
						 end
				   end
				   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+JF*50
				   if WAR.Person[i]["Time"]>990 then WAR.Person[i]["Time"]=990 end
				end				
				if WAR.Person[i]["人物编号"]==97 then WAR.Person[i]["Time"]=900 end
                if JY.Person[WAR.Person[i]["人物编号"]]["性别"]==2 then WAR.Person[i]["Time"]=-200 end
				if WAR.Person[i]["人物编号"]==36 then WAR.Person[i]["Time"]=700 end
				if WAR.Person[i]["人物编号"]==445 and WAR.ZDDH==226 then WAR.Person[i]["Time"]=999 end
				if WAR.Person[i]["人物编号"]==446 and WAR.ZDDH==226 then WAR.Person[i]["Time"]=900 end
				local id=WAR.Person[i]["人物编号"];
				if PersonKF(id,93) then 
				   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+200+math.random(100)
		           if WAR.Person[i]["Time"]>990 then WAR.Person[i]["Time"]=990 end
				end
		WAR.Person[i]["移动步数"]=math.modf(getnewmove(WAR.Person[i]["轻功"])-JY.Person[id]["中毒程度"]/30-JY.Person[id]["受伤程度"]/30+JY.Person[id]["体力"]/30-3);
		if WAR.Person[i]["移动步数"]<1 then WAR.Person[i]["移动步数"]=1 end
	end
	JY.Person[445]["姓名"]=CC.WARS1
	JY.Person[446]["姓名"]=CC.WARS1
	if WAR.ZDDH==226 then
	   JY.Person[445]["姓名"]=CC.WARS2
	   JY.Person[446]["姓名"]=CC.WARS3
	end
   
	for a=0,WAR.PersonNum-1 do 
	    for s=1,4 do
		        if JY.Person[WAR.Person[a]["人物编号"]]["携带物品数量" .. s]<1 then
			       JY.Person[WAR.Person[a]["人物编号"]]["携带物品" .. s]=-1
				end
		end
	end
	
	
    if WAR.ZDDH==14 then 
	   say(CC.s42,173,0) 
	   say(CC.s43,174,1) 
	   say(CC.s44,175,5)	   
	end 
	
	for a=0,WAR.PersonNum-1 do 
	    if WAR.Person[a]["人物编号"]==92 and WAR.Person[a]["我方"]==true then 
		    WAR.LRZ=1 
			break;
		end
	end
	
	for i=1,10 do    
		JY.Wugong[80]["移动范围"..i]=3
		JY.Wugong[80]["杀伤范围"..i]=2
		JY.Wugong[113]["移动范围"..i]=4
		JY.Wugong[113]["杀伤范围"..i]=0
	end	
	JY.Wugong[80]["攻击范围"]=0	 
	JY.Wugong[113]["攻击范围"]=3
	
	if WAR.ZDDH==237 then  
	   for a=0,WAR.PersonNum-1 do 
			if WAR.Person[a]["我方"]==true then 
				WAR.Person[a]["Time"]=0
			end
	   end
	end
	
	if WAR.ZDDH==238 then
	    for i=80,120 do
                if i==80 then WaitKey() end		
		        NewDrawString(-1,-1,CC.EVB200,C_GOLD,i)						
				ShowScreen();
						if i==120 then
						    Cls();							
							NewDrawString(-1,-1,CC.EVB200,C_GOLD,i)
							ShowScreen();
							lib.Delay(500);
							--WaitKey();
						else
							lib.Delay(1);
						end						
		end
	end
	
	warStatus=0;
	buzhen()
	WAR.Delay=GetJiqi()
	local startt,endt=lib.GetTime()
	while true do
		--首先根据人物数目，决定时间槽的显示程度，以及延时长度，这里暂不完成
		--然后根据玩家属性，获取每次循环增加的时间值，这里暂且设为10
		--wardelay=getdelay(least)--+10
		--lib.Delay(wardelay)
		WarDrawMap(0);
		--DrawSMap(0)
		--开始绘制进度条及相关
		WAR.ShowHead=0;
		DrawTimeBar();
		--warStatus=WAR_CALLEVENT(warid);
		--if warStatus~=0 then break end					--战场事件入口
		lib.GetKey()
		ShowScreen()
		
		if WAR.ZYHB==1 then 
		   WAR.ZYHB=2
		end
		if WAR.ZDDH==83 then JY.Person[50]["武功1"]=13 end	
		local reget=false
		for p=0,WAR.PersonNum-1 do
			if WAR.Person[p]["死亡"]==false then
				if WAR.Person[p]["Time"]>1000 then 
					WarDrawMap(0);
					ShowScreen();
					local surid=lib.SaveSur(CC.ScreenW-80,0,CC.ScreenW,200);
					
					lib.Delay(10)
					local keypress=lib.GetKey();
					if WAR.AutoFight==1 then                 --我方自动战斗时读取键盘，看是否取消
						if keypress==VK_SPACE or keypress==VK_RETURN then
							WAR.AutoFight=0;
						end
					end
					
					lib.FreeSur(surid)
					reget=true
					local id=WAR.Person[p]["人物编号"];
                                     if WAR.ZYHB==2 then 
                                        WAR.Person[p]["移动步数"]=0
                                     else
					WAR.Person[p]["移动步数"]=math.modf(getnewmove(WAR.Person[p]["轻功"])-JY.Person[id]["中毒程度"]/50-JY.Person[id]["受伤程度"]/60+JY.Person[id]["体力"]/70-1);
					
					for j=0,WAR.PersonNum-1 do
				        if WAR.Person[j]["人物编号"]==66 then
						    if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[p]["我方"] then                            			   			                   
				                WAR.Person[p]["移动步数"]=WAR.Person[p]["移动步数"]-3
								break
						    end
						end
					end
					
					if WAR.Person[p]["移动步数"]<1 then WAR.Person[p]["移动步数"]=1 end					
					if id==35 or id==6 or id==97 then WAR.Person[p]["移动步数"]=WAR.Person[p]["移动步数"]+3 end
					if id==5 and WAR.Person[p]["移动步数"]<8 then WAR.Person[p]["移动步数"]=8 end
					if WAR.Person[p]["移动步数"]>10 then WAR.Person[p]["移动步数"]=10 end
                            
									 end
					WAR.ShowHead=0
					WarDrawMap(0);		
					WAR.Effect=0;
					WAR.CurID=p;
					WAR.Person[p]["TimeAdd"]=0;
					local r;
                                       
					local pid=WAR.Person[WAR.CurID]["人物编号"]
					WAR.Defup[pid]=nil
					if pid==53 then WAR.TZ_DY=0 end
					--if WAR.Person[p]["我方"]==true then
					if instruct_16(pid) and WAR.Person[p]["我方"] and WAR.tmp[1000+pid]~=1 then
						if WAR.AutoFight==0 then
							r=War_Manual();                  --手动战斗
						else
							r=War_Auto();                  --自动战斗
						end
					else
						r=War_Auto(); 						--自动战斗
						
					end		
					
         if WAR.ZYHB==1 then
              for j=0,WAR.PersonNum-1 do	     
			      WAR.Person[j]["Time"]=WAR.Person[j]["Time"]-15
				  if WAR.Person[j]["Time"]>990 then WAR.Person[j]["Time"]=990 end
		      end
            WAR.Person[p]["Time"]=1005
			WAR.ZYYD=WAR.Person[p]["移动步数"]
			WAR.ZYHBP=p
			
			if WAR.XDXX>0 then 
			    DrawStrBox(-1,-1,CC.WARS4..WAR.XDXX,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
				 lib.Delay(500);
				 Cls();
				 ShowScreen();
				 WAR.XDXX=0 
			end
			
			WAR.QKNY=0
			
			if JY.Person[129]["生命"]<=0 and WAR.WCY<1 then JY.Person[129]["生命"]=1 end
			if JY.Person[65]["生命"]<=0 and WAR.WCY<1 then JY.Person[65]["生命"]=1 end
			   			
			if WAR.ZDDH==128 then
			    for i=0,WAR.PersonNum-1 do
			        if WAR.Person[i]["人物编号"]==553 and JY.Person[553]["生命"]<=0 then 
					    WAR.YZB=1 
						WAR.FXDS[553]=nil
						WAR.LXZT[553]=nil
						break;
					end
				end
			end		
			                        if WAR.YZB==1 then
									   if WAR.YZB2<3 then
										   WAR.YZB=0
										   WAR.YZB2=WAR.YZB2+1
										   say(CC.WARS5,553)
										   JY.Person[553]["生命最大值"]=JY.Person[553]["生命最大值"]+100
										   JY.Person[553]["内力最大值"]=JY.Person[553]["内力最大值"]+1000
										   JY.Person[553]["生命"]=JY.Person[553]["生命最大值"]
										   JY.Person[553]["内力"]=JY.Person[553]["内力最大值"]
										   JY.Person[553]["中毒程度"]=0
										   JY.Person[553]["受伤程度"]=0
										   JY.Person[553]["体力"]=100
	                                       JY.Person[553]["攻击力"]=JY.Person[553]["攻击力"]+100
										   JY.Person[553]["防御力"]=JY.Person[553]["防御力"]+100
										   JY.Person[553]["轻功"]=JY.Person[553]["轻功"]+80
										   JY.Person[553]["武功1"]=66
										   JY.Person[553]["武功等级1"]=999
										   for j=0,WAR.PersonNum-1 do
	                                            if WAR.Person[j]["人物编号"]==553 then
												   WAR.Person[j]["Time"]=980
												end
										   end
										else
										    if WAR.YZB3==0 then
											   say(CC.WARS6,553)
											   say(CC.WARS7)
											   say(CC.WARS8)
											   WAR.YZB3=1
											end
										end
								    end		
										
										
										if WAR.YJ>0 then
											instruct_2(174,WAR.YJ) 
											WAR.YJ=0
										end
		 
		 else
		    if WAR.ZYHB==2 then           
            WAR.ZYHB=0			
            end
	        WAR.Person[p]["Time"]=WAR.Person[p]["Time"]-1000;  --左右
			if WAR.Person[p]["Time"]<-500 then WAR.Person[p]["Time"]=-500 end
			
		 if WAR.XDXX>0 then 
			    DrawStrBox(-1,-1,CC.WARS4..WAR.XDXX,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
				 lib.Delay(500);
				 Cls();
				 ShowScreen();
				 WAR.XDXX=0 
		 end	
			
         for i=1,10 do  
             if JY.Person[pid]["武功"..i]==96 and JY.Person[pid]["生命"]>0 then
				 local LK             
				 LK=math.modf((JY.Person[pid]["生命最大值"]-JY.Person[pid]["生命"])*JY.Person[pid]["武功等级"..i]/100*0.015)
				 JY.Person[pid]["生命"]=JY.Person[pid]["生命"]+LK
				 DrawStrBox(-1,-1,CC.WARS9..LK,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
				 lib.Delay(400);
				 Cls();
				 ShowScreen();
				 break
             end
         end   
        
          for i=1,10 do  
             if JY.Person[pid]["武功"..i]==89 then
             local NK            
             NK=math.modf((JY.Person[pid]["内力最大值"]-JY.Person[pid]["内力"])*JY.Person[pid]["武功等级"..i]/100*0.015)
			 JY.Person[pid]["内力"]=JY.Person[pid]["内力"]+NK
             DrawStrBox(-1,-1,CC.WARS10..NK,C_ORANGE,CC.DefaultFont)
             ShowScreen();
             lib.Delay(400);
             Cls();
             ShowScreen();
			 break
             end
          end 

		  for i=1,10 do  
             if JY.Person[pid]["武功"..i]==90 then
				 local TK;
				 local ZD=0;
				 TK=6
				 JY.Person[pid]["体力"]=JY.Person[pid]["体力"]+TK
					if JY.Person[pid]["体力"]>100 then
					   JY.Person[pid]["体力"]=100
					end           
				 DrawStrBox(-1,-1,CC.WARS11..TK,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
				 lib.Delay(300);
				 Cls();
				 ShowScreen();
				 
				 
			     break
             end
          end 
		  
		  
			  			    			 			 			 
                                        for i=1,10 do
                                            if JY.Person[id]["武功"..i]==47 then --判定九剑
                                               WAR.Person[p]["Time"]=WAR.Person[p]["Time"]+200
                                               break;
                                            end
                                        end
										if WAR.XZZ==1 then
										   WAR.XZZ=0										   
										   WAR.Person[p]["Time"]=WAR.Person[p]["Time"]+200
										end
										if WAR.ZSF==1 then										     
										   WAR.Person[p]["Time"]=WAR.Person[p]["Time"]+500
										   WAR.ZSF=0
										end
										if id==81 and WAR.ZJZ==0 and math.random(25)==13 then  
										   instruct_2(210,1) 
										   WAR.ZJZ=1
										end
									
									if JY.Person[129]["生命"]<=0 and WAR.WCY<1 then JY.Person[129]["生命"]=1 end
			                        if JY.Person[65]["生命"]<=0 and WAR.WCY<1 then JY.Person[65]["生命"]=1 end
			   
									if WAR.ZDDH==128 then
										for i=0,WAR.PersonNum-1 do
											if WAR.Person[i]["人物编号"]==553 and JY.Person[553]["生命"]<=0 then 
												WAR.YZB=1 
												WAR.FXDS[553]=nil
												WAR.LXZT[553]=nil
												break;
											end
										end
									end		
										
								    if WAR.YZB==1 then
									   if WAR.YZB2<3 then
										   WAR.YZB=0
										   WAR.YZB2=WAR.YZB2+1
										   say(CC.WARS5,553)
										   JY.Person[553]["生命最大值"]=JY.Person[553]["生命最大值"]+100
										   JY.Person[553]["内力最大值"]=JY.Person[553]["内力最大值"]+1000
										   
										   JY.Person[553]["生命"]=JY.Person[553]["生命最大值"]
										   JY.Person[553]["内力"]=JY.Person[553]["内力最大值"]
										   JY.Person[553]["中毒程度"]=0
										   JY.Person[553]["受伤程度"]=0
										   JY.Person[553]["体力"]=100
	                                       JY.Person[553]["攻击力"]=JY.Person[553]["攻击力"]+100
										   JY.Person[553]["防御力"]=JY.Person[553]["防御力"]+100
										   JY.Person[553]["轻功"]=JY.Person[553]["轻功"]+80
										   JY.Person[553]["武功1"]=66
										   JY.Person[553]["武功等级1"]=999
                                            for j=0,WAR.PersonNum-1 do
	                                            if WAR.Person[j]["人物编号"]==553 then
												   WAR.Person[j]["Time"]=990
												end
										   end
										else
										    if WAR.YZB3==1 then
											   say(CC.WARS6,553)
											   say(CC.WARS7)
											   say(CC.WARS8)
											   WAR.YZB3=1
											end
										end
									end	
										
								        if WAR.FLHS1==1 then
										   if id==0 then WAR.Person[p]["Time"]=WAR.Person[p]["Time"]+500 end
										   WAR.FLHS1=0
										end
								
										if id==97 then WAR.XDLZ=WAR.XDLZ+5 end
										
										if WAR.YJ>0 then
											instruct_2(174,WAR.YJ) 
											WAR.YJ=0
										end
										
										if WAR.KHCM[pid]==1 then 
										   WAR.KHCM[pid]=0
										    Cls();
											DrawStrBox(-1,-1,CC.WARS12,C_ORANGE,CC.DefaultFont)											 
											 ShowScreen();
											 lib.Delay(500);
									    end
										
										if WAR.Actup[id]~=nil then
										   WAR.Actup[id]=WAR.Actup[id]-1
										   if WAR.Actup[id]==0 then WAR.Actup[id]=nil end
										end
									
										if id==54 then JY.Person[id]["受伤程度"]=0 end
										
										 JY.Wugong[13]["名称"]=CC.WARS13 	
										
										if id==64 then WAR.ZBT=WAR.ZBT+1 end
									
										if WAR.TGN==1 then
										   say(CC.WARS14,72)
										    JY.Person[72]["攻击力"]=JY.Person[72]["攻击力"]+20
											JY.Person[72]["防御力"]=JY.Person[72]["防御力"]+20
											JY.Person[72]["轻功"]=JY.Person[72]["轻功"]+20
											JY.Person[72]["武功1"]=44
											JY.Person[72]["武功等级1"]=50
										    DrawStrBox(-1,-1,CC.WARS15,C_ORANGE,CC.DefaultFont)
											 ShowScreen();
											 lib.Delay(2000);											
											WAR.TGN=0
									    end
									
										WAR.QKNY=0
										if WAR.LQZ[id]==100 then WAR.LQZ[id]=0 end
									    --WAR.DZXY=0
									
										if WAR.XK==1 then
											  for j=0,WAR.PersonNum-1 do
												   if WAR.Person[j]["人物编号"]==58 and JY.Person[WAR.Person[j]["人物编号"]]["生命"]>0 and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then
												       WAR.Person[j]["Time"]=980
													   say(CC.WARS16,58)
												       WAR.XK=2
													   break
												  end
											  end
										end
				                     
									 
									    if WAR.FLHS5==1 then
                                            local z=WAR.CurID										
											for j=0,WAR.PersonNum-1 do
												  if WAR.Person[j]["人物编号"]==0 and JY.Person[0]["生命"]>0 then													 
													 WAR.FLHS5=0
													 WAR.CurID=j
													 break
												  end
											end
											
											if WAR.FLHS5==0 and WAR.AutoFight==0 and WAR.tmp[1000+0]~=1 then
												WAR.Person[WAR.CurID]["移动步数"]=6
												War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["移动步数"],0);
												local x,y
												while true do
													x,y=War_SelectMove()
													if x ~=nil then
														WAR.ShowHead=0
														War_MovePerson(x,y);
														break;
													end
												end
										    end
											WAR.FLHS5=0
											WAR.CurID=z
										end
				
				                        if (WAR.Person[p]["移动步数"]>0 or WAR.ZYYD>0)  and WAR.Person[p]["我方"]==true and inteam(WAR.Person[p]["人物编号"]) and WAR.AutoFight==0 and WAR.tmp[1000+id]~=1 then
										    if PersonKF(WAR.Person[p]["人物编号"],93) and JY.Person[WAR.Person[p]["人物编号"]]["生命"]>0 then
				                              if WAR.ZYYD>0 then
											   WAR.Person[p]["移动步数"]=WAR.ZYYD
											   War_CalMoveStep(p,WAR.ZYYD,0);
											   WAR.ZYYD=0
											  else
											   War_CalMoveStep(p,WAR.Person[p]["移动步数"],0);
											  end
												local x,y
												while true do
													x,y=War_SelectMove()
													if x ~=nil then
														WAR.ShowHead=0
														War_MovePerson(x,y);
														break;
													end
												end
											end
										end
										
										if WAR.ZDDH==7 then
										    for x=0,WAR.PersonNum-1 do
										        if WAR.Person[x]["人物编号"]==97 and JY.Person[97]["生命"]<=0 then
												    for xx=0,WAR.PersonNum-1 do
												        if WAR.Person[xx]["人物编号"]~=97 then
														   WAR.Person[xx]["我方"]=true
														end
													end
													break
											    end
											end
										end
										
										if WAR.ZDDH==176 and JY.Person[0]["品德"]>80 and WAR.EVENT1==0 and WAR.SXTJ>300 then
										    for i=32,40 do
											     if GetWarMap(i,32,2)<0 then
												   
													NewWARPersonZJ(69,true,i,33,false,1)
													WAR.EVENT1=1													
													local s;
													s=WAR.CurID
													WAR.CurID=WAR.PersonNum-1
													
													say(CC.say1,69)
													WAR.CurID=s													
													break;
											     end
										    end
										end
										
										if WAR.ZDDH==54 and WAR.EVENT1==0 then
										    for i=0,WAR.PersonNum-1 do
										        if WAR.Person[i]["人物编号"]==73 and WAR.Person[i]["我方"]==true then
												    if JY.Person[WAR.Person[i]["人物编号"]]["生命"]<=0 then
												        for r=31,42 do
													        if GetWarMap(r,27,2)<0 then
														       
																NewWARPersonZJ(26,true,r,27,false,2)
																WAR.Person[WAR.PersonNum-1]["Time"]=900
																WAR.EVENT1=1													
																local s;
																s=WAR.CurID
																WAR.CurID=WAR.PersonNum-1
																
																say(CC.s22,26)
																WAR.CurID=s
																
																break;
															end
										                end
													end
												end	
												if WAR.EVENT1==1 then break end		
											end			
										end
										
										
										
										if WAR.Person[p]["Time"]>500 then WAR.Person[p]["Time"]=500 end
										
										local pz=math.modf(JY.Person[0]["资质"]/5)
										if id==0 and GetS(4,5,5,5)==7 and JY.Person[0]["体力"]>50 then
										    if WAR.HTSS==0 and GetS(10,0,7,0)==1 and JLSD(25,50+pz,0) and JY.Person[0]["武功10"]>0  then											       
												CurIDTXDH(WAR.CurID,1170,1185)							
												Cls();
												if JY.HEADXZ==1 then
													lib.PicLoadCache(91,6*2,270,-1,1);   
												else
													lib.PicLoadCache(91,6*2,48,1,1); 
												end														                                
														   ShowScreen();
														   lib.Delay(40)
											   for i=12,24 do
														NewDrawString(-1,-1,ZJTF[7]..TFSSJ[7],C_GOLD,25+i)
														ShowScreen();
																if i==24 then
																	Cls();							
																	NewDrawString(-1,-1,ZJTF[7]..TFSSJ[7],C_GOLD,25+i)
																	ShowScreen();
																	lib.Delay(500);
																else
																	lib.Delay(1);
																end						
												end
										        for j=0,WAR.PersonNum-1 do	     
													  WAR.Person[j]["Time"]=WAR.Person[j]["Time"]-10
													  if WAR.Person[j]["Time"]>995 then WAR.Person[j]["Time"]=995 end
												end
												WAR.Person[WAR.CurID]["Time"]=1005
												JY.Person[0]["体力"]=JY.Person[0]["体力"]-10
												if JLSD(45,50,0) then
												    WAR.HTSS=0
											    else
												    WAR.HTSS=1
												end
											else
											    WAR.HTSS=0
											end
										end
										
										

										if WAR.ZDDH==237 and WAR.SXTJ>100 then
										   for i=0,WAR.PersonNum-1 do
												if WAR.Person[i]["我方"]==false then
													WAR.Person[i]["死亡"]=true
												end
										    end
											say(CC.s48,18)
										end
										
										if WAR.ZDDH==238 then
										    local life=0;
										    for i=0,WAR.PersonNum-1 do
												if WAR.Person[i]["死亡"]==false then
												    if JY.Person[WAR.Person[i]["人物编号"]]["生命"]>0 then
													   life=life+1
													   WAR.NO1=WAR.Person[i]["人物编号"]
													end
												end
										    end
											
										    if life>1 then
											    local m,n=0,0;
											    while m<1 or n<1 do
												    m=0;
													n=0;
												    for i=0,WAR.PersonNum-1 do
														if WAR.Person[i]["死亡"]==false and JY.Person[WAR.Person[i]["人物编号"]]["生命"]>0 then
															if WAR.Person[i]["人物编号"]==0 then
																WAR.Person[i]["我方"]=true
																m=m+1
															else
																if math.random(2)==1 then
																   WAR.Person[i]["我方"]=true
																   m=m+1
																else
																   WAR.Person[i]["我方"]=false
																   n=n+1
																end
															end
														end
												    end
												end
											end
										end
														 
										
										
				
				end
				
				
					warStatus=War_isEnd();        --战斗是否结束？   0继续，1赢，2输	
					if warStatus>0 then
						break;
					end
				end
			end
		end
		if warStatus>0 then
			break;
		end
		WarPersonSort(1);
			WAR.Delay=GetJiqi()
			startt=lib.GetTime()
		collectgarbage("step",0);
	end

    local r;

	WAR.ShowHead=0;
	
	if WAR.ZDDH==238 then
	    PlayMIDI(100)
		PlayWavAtk(41)
	    DrawStrBoxWaitKey(CC.EVB102,C_WHITE,CC.DefaultFont);
		DrawStrBoxWaitKey(CC.EVB103..JY.Person[WAR.NO1]["姓名"],C_RED,CC.DefaultFont);
	    if WAR.NO1==0 then
		   r=true; 
        else
           r=false;
        end		   
	elseif warStatus==1 then--[[
		local str="战斗胜利"
		for i=0,240 do
			Cls()
			DrawString(i,240,str,C_ORANGE,36)
			DrawBox(640-i*2,270,840-i*2,270,C_WHITE)
			lib.ShowSurface(0)
		end--]]
		PlayMIDI(100)
		PlayWavAtk(41)  
        DrawStrBoxWaitKey(CC.EVB82,C_WHITE,CC.DefaultFont);
		if WAR.ZDDH==76 then
		   DrawStrBoxWaitKey(CC.EVB84,C_GOLD,CC.DefaultFont);
		   instruct_32(14,2) 
		elseif WAR.ZDDH==80 then
		   DrawStrBoxWaitKey(CC.EVB85,C_GOLD,CC.DefaultFont);
		   AddPersonAttrib(0,"拳掌功夫",10);
		   AddPersonAttrib(0,"御剑能力",10);
		   AddPersonAttrib(0,"耍刀技巧",10);
		   AddPersonAttrib(0,"特殊兵器",10);
		elseif WAR.ZDDH==100 then
		   DrawStrBoxWaitKey(CC.EVB86,C_GOLD,CC.DefaultFont);
		   instruct_32(8,2) 
		elseif WAR.ZDDH==172 then
		   DrawStrBoxWaitKey(CC.EVB87,C_GOLD,CC.DefaultFont);
		   instruct_32(73,1) 
		elseif WAR.ZDDH==173 then
		   DrawStrBoxWaitKey(CC.EVB88,C_GOLD,CC.DefaultFont);
		   instruct_32(17,2) 
		elseif WAR.ZDDH==188 then
		   DrawStrBoxWaitKey(CC.EVB89,C_GOLD,CC.DefaultFont);
		   AddPersonAttrib(0,"拳掌功夫",10);     
		elseif WAR.ZDDH==211 then
		   DrawStrBoxWaitKey(CC.EVB90,C_GOLD,CC.DefaultFont);
		   AddPersonAttrib(0,"防御力",10); 
		   AddPersonAttrib(0,"轻功",10); 
		elseif WAR.ZDDH==86 then
		    instruct_2(66,1)
        end		   
		
        r=true;
    elseif warStatus==2 then--[[
		local str="战斗失败"
		lib.SetClip(0,240,640,280)
		for i=0,240,2 do
			Cls()
			DrawString(i,240,str,C_ORANGE,36)
			DrawBox_1(640-i*2,276,900-i*2,280,C_WHITE)
			lib.ShowSurface(0)
		end]]--
        DrawStrBoxWaitKey(CC.EVB83,C_WHITE,CC.DefaultFont);
        r=false;
    end

    War_EndPersonData(isexp,warStatus);    --战斗后设置人物参数

    lib.ShowSlow(50,1);

    if JY.Scene[JY.SubScene]["进门音乐"]>=0 then
        PlayMIDI(JY.Scene[JY.SubScene]["进门音乐"]);
    else
        PlayMIDI(0);
    end

    CleanMemory();
    lib.PicInit();
    lib.PicLoadFile(CC.SMAPPicFile[1],CC.SMAPPicFile[2],0);
    lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],1);
	--lib.PicLoadFile(CC.HeadPicFile[1],CC.HeadPicFile[2],100,200);
	if CC.LoadThingPic==1 then
        lib.PicLoadFile(CC.ThingPicFile[1],CC.ThingPicFile[2],2);
	end
	
	JY.Status=GAME_SMAP;

    return r;
end


function War_MoveMenu()           --执行移动菜单 返回1：已经移动    0 没有移动
  if WAR.Person[WAR.CurID]["人物编号"]~=-1 then
    WAR.ShowHead=0;   --不显示头像
    if WAR.Person[WAR.CurID]["移动步数"]<=0 then
        return 0;
    end

    War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["移动步数"],0);   --计算移动步数

    local r;
    local x,y=War_SelectMove()             --选择移动位置
    if x ~=nil then            --空值表示没有选择，esc返回了，非空则表示选择了位置
        War_MovePerson(x,y,1);    --移动到相应的位置
        r=1;
	else
	    r=0
		WAR.ShowHead=1;
		Cls();
    end
    lib.GetKey();
    return r;
  else  
    local ydd={};
	local n=1;
    for i=0,WAR.PersonNum-1 do
	     if WAR.Person[i]["我方"]~=WAR.Person[WAR.CurID]["我方"] and WAR.Person[i]["死亡"]==false then
            ydd[n]=i
			n=n+1
		 end
	end
	while true do --DFSY
	    local dx=ydd[math.random(n-1)];
		local DX=WAR.Person[dx]["坐标X"]
		local DY=WAR.Person[dx]["坐标Y"]
		local YDX={DX+1,DX-1,DX};
		local YDY={DY+1,DY-1,DY};
		local ZX=YDX[math.random(3)]
		local ZY=YDY[math.random(3)]
        if SceneCanPass(ZX,ZY) and GetWarMap(ZX,ZY,2)<0 then
		    SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1);
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1);
			WAR.Person[WAR.CurID]["坐标X"]=ZX
			WAR.Person[WAR.CurID]["坐标Y"]=ZY						
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID);
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,WAR.Person[WAR.CurID]["贴图"]);
            break;
		end
	end
	return 1;
  end	 		 
end

function War_CanMoveXY(x,y,flag)  --坐标是否可以通过，判断移动时使用
	if GetWarMap(x,y,1)>0 then    --第1层有物体
		return false
	end
	if flag==0 then
		if CC.WarWater[GetWarMap(x,y,0)]~=nil then          --水面，不可走
			return false
		end
		if GetWarMap(x,y,2)>=0 then    --有人
			return false
		end
	end
	return true;
end

function War_SelectMove()              ---选择移动位置
    local x0=WAR.Person[WAR.CurID]["坐标X"];
    local y0=WAR.Person[WAR.CurID]["坐标Y"];
    local x=x0;
    local y=y0;

    while true do
        local x2=x;
        local y2=y;

        WarDrawMap(1,x,y);
		WarShowHead(GetWarMap(x,y,2))
        ShowScreen();
        local key=WaitKey(1);
        if key==VK_UP then
            y2=y-1;
        elseif key==VK_DOWN then
            y2=y+1;
        elseif key==VK_LEFT then
            x2=x-1;
        elseif key==VK_RIGHT then
            x2=x+1;
        elseif key==VK_SPACE or key==VK_RETURN then
            return x,y;
        elseif key==VK_ESCAPE then
            return nil;
		elseif key>999999 then
			local kind,mx,my
			if key>1999999 then
				kind=1
				key=key-2000000
			else
				kind=0
				key=key-1000000
			end
			mx=math.modf(key/1000)
			my=math.fmod(key,1000)
			mx=mx-CC.ScreenW/2
			my=my-CC.ScreenH/2
			mx=mx/CC.XScale
			my=my/CC.YScale
			mx,my=(mx+my)/2,(my-mx)/2
			if mx>0 then mx=mx+0.99 else mx=mx-0.01 end
			if my>0 then my=my+0.99 else mx=mx-0.01 end
			mx=math.modf(mx)
			my=math.modf(my)
			for i=0,10 do
				if mx+i >63 or my+i>63 then
					break
				end
				local hb=GetS(JY.SubScene,x0+mx+i,y0+my+i,4);
				if CONFIG.Zoom==1 then
					hb=hb*2;
				end
				if math.abs(hb-CC.YScale*i*2)<5 then
					mx=mx+i
					my=my+i
					break
				end
			end
			x2,y2=mx+x0,my+y0
			if kind==1 then
				return x,y
			end
        end

		if GetWarMap(x2,y2,3)<128 then
            x=x2;
            y=y2;
        end
    end

end

function War_MovePerson(x,y,flag)            --移动人物到位置x,y
    local x1=x
    local y1=y
	flag=flag or 0;
    local movenum=GetWarMap(x,y,3);

    local movetable={};  --   记录每步移动
    for i=movenum,1,-1 do    --从目的位置反着找到初始位置，作为移动的次序
        movetable[i]={};
        movetable[i].x=x;
        movetable[i].y=y;
        if GetWarMap(x-1,y,3)==i-1 then
            x=x-1;
            movetable[i].direct=1;
        elseif GetWarMap(x+1,y,3)==i-1 then
            x=x+1;
            movetable[i].direct=2;
        elseif GetWarMap(x,y-1,3)==i-1 then
            y=y-1;
            movetable[i].direct=3;
        elseif GetWarMap(x,y+1,3)==i-1 then
            y=y+1;
            movetable[i].direct=0;
        end
    end
	movetable.num=movenum;
	movetable.now=0;
	WAR.Person[WAR.CurID]["Move"]=movetable;
	if movenum>WAR.Person[WAR.CurID]["移动步数"] then
		movenum=WAR.Person[WAR.CurID]["移动步数"]
		WAR.Person[WAR.CurID]["移动步数"]=0
	else
		WAR.Person[WAR.CurID]["移动步数"]=WAR.Person[WAR.CurID]["移动步数"]-movenum;    --可移动步数减小
	end
	
	--[[if flag==1 then
		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1);
		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1);

        WAR.Person[WAR.CurID]["坐标X"]=movetable[movenum].x;
        WAR.Person[WAR.CurID]["坐标Y"]=movetable[movenum].y;
        WAR.Person[WAR.CurID]["人方向"]=movetable[movenum].direct;
        WAR.Person[WAR.CurID]["贴图"]=WarCalPersonPic(WAR.CurID);

		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID);
		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,WAR.Person[WAR.CurID]["贴图"]);
	end]]--
	
    for i=1,movenum do
        local t1=lib.GetTime();

		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1);
		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1);

        WAR.Person[WAR.CurID]["坐标X"]=movetable[i].x;
        WAR.Person[WAR.CurID]["坐标Y"]=movetable[i].y;
        WAR.Person[WAR.CurID]["人方向"]=movetable[i].direct;
        WAR.Person[WAR.CurID]["贴图"]=WarCalPersonPic(WAR.CurID);

		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID);
		SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,WAR.Person[WAR.CurID]["贴图"]);

		WarDrawMap(0);
		ShowScreen();
        local t2=lib.GetTime();
		if i<movenum then
			if (t2-t1)< 2*CC.Frame then
				lib.Delay(2*CC.Frame-(t2-t1));
			end
		end
    end
	
	--[[SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1);
	SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1);
	WAR.Person[WAR.CurID]["坐标X"]=x1
    WAR.Person[WAR.CurID]["坐标Y"]=y1
	SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID);
	SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,WAR.Person[WAR.CurID]["贴图"]);
    ]]--
	
end

function War_CalMoveStep(id,stepmax,flag) --显示移动范围
--重写移动函数，主要是加入zoc，即当附近有敌人时，移动力额外减1	
--计算可移动步数
--id 战斗人id，
--stepmax 最大步数，
--flag=0  移动，物品不能绕过，1 武功，用毒医疗等，不考虑挡路。 	
	
	CleanWarMap(3,255);           --第三层坐标用来设置移动，先都设为255，

    local x=WAR.Person[id]["坐标X"];
    local y=WAR.Person[id]["坐标Y"];

	local steparray={};     --用数组保存第n步的坐标。
	for i=0,stepmax do
	    steparray[i]={};
		steparray[i].bushu={};
        steparray[i].x={};
        steparray[i].y={};
	end

	SetWarMap(x,y,3,0);
    steparray[0].num=1;
	steparray[0].bushu[1]=stepmax;					--还能移动的步数
	steparray[0].x[1]=x;
	steparray[0].y[1]=y;
	War_FindNextStep(steparray,0,flag,id);

	return steparray;

end

function War_FindNextStep(steparray,step,flag,id)      --设置下一步可移动的坐标
 --被上面的函数调用   
	local num=0;
	local step1=step+1;
	local function fujinnum(tx,ty)
		if flag~=0 or id==nil then return 0 end
		local tnum=0
		local wofang=WAR.Person[id]["我方"]
		local tv;
		tv=GetWarMap(tx+1,ty,2);
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=9999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['人物编号']]['等级']/10)
			end
		end
		tv=GetWarMap(tx-1,ty,2);
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['人物编号']]['等级']/10)
			end
		end
		tv=GetWarMap(tx,ty+1,2);
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['人物编号']]['等级']/10)
			end
		end
		tv=GetWarMap(tx,ty-1,2);
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['人物编号']]['等级']/10)
			end
		end
		return tnum
	end
	
	
	--lib.Debug('step'..step)
	for i=1,steparray[step].num do
		if steparray[step].bushu[i]>0 then
		steparray[step].bushu[i]=steparray[step].bushu[i]-1;
	    local x=steparray[step].x[i];
	    local y=steparray[step].y[i];
		--lib.Debug(x)
		--lib.Debug(y)
	    if x+1<CC.WarWidth-1 then                        --当前步数的相邻格
		    local v=GetWarMap(x+1,y,3);
			if v ==255 and War_CanMoveXY(x+1,y,flag)==true then
                num= num+1;
                steparray[step1].x[num]=x+1;
                steparray[step1].y[num]=y;
				SetWarMap(x+1,y,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x+1,y);
			end
		end

	    if x-1>0 then                        --当前步数的相邻格
		    local v=GetWarMap(x-1,y,3);
			if v ==255 and War_CanMoveXY(x-1,y,flag)==true then
                 num=num+1;
                steparray[step1].x[num]=x-1;
                steparray[step1].y[num]=y;
				SetWarMap(x-1,y,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x-1,y);
			end
		end

	    if y+1<CC.WarHeight-1 then                        --当前步数的相邻格
		    local v=GetWarMap(x,y+1,3);
			if v ==255 and War_CanMoveXY(x,y+1,flag)==true then
                 num= num+1;
                steparray[step1].x[num]=x;
                steparray[step1].y[num]=y+1;
				SetWarMap(x,y+1,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x,y+1);
			end
		end

	    if y-1>0 then                        --当前步数的相邻格
		    local v=GetWarMap(x ,y-1,3);
			if v ==255 and War_CanMoveXY(x,y-1,flag)==true then
                num= num+1;
                steparray[step1].x[num]=x ;
                steparray[step1].y[num]=y-1;
				SetWarMap(x ,y-1,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x,y-1);
			end
		end
		end
	end
	if num==0 then return end;
    steparray[step1].num=num;
	--尝试加入一个排序，把步数低的放后面
	--不过如果反过来的话，zoc的效果就很极其明显了...
	--[[
	for i=1,num-1 do
		for j=i+1,num do
			if steparray[step1].bushu[i]>steparray[step1].bushu[j] then
				steparray[step1].bushu[i],steparray[step1].bushu[j]=steparray[step1].bushu[j],steparray[step1].bushu[i]
				steparray[step1].x[i],steparray[step1].x[j]=steparray[step1].x[j],steparray[step1].x[i]
				steparray[step1].y[i],steparray[step1].y[j]=steparray[step1].y[j],steparray[step1].y[i]
			end
		end
	end]]--
	
	
	War_FindNextStep(steparray,step1,flag,id)

end

function War_realjl(ida,idb) --计算两人距离
--返回两人之间的实际距离	
	if ida==nil then
		ida=WAR.CurID
	end
	
  	CleanWarMap(3,255);           --第三层坐标用来设置移动，先都设为255，

    local x=WAR.Person[ida]["坐标X"];
    local y=WAR.Person[ida]["坐标Y"];

	local steparray={};     --用数组保存第n步的坐标。
	--[[for i=0,128 do
	    steparray[i]={};
		steparray[i].bushu={};
        steparray[i].x={};
        steparray[i].y={};
	end--]]
	    steparray[0]={};
		steparray[0].bushu={};
        steparray[0].x={};
        steparray[0].y={};

	SetWarMap(x,y,3,0);
    steparray[0].num=1;
	steparray[0].bushu[1]=0;					--还能移动的步数
	steparray[0].x[1]=x;
	steparray[0].y[1]=y;
	return War_FindNextStep1(steparray,0,ida,idb);
	--return steparray;

end

function War_FindNextStep1(steparray,step,id,idb)      --设置下一步可移动的坐标
 --被上面的函数调用   
	local num=0;
	local step1=step+1;
	
	    steparray[step1]={};
		steparray[step1].bushu={};
        steparray[step1].x={};
        steparray[step1].y={};
	
	local function fujinnum(tx,ty)
		local tnum=0
		local wofang=WAR.Person[id]["我方"]
		local tv;
		tv=GetWarMap(tx+1,ty,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["我方"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=tnum+1
			end
		end
		tv=GetWarMap(tx-1,ty,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["我方"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=tnum+1
			end
		end
		tv=GetWarMap(tx,ty+1,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["我方"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=tnum+1
			end
		end
		tv=GetWarMap(tx,ty-1,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["我方"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["我方"]~=wofang then
				tnum=tnum+1
			end
		end
		return tnum
	end
	
	
	
	for i=1,steparray[step].num do
		--if steparray[step].bushu[i]<128 then
		steparray[step].bushu[i]=steparray[step].bushu[i]+1;
	    local x=steparray[step].x[i];
	    local y=steparray[step].y[i];
	    if x+1<CC.WarWidth-1 then                        --当前步数的相邻格
		    local v=GetWarMap(x+1,y,3);
			if v ==255 and War_CanMoveXY(x+1,y,0)==true then
                num= num+1;
                steparray[step1].x[num]=x+1;
                steparray[step1].y[num]=y;
				SetWarMap(x+1,y,3,step1);
				local mnum=fujinnum(x+1,y);
				if mnum==-1 then 
					return steparray[step].bushu[i],x+1,y
				else
					steparray[step1].bushu[num]=steparray[step].bushu[i]+mnum;
				end
			end
		end

	    if x-1>0 then                        --当前步数的相邻格
		    local v=GetWarMap(x-1,y,3);
			if v ==255 and War_CanMoveXY(x-1,y,0)==true then
                 num=num+1;
                steparray[step1].x[num]=x-1;
                steparray[step1].y[num]=y;
				SetWarMap(x-1,y,3,step1);
				local mnum=fujinnum(x-1,y);
				if mnum==-1 then 
					return steparray[step].bushu[i],x-1,y
				else
					steparray[step1].bushu[num]=steparray[step].bushu[i]+mnum;
				end
			end
		end

	    if y+1<CC.WarHeight-1 then                        --当前步数的相邻格
		    local v=GetWarMap(x,y+1,3);
			if v ==255 and War_CanMoveXY(x,y+1,0)==true then
                 num= num+1;
                steparray[step1].x[num]=x;
                steparray[step1].y[num]=y+1;
				SetWarMap(x,y+1,3,step1);
				local mnum=fujinnum(x,y+1);
				if mnum==-1 then 
					return steparray[step].bushu[i],x,y+1
				else
					steparray[step1].bushu[num]=steparray[step].bushu[i]+mnum;
				end
			end
		end

	    if y-1>0 then                        --当前步数的相邻格
		    local v=GetWarMap(x ,y-1,3);
			if v ==255 and War_CanMoveXY(x,y-1,0)==true then
                num= num+1;
                steparray[step1].x[num]=x ;
                steparray[step1].y[num]=y-1;
				SetWarMap(x ,y-1,3,step1);
				local mnum=fujinnum(x,y-1);
				if mnum==-1 then 
					return steparray[step].bushu[i],x,y-1
				else
					steparray[step1].bushu[num]=steparray[step].bushu[i]+mnum;
				end
			end
		end
		--end
	end
	if num==0 then return -1 end;
    steparray[step1].num=num;
	for i=1,num-1 do
		for j=i+1,num do
			if steparray[step1].bushu[i]>steparray[step1].bushu[j] then
				steparray[step1].bushu[i],steparray[step1].bushu[j]=steparray[step1].bushu[j],steparray[step1].bushu[i]
				steparray[step1].x[i],steparray[step1].x[j]=steparray[step1].x[j],steparray[step1].x[i]
				steparray[step1].y[i],steparray[step1].y[j]=steparray[step1].y[j],steparray[step1].y[i]
			end
		end
	end
	
	
	return War_FindNextStep1(steparray,step1,id,idb)

end

function War_GetCanFightEnemyXY()
--得到可以走到攻击到敌人的最近位置。
--scope可以攻击的范围
--返回 x,y。如果无法走到攻击位置，返回空
	local num,x,y
	num,x,y=War_realjl(WAR.CurID)
	--lib.Debug(num..'|'..x..','..y)
	if num==-1 then 
		return --WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"]
	else
		return x,y
	end
end


function NewWARPersonZJ(id,dw,x,y,life,fx)
    WAR.Person[WAR.PersonNum]["人物编号"]=id
	WAR.Person[WAR.PersonNum]["我方"]=dw;
    WAR.Person[WAR.PersonNum]["坐标X"]=x
    WAR.Person[WAR.PersonNum]["坐标Y"]=y
	WAR.Person[WAR.PersonNum]["死亡"]=life;
	WAR.Person[WAR.PersonNum]["人方向"]=fx;
    WAR.Person[WAR.PersonNum]["贴图"]=WarCalPersonPic(WAR.PersonNum);
	lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[id]["头像代号"]),
						string.format(CC.FightPicFile[2],JY.Person[id]["头像代号"]),
						4+WAR.PersonNum)																									
    SetWarMap(x,y,2,WAR.PersonNum)
	SetWarMap(x,y,5,WAR.Person[WAR.PersonNum]["贴图"])
    WAR.PersonNum=WAR.PersonNum+1;
end	

function RealJL(id1,id2,len)
--判断两个id之间的距离，如果小于等于len则反回真
--如果len为空则返回两人的距离
	len=len or 1	
	local x1,y1=WAR.Person[id1]["坐标X"],WAR.Person[id1]["坐标Y"]
	local x2,y2=WAR.Person[id2]["坐标X"],WAR.Person[id2]["坐标Y"]
	local s=math.abs(x1-x2)+math.abs(y1-y2)
	if len==nil then return s
	elseif s<=len then return true
	else return false
	end
end				

function drawname(x,y,name,size)
	x=x-math.modf(size/2)
	local namelen=string.len(name)/2
	local zi={}		
	for i=1,namelen do
		zi[i]=string.sub(name,i*2-1,i*2)
		DrawString(x,y,zi[i],C_WHITE,size)
		y=y+size
	end
end

function DrawTimeBar()
	local x1,x2,y=CC.ScreenW*5/8,CC.ScreenW*15/16,CC.FontSmall*5;
	local xunhuan=true;
	local surid=lib.SaveSur(x1-(10+(x2-x1)/2),0,x2+10+20+30,y*2+18+25);
	--local surid2=lib.SaveSur(25,545,750,585);
	local xscal=limitX(WAR.Delay/20,1,10);
	local delay=WAR.Delay/xscal;
	
	--[[for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]["死亡"]==false then
			WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]/xscal;
		end
	end]]
	while xunhuan do
		lib.LoadSur(surid,x1-(10+(x2-x1)/2),0)
		--lib.LoadSur(surid2,25,545)
		for i=0,WAR.PersonNum-1 do
		    local jqid=WAR.Person[i]["人物编号"]	
			if WAR.Person[i]["死亡"]==false then			   
			   if WAR.FXDS[WAR.Person[i]["人物编号"]]==nil then
				   if PersonKF(jqid,104)==false then--WAR.tmp[1000+WAR.Person[i]["人物编号"]]~=1 then
				      WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+WAR.Person[i]["TimeAdd"] 
			          if WAR.LQZ[jqid]==100 then WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+WAR.Person[i]["TimeAdd"] end				   
				   else
				      if PersonKF(jqid,107)==false then
					     local bdz=math.random(WAR.Person[i]["TimeAdd"])
				         --if bdz<math.modf(WAR.Person[i]["TimeAdd"]/3) then 
						    --bdz=math.modf(WAR.Person[i]["TimeAdd"]/3)
						 --end
						 WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+bdz+1
						 if math.random(10)==8 or math.random(10)==2 then 					    
							--if WAR.Person[i]["人物编号"]~=60 then
							   --JY.Person[WAR.Person[i]["人物编号"]]["体力"]=JY.Person[WAR.Person[i]["人物编号"]]["体力"]-2-math.random(2)
							--else
							if jqid==60 then
								if JY.Thing[202][WZ7]==1 then
								   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+50
								else
								   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+80
								end
							   --JY.Person[WAR.Person[i]["人物编号"]]["体力"]=JY.Person[WAR.Person[i]["人物编号"]]["体力"]
							else 
							    WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+30
							end
							if JY.Person[WAR.Person[i]["人物编号"]]["体力"]<20 then WAR.tmp[1000+jqid]=nil end					    
						 end
					   else
					      WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+WAR.Person[i]["TimeAdd"] 
			              if WAR.LQZ[jqid]==100 then WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+WAR.Person[i]["TimeAdd"] end				   				   
				       end
				  end			   
			   else
			       WAR.FXDS[WAR.Person[i]["人物编号"]]=WAR.FXDS[WAR.Person[i]["人物编号"]]-1
				   if PersonKF(jqid,108) then WAR.FXDS[jqid]=WAR.FXDS[jqid]-1 end
				   if WAR.LQZ[jqid]==100 then WAR.FXDS[jqid]=WAR.FXDS[jqid]-1 end
				   if WAR.FXDS[WAR.Person[i]["人物编号"]]<1 then WAR.FXDS[WAR.Person[i]["人物编号"]]=nil end
			   end   
				
			   if PersonKF(jqid,106) and (JY.Person[jqid]["内力性质"]==1 or (jqid==0 and GetS(4,5,5,5)==5)) then
				  JY.Person[jqid]["内力"]=JY.Person[jqid]["内力"]+3+math.random(2)
				  if JY.Person[jqid]["内力"]>JY.Person[jqid]["内力最大值"] then
				    JY.Person[jqid]["内力"]=JY.Person[jqid]["内力最大值"]
				  end
			   end
				
			   if PersonKF(jqid,107) and (JY.Person[jqid]["内力性质"]==0 or (jqid==0 and GetS(4,5,5,5)==5)) then
				  JY.Person[jqid]["生命"]=JY.Person[jqid]["生命"]+2
				  if JY.Person[jqid]["生命"]>JY.Person[jqid]["生命最大值"] then
				    JY.Person[jqid]["生命"]=JY.Person[jqid]["生命最大值"]
				  end
			   end
			   
			   if jqid==0 and GetS(4,5,5,5)==7 then
			      AddPersonAttrib(jqid,"生命",1);
				  if JLSD(25,75,jqid) then AddPersonAttrib(jqid,"受伤程度",-1) end
				  AddPersonAttrib(jqid,"中毒程度",-1);
			   end
				
			   if WAR.LXZT[jqid]~=nil then
			      if inteam(jqid) then
			         JY.Person[jqid]["生命"]=JY.Person[jqid]["生命"]-math.random(3)-math.modf(JY.Person[jqid]["受伤程度"]/15)
				  else
				     JY.Person[jqid]["生命"]=JY.Person[jqid]["生命"]-1-math.modf(JY.Person[jqid]["受伤程度"]/51)
				  end
				  if JY.Person[jqid]["生命"]<1 then JY.Person[jqid]["生命"]=1 end
				  WAR.LXZT[jqid]=WAR.LXZT[jqid]-1
				  if PersonKF(jqid,100) then WAR.LXZT[jqid]=WAR.LXZT[jqid]-1 end
				  if WAR.LXZT[jqid]<1 then WAR.LXZT[jqid]=nil end
			   end
				
				if JY.Person[jqid]["受伤程度"]>0 then
				   if PersonKF(jqid,92) then
				      if JY.Person[jqid]["受伤程度"]>70 then
					     if JLSD(30,70,jqid) then
						    JY.Person[jqid]["受伤程度"]=JY.Person[jqid]["受伤程度"]-1
					     end
					  elseif JY.Person[jqid]["受伤程度"]>40 then
				         if JLSD(15,85,jqid) then
						    JY.Person[jqid]["受伤程度"]=JY.Person[jqid]["受伤程度"]-1
					     end
				      else				         
						    JY.Person[jqid]["受伤程度"]=JY.Person[jqid]["受伤程度"]-1					     
					  end				      
				   end
				end
				
				if JY.Person[jqid]["中毒程度"]>0 then
				   if PersonKF(jqid,99) then
				       if JY.Person[jqid]["中毒程度"]>70 then
					     if JLSD(30,70,jqid) then
						    JY.Person[jqid]["中毒程度"]=JY.Person[jqid]["中毒程度"]-1
					     end
					   elseif JY.Person[jqid]["中毒程度"]>40 then
				         if JLSD(15,85,jqid) then
						    JY.Person[jqid]["中毒程度"]=JY.Person[jqid]["中毒程度"]-1
					     end
				       else				         
						    JY.Person[jqid]["中毒程度"]=JY.Person[jqid]["中毒程度"]-1					     
					   end	
                   end					   
				end
						
				if jqid==0 and T2SQ(jqid) and GetS(10,0,7,0)==1 then
				    if WAR.YTFS<100 then WAR.YTFS=WAR.YTFS+1 end
				    if WAR.YTFS==100 then
					  DrawStrBox(-1,-1,CC.WARS17,C_GOLD,30)
					  ShowScreen();
					  lib.Delay(100);
					  WAR.YTFS=101
				    end
				end

				if WAR.Person[i]["Time"]>=1000 then
				    if WAR.ZYHB==1 then
						  if i~=WAR.ZYHBP then
							 WAR.Person[i]["Time"]=990
						  else
							 WAR.Person[i]["Time"]=1001
						  end
						  --WAR.ZYHBP=-1
				    end
					xunhuan=false;
				end
				
				local keypress=lib.GetKey();
				if WAR.AutoFight==1 then                
					if keypress==VK_SPACE or keypress==VK_RETURN then
						WAR.AutoFight=0;
					end				
				end
				if keypress==113 then				    
				   if DrawStrBoxYesNo(-1,-1,CC.s74,C_WHITE,30)==true then
				      JY.Status=x
				   end
				   Cls();
				end
				if keypress==127 and JY.WGLVXS==1 then
				    for d=0,WAR.PersonNum-1 do
				        if WAR.Person[d]["我方"]==false then
						    --WAR.Person[d]["死亡"]=true
						end
					end
				end
				if keypress==277 and JY.WGLVXS==1 then
				    if JY.ZJSL==0 then
				       --JY.ZJSL=1
					else
					   --JY.ZJSL=0
					end
				end
			end
		end
		DrawTimeBar_sub(x1,x2,y,0);
		ShowScreen();
		lib.Delay(delay);
		WAR.SXTJ=WAR.SXTJ+1;		
	end
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]["死亡"]==false then
			WAR.Person[i]["TimeAdd"]=0;
		end
	end
	WAR.ZYHBP=-1
	lib.Delay(100);
	lib.FreeSur(surid);
	--lib.FreeSur(surid2);
end

function DrawTimeBar2()
	local x1,x2,y=CC.ScreenW*5/8,CC.ScreenW*15/16,CC.FontSmall*5;
	local draw;
	local surid=lib.SaveSur(x1-(10+(x2-x1)/2),0,x2+5+30,y*2+18+25);     
	while true do
		draw=false;
		for i=0,WAR.PersonNum-1 do		    
			if WAR.Person[i]["死亡"]==false then			   
				if WAR.Person[i]["TimeAdd"]<0 then
				    draw=true;				    
    	            --DrawStrBoxWaitKey(JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"],C_GOLD,30)
					WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+10;
					if WAR.Person[i]["Time"]>-500 then
						WAR.Person[i]["Time"]=WAR.Person[i]["Time"]-10;						
				    else
					    if JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]<100 then
						   if inteam(WAR.Person[i]["人物编号"]) then
						      JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]=JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]+Rnd(2)+1	
						   else
						      JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]=JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]+Rnd(2)
						   end
						end 
						if JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]>100 then JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]=100 end
						if PersonKF(WAR.Person[i]["人物编号"],100) then JY.Person[WAR.Person[i]["人物编号"]]["受伤程度"]=0 end					
					end
				end
			end
		end
		if draw then
			lib.LoadSur(surid,x1-(10+(x2-x1)/2),0)
			DrawTimeBar_sub(x1,x2,y,1);
			ShowScreen();
			lib.Delay(10);
		else		    	
			break;
		end
	end
	lib.Delay(100);
	lib.FreeSur(surid);
end

function DrawTimeBar_sub(x1,x2,y,flag)
	x1=x1 or CC.ScreenW*5/8;
	x2=x2 or CC.ScreenW*15/16;
	y=y or CC.FontSmall*5;
	local least=WAR.LifeNum*15;
	if flag==1 then
		least=0;
	end
	DrawBox_1(x1-3,y,x2+3,y+3,C_ORANGE)
	DrawBox_1(x1-(x2-x1)/2,y,x1-3,y+3,C_RED)
	for i=0,WAR.PersonNum-1 do
		if not WAR.Person[i]["死亡"] then
			--if WAR.Person[i]["Time"]>least then
				--local cx=x1+math.modf((WAR.Person[i]["Time"]-least)*(x2-x1)/(1000-least));
				local cx=x1+math.modf(WAR.Person[i]["Time"]/4);
				
				local color=C_WHITE;
				if WAR.Person[i]["TimeAdd"]<5 then
					color=C_ORANGE;
				end				
				if WAR.Person[i]["我方"] then
					--lib.FillColor(cx-1,CC.FontSmall*4,cx+1,CC.FontSmall*5-2,C_WHITE);
					--if WAR.FXDS[WAR.Person[i]["人物编号"]]==nil then
					   drawname(cx,0,JY.Person[WAR.Person[i]["人物编号"]]["姓名"],CC.FontSmall,color)
					   --drawname(cx,0,WAR.Person[i]["Time"],CC.FontSmall,color)
					--else
					   --drawname(cx,0,"封",CC.FontSmall,color)
					--end
					local w,h=lib.PicGetXY(99,JY.Person[WAR.Person[i]["人物编号"]]["头像代号"]*2);
					if WAR.Person[i]["人物编号"]==0 then
					   if GetS(4,5,5,5)<8 then
					      lib.PicLoadCache(99,(280+GetS(4,5,5,5))*2,cx-w/2,y-h-4,1,0);
					   else  
						  lib.PicLoadCache(99,(287+GetS(4,5,5,4))*2,cx-w/2,y-h-4,1,0);
					   end
					else   
					   lib.PicLoadCache(99,JY.Person[WAR.Person[i]["人物编号"]]["头像代号"]*2,cx-w/2,y-h-4,1,0);
				    end
					if WAR.JQSDXS[WAR.Person[i]["人物编号"]]~=nil then
					    if WAR.JQSD_WMM==1 then
					       DrawString(cx-w/2+2,y-h-4+18,WAR.JQSDXS[WAR.Person[i]["人物编号"]],C_GOLD,15)
					    end
					end
				else
					--lib.FillColor(cx-1,CC.FontSmall*5+2,cx+1,CC.FontSmall*6,C_WHITE);
					local w,h=lib.PicGetXY(99,JY.Person[WAR.Person[i]["人物编号"]]["头像代号"]*2);
					if WAR.Person[i]["人物编号"]==0 then
					   if GetS(4,5,5,5)<8 then
					      lib.PicLoadCache(99,(280+GetS(4,5,5,5))*2,cx-w/2,y+6,1,0);
					   else  
						  lib.PicLoadCache(99,(287+GetS(4,5,5,4))*2,cx-w/2,y+6,1,0);
					   end
					else   
					   lib.PicLoadCache(99,JY.Person[WAR.Person[i]["人物编号"]]["头像代号"]*2,cx-w/2,y+6,1,0);
				    end
					if WAR.JQSDXS[WAR.Person[i]["人物编号"]]~=nil then
					    if WAR.JQSD_WMM==1 then
					       DrawString(cx-w/2+2,y+6+18,WAR.JQSDXS[WAR.Person[i]["人物编号"]],C_GOLD,15)
					    end
					end
					--lib.PicLoadCache(99,JY.Person[WAR.Person[i]["人物编号"]]["头像代号"]*2,cx-w/2,y+6,1,0);
					--if WAR.FXDS[WAR.Person[i]["人物编号"]]==nil then					   
					   --if WAR.LQZ[WAR.Person[i]["人物编号"]]~=nil then
					   --drawname(cx,y+32,WAR.LQZ[WAR.Person[i]["人物编号"]],CC.FontSmall,color)							       
					   --else
					   drawname(cx,y+32,JY.Person[WAR.Person[i]["人物编号"]]["姓名"],CC.FontSmall,color)
                       --drawname(cx,y+32,WAR.Person[i]["Time"],CC.FontSmall,color) 					   
					   --end
					--else
					   --drawname(cx,y+32,"封",CC.FontSmall,color)
					--end				
				end
			--end
		end
	end
	--[[local w=JY.Person[0]
				local wlx,wfx
				if WAR.LXZT[0]==nil then
				   wlx=0
				else
				   wlx=WAR.LXZT[0]
				end
				if WAR.FXDS[0]==nil then
				   wfx=0
				else
				   wfx=WAR.FXDS[0]
				end				    
				DrawString(x1-(10+(x2-x1)/2),y*2+15,string.format("命:%3d 内:%4d 伤:%2d 封:%2d 流:%2d",w["生命"],w["内力"],w["受伤程度"],wfx,wlx),C_WHITE,24)
				]]
				DrawString(x2+10,y-23,CC.s39,C_WHITE,15)
				DrawString(x2+10,y-3,WAR.SXTJ,C_GOLD,20)
				--local pid=WAR.Person[i]["人物编号"]
				local hp=math.modf(JY.Person[0]["生命"]*320/JY.Person[0]["生命最大值"])
                local mp=math.modf(JY.Person[0]["内力"]*320/JY.Person[0]["内力最大值"])
				local zt1=math.modf(JY.Person[0]["受伤程度"]*100/100)
				local fx,lx=0,0;
				--if WAR.FXDS[0]==nil then WAR.FXDS[0]=50 end
				--if WAR.LXZT[0]==nil then WAR.LXZT[0]=100 end
				if WAR.FXDS[0]~=nil then fx=WAR.FXDS[0] end
				if WAR.LXZT[0]~=nil then lx=WAR.LXZT[0] end
				local zt2=math.modf(fx*100/50)
				local zt3=math.modf(lx*100/100)
				local A,B=x1-(10+(x2-x1)/2)+35,y*2+15;
				local a=0;
				local my;
				for t=0,WAR.PersonNum-1 do
				     if WAR.Person[t]["人物编号"]==0 and WAR.Person[t]["死亡"]==false then
					    a=1
						my=t
						break
					 end
				end
				if a==1 then
				    local hid=0;
					if GetS(4,5,5,5)<8 then
					   hid=280+GetS(4,5,5,5)		
					else
					   hid=287+GetS(4,5,5,4)
					end
					lib.PicLoadCache(99,hid*2,A-25,B-3,1,0);
					DrawBox_1(A,B,A+320,B+10,C_RED) 
					lib.Background(A,B,A+hp-1,B+10,50,C_RED)
					DrawString(A+2,B+1,"生命",C_GOLD,8)
					DrawBox_1(A,B+10,A+320,B+20,C_ORANGE) 
					lib.Background(A,B+10,A+mp-1,B+20,50,C_ORANGE)
					DrawString(A+2,B+11,"内力",C_GOLD,8)
					DrawBox_1(A,B+20,A+100,B+30,C_RED) 
					lib.Background(A,B+20,A+zt1-1,B+30,50,C_RED)
					DrawString(A+2,B+21,"内伤",C_GOLD,8)
					DrawBox_1(A+110,B+20,A+210,B+30,C_ORANGE) 
					lib.Background(A+110,B+20,A+110+zt2-1,B+30,50,C_ORANGE)
					DrawString(A+2+110,B+21,"封穴",C_GOLD,8)
					DrawBox_1(A+220,B+20,A+320,B+30,C_RED) 
					lib.Background(A+220,B+20,A+220+zt3-1,B+30,50,C_RED)
					DrawString(A+2+220,B+21,"流血",C_GOLD,8)
				end
				if my~=nil and JY.WGLVXS==1 then
				   --DrawString(10,CC.ScreenH-20,WAR.Person[my]["坐标X"].."  "..WAR.Person[my]["坐标Y"],C_WHITE,20)
				end
				--DrawBox_1(A,B,A+160,B+20,C_RED) 
				--lib.FillColor(A,B,A+hp,B+20,C_RED)
				--lib.Background(A,B,A+hp,B+20,100,C_RED)
				--DrawString(A+10,B+2,"生命",C_GOLD,15)
				--lib.PicLoadCache(99,0,A+160,B-5,1,0);
				--DrawBox_1(A+185,B,A+345,B+20,C_ORANGE) 
				--lib.FillColor(A+185+(160-mp),B,A+160+185,B+20,C_ORANGE)
				--lib.Background(A+185+(160-mp),B,A+160+185,B+20,100,C_ORANGE)
				--DrawString(A+305,B+2,"内力",C_GOLD,15)
				--lib.PicLoadCache(1,275*2,A,B,1);
				--lib.PicLoadCache(1,275*2,A,B+30,1);
				--lib.SetClip(A,B,A+hp,B+24)
				--lib.PicLoadCache(1,274*2,A,B,1);
				--lib.SetClip(A,B,A+mp,B+54)
				--lib.PicLoadCache(1,273*2,A,B+30,1);

end

function SelectWugongMenu(id,x,y)
	local menu={};
	for i=1,CC.Kungfunum do
		menu[i]={"",nil,0};
		local kfid=JY.Person[id]["武功"..i]
		if kfid~=nil and kfid>0 then
				menu[i][1]=JY.Wugong[kfid]["名称"].."·"..JY.Person[id]["武功等级"..i]
				menu[i][3]=1;
		end
	end
    return ShowMenu(menu,CC.Kungfunum,0,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function WarDrawMap(flag,v1,v2,v3,v4)
--绘战斗地图
--flag==0 基本
--      1 显示移动路径 (v1,v2) 当前移动位置
--      2 命中人物（武功，医疗等）另一个颜色显示
--      4 战斗动画, v1 战斗人物pic, v2战斗人物贴图类型(0 使用战斗场景贴图，4，fight***贴图编号 v3 武功效果贴图 -1没有效果

    local x=WAR.Person[WAR.CurID]["坐标X"];
    local y=WAR.Person[WAR.CurID]["坐标Y"];
	v4=v4 or JY.SubScene
    if flag==0 then
	    lib.DrawWarMap(0,x,y,0,0,-1,v4);
    elseif flag==1 then
		if JY.SubScene==0 or JY.SubScene==2 or JY.SubScene==3 or JY.SubScene==4 or JY.SubScene==39 then     --雪地地图用黑色菱形
		    lib.DrawWarMap(1,x,y,v1,v2,-1,v4);
        else
		    lib.DrawWarMap(2,x,y,v1,v2,-1,v4);
		end
	elseif flag==2 then
	    lib.DrawWarMap(3,x,y,0,0,-1,v4);
	elseif flag==4 then
	    lib.DrawWarMap(4,x,y,v1,v2,v3,v4);
	end
	if WAR.ShowHead==1 then
        WarShowHead();
	end
end

function WarShowHead(id)               --显示战斗人头像
	id=id or WAR.CurID
	if id<0 then return end
    local pid=WAR.Person[id]["人物编号"];
	local p=JY.Person[pid];

	local h=16+2;
    local width=160+2*CC.MenuBorderPixel;
	local height=160+2*CC.MenuBorderPixel+4*h;
	local x1,y1;
	local i=1;
    if WAR.Person[id]["我方"]==true then
	    x1=CC.ScreenW-width-10;
        y1=CC.ScreenH-height-10;
    else
	    x1=10;
        y1=10;
    end

    DrawBox(x1,y1,x1+width,y1+height,C_WHITE);
	local headw,headh=lib.PicGetXY(1,p["头像代号"]*2);
    local headx=(160-headw)/2;
	local heady=(100-headh)/2;
	if pid==0 then
	    if GetS(4,5,5,5)<8 then
	      lib.PicLoadCache(1,(280+GetS(4,5,5,5))*2,x1+5+headx,y1+5+heady,1);
	    else
		  lib.PicLoadCache(1,(287+GetS(4,5,5,4))*2,x1+5+headx,y1+5+heady,1);
	    end
	else	
	    lib.PicLoadCache(1,p["头像代号"]*2,x1+5+headx,y1+5+heady,1);
	end
	x1=x1+5
	y1=y1+5+100;
	local color;
	if p["受伤程度"]<p["中毒程度"] then
		if p["中毒程度"]==0 then
			color =RGB(252,148,16);
		elseif p["中毒程度"]<50 then
			color=RGB(120,208,88);
		else
			color=RGB(56,136,36);
		end
	else
		if p["受伤程度"]<33 then
			color =RGB(236,200,40);
		elseif p["受伤程度"]<66 then
			color=RGB(244,128,32);
		else
			color=RGB(232,32,44);
		end	
	end
    MyDrawString(x1,x1+160,y1+5,p["姓名"],color,32);
	y1=y1+42
	
local hp=math.modf(JY.Person[pid]["生命"]*160/JY.Person[pid]["生命最大值"])
local mp=math.modf(JY.Person[pid]["内力"]*160/JY.Person[pid]["内力最大值"])
local tp=math.modf(JY.Person[pid]["体力"]*160/100)
	lib.PicLoadCache(1,275*2,x1,y1,1);
	lib.PicLoadCache(1,275*2,x1,y1+30,1);
	lib.PicLoadCache(1,275*2,x1,y1+60,1);
lib.SetClip(x1,y1,x1+hp,y1+24)
	lib.PicLoadCache(1,274*2,x1,y1,1);
lib.SetClip(x1,y1+30,x1+mp,y1+54)
	lib.PicLoadCache(1,273*2,x1,y1+30,1);
lib.SetClip(x1,y1+30,x1+tp,y1+84)
	lib.PicLoadCache(1,276*2,x1,y1+60,1);
lib.SetClip(0,0,0,0)

    DrawString(x1+10,y1+5,"命",C_WHITE,16);
    DrawString(x1+10,y1+35,"内",C_WHITE,16);
    DrawString(x1+10,y1+65,"体",C_WHITE,16);

    local lifexs=0;
	local nlxs=JY.Person[WAR.Person[id]["人物编号"]]["内力"]
	local tlxs=JY.Person[WAR.Person[id]["人物编号"]]["体力"]
	
	if inteam(WAR.Person[id]["人物编号"]) or pid==0 then
	    lifexs=JY.Person[WAR.Person[id]["人物编号"]]["生命"]
	else    
		lifexs=JY.Person[WAR.Person[id]["人物编号"]]["生命"]*2
	end
	DrawString(x1+10+18,y1+5,lifexs,C_WHITE,16);
	DrawString(x1+10+18,y1+35,nlxs,C_WHITE,16);
	DrawString(x1+10+18,y1+65,tlxs,C_WHITE,16);
	
	if WAR.Person[id]["我方"]==false then--and JY.WGLVXS==1 then
	   DrawBox(x1-5,y1+95,x1+width-5,y1+220,C_WHITE);
	   local hl=1;
	   for i=1,4 do
	        local wp=JY.Person[WAR.Person[id]["人物编号"]]["携带物品"..i]
	        local wps=JY.Person[WAR.Person[id]["人物编号"]]["携带物品数量"..i]        
			if wp>=0 then
			    local wpm=JY.Thing[wp]["名称"]
				DrawString(x1,y1+70+hl*30,wpm..wps,C_WHITE,25);
	            hl=hl+1;
		   end
	    end
	end
	
end

function GetJiqi()
	local num,total=0,0
	local function getnewmove(x,flag)
		if not flag then
			x=x*2
		end
		--if x>280 then
			--return 8+(x-280)/100
		if x>160 then
			return 6+(x-160)/60
		elseif x>80 then
			return 4+(x-80)/40
		elseif x>30 then
			return 2+(x-30)/25
		else 
			return	x/15
		end
	end
	
	local function getnewmove1(a,b,flag)
		local x=(a*2+b)/3
		if not flag then
			x=x*2
		end
		if x>5600 then
			return 8+math.min((x-5600)/1200,3)
		elseif x>3600 then
			return 6+(x-3600)/1000
		elseif x>2000 then
			return 4+(x-2000)/800
		elseif x>800 then
			return 2+(x-800)/600
		else 
			return	x/400
		end
	end
	for i=0,WAR.PersonNum-1 do
		if not WAR.Person[i]['死亡'] then
			local id=WAR.Person[i]['人物编号']
			local nsyxjq=0;--JY.Person[id]["受伤程度"]
			if inteam(id) then
			    nsyxjq=math.modf(JY.Person[id]["受伤程度"]/10);
			else
                nsyxjq=math.modf(JY.Person[id]["受伤程度"]/25);
            end				
			WAR.Person[i]["TimeAdd"]=math.modf(getnewmove(WAR.Person[i]["轻功"],inteam(id))+getnewmove1(JY.Person[id]["内力"],JY.Person[id]["内力最大值"],inteam(id))-JY.Person[id]["中毒程度"]/25-nsyxjq+JY.Person[id]["体力"]/30+5)
			for ii=1,10 do
			    if JY.Person[id]["武功"..ii]==105 then
				   WAR.Person[i]["TimeAdd"]=math.modf(WAR.Person[i]["TimeAdd"]*1.2)
				end
		    end
			if WAR.Person[i]["TimeAdd"]<5 then WAR.Person[i]["TimeAdd"]=5 end
			if id==27 or id==1 or id==57 or id==97 or id==516 then
				WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+10
			end
			if id==29 then
			   WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+20
			   for j=0,WAR.PersonNum-1 do
	                if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[i]["我方"] then                            			   			                   
		               WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]-4
					end
			   end
			end
			if GetS(4,5,5,5)==2 and id==0 then
			   local jsyx=0;
				for i=1,10 do
					if JY.Person[0]["武功"..i]==110 or (JY.Person[0]["武功"..i]<50 and JY.Person[0]["武功"..i]>26) then
						if JY.Person[0]["武功等级"..i]==999 then
						   jsyx=jsyx+1
						end
					end
				end
				WAR.Person[i]["TimeAdd"]=math.modf(WAR.Person[i]["TimeAdd"]*(1+0.05*jsyx)) 
			end
			if id==55 then
			   local xz=0;
			   for j=0,WAR.PersonNum-1 do
	                if WAR.Person[j]["死亡"]==true and WAR.Person[j]["我方"]==WAR.Person[i]["我方"] then                            			   			                   
		               WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+3
					end
			   end
			end
			if WAR.ZDDH==14 then
			    if id==173 or id==174 or id==175 then
			      local shz=0;
				    for j=0,WAR.PersonNum-1 do
	                   if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[i]["我方"] then                            			   			                   
		                  shz=shz+1
					   end
				    end
					if shz==3 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+20 end
				end  				
			end	
			if id==0 and WAR.LRZ==1 then
			    for j=0,WAR.PersonNum-1 do
	                    if WAR.Person[j]["人物编号"]==92 and WAR.Person[j]["死亡"]==false then                        			   			                   
		                    if WE_JL(0,92,3) then					       
							   WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+5
							end	
							break;
			            end
				end
			end
			if id==50 then 
			   WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+20 
			   if JY.Thing[202][WZ7]==1 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]-10 end 
			end
            if WAR.FLHS2>20 then WAR.FLHS2=20 end
			if id==18 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+10 end
			if id==0 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+WAR.FLHS2 end	
			if id==97 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+WAR.XDLZ end									
			if id==129 or id==65 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+WAR.WCY*5 end	
			if id==553 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+WAR.YZB2*4 end
			if id==28 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+WAR.PYZ*3 end
			if not inteam(id) then
			    if JY.Thing[202][WZ7]==1 then
				   WAR.Person[i]["TimeAdd"]=math.modf(WAR.Person[i]["TimeAdd"]*0.6)
				elseif JY.Thing[202][WZ7]==2 then 
                   WAR.Person[i]["TimeAdd"]=math.modf(WAR.Person[i]["TimeAdd"]*1)+2
				else
				   WAR.Person[i]["TimeAdd"]=math.modf(WAR.Person[i]["TimeAdd"]*1.1)+5								   
			    end
			end
			if WAR.ZDDH==128 then
			    if inteam(id)==false and id~=553 and JY.Thing[202][WZ7]>1 then
			        WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+10
				end
			end
			--if inteam(id) then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]-math.modf(JY.Person[id]["受伤程度"]/20) end
			if WAR.Person[i]["TimeAdd"]<5 then WAR.Person[i]["TimeAdd"]=5 end
            if (id==445 or id==446) and WAR.ZDDH==226 then WAR.Person[i]["TimeAdd"]=0 end 			
			if JY.ZJSL==1 and (not inteam(id)) and WAR.Person[i]["我方"]==false then WAR.Person[i]["TimeAdd"]=0 end --DJQ0			
			if WAR.Person[i]["TimeAdd"]>60 then WAR.Person[i]["TimeAdd"]=60 end	
			WAR.JQSDXS[id]=WAR.Person[i]["TimeAdd"]
			if WAR.LQZ[id]==100 then WAR.JQSDXS[id]=WAR.Person[i]["TimeAdd"]*2 end
			num=num+1
			total=total+WAR.Person[i]["TimeAdd"]			
		end
	end
	WAR.JQSD_WMM=0;
	for i=0,WAR.PersonNum-1 do
	    local p=WAR.Person[i]["人物编号"]
	    if p==76 and inteam(p) and WAR.Person[i]["死亡"]==false then
		    WAR.JQSD_WMM=1
			break;
		end
	end
	WAR.LifeNum=num;
	return math.modf(1.2*(total/num+num-2))
end

function buzhen()
	if not inteam(56) then
		return
	end
	if WAR.ZDDH==238 then return end
	say('ｎ，要布置阵型吗？',56)
	if not DrawStrBoxYesNo(-1,-1,'要布置阵型吗',C_WHITE,CC.DefaultFont) then
		return
	end
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]['我方'] then
			WAR.CurID=i
			WAR.ShowHead=1
			War_CalMoveStep(WAR.CurID,math.modf(JY.Person[56]['等级']/3-4),0);
			local x,y
			while true do
				x,y=War_SelectMove()
				if x ~=nil then
					WAR.ShowHead=0
					War_MovePerson(x,y);
					break;
				end
			end
		end
	end
end

function War_PersonLostLife(i)             --计算战斗后每回合由于中毒或受伤而掉血
    
        local pid=WAR.Person[i]["人物编号"]
        if WAR.Person[i]["死亡"]==false then
            if JY.Person[pid]["受伤程度"]>0 then
                local dec=math.modf(JY.Person[pid]["受伤程度"]/20);
                AddPersonAttrib(pid,"生命",-dec);
            end
            if JY.Person[pid]["中毒程度"]>0 then
                --local dec=math.modf(JY.Person[pid]["中毒程度"]/10);
                local dec=math.modf(JY.Person[pid]["中毒程度"]/3);          --此处修改
                AddPersonAttrib(pid,"生命",-dec);
            end
            if JY.Person[pid]["生命"]<=0 then
                JY.Person[pid]["生命"]=1;
            end
        end
    
end

function War_EndPersonData(isexp,warStatus)            --战斗以后设置人物参数
--敌方人员参数恢复
    for i=0,WAR.PersonNum-1 do
        local pid=WAR.Person[i]["人物编号"]
        if not instruct_16(pid) then
            JY.Person[pid]["生命"]=JY.Person[pid]["生命最大值"];
            JY.Person[pid]["内力"]=JY.Person[pid]["内力最大值"];
            JY.Person[pid]["体力"]=CC.PersonAttribMax["体力"];
            JY.Person[pid]["受伤程度"]=0;
            JY.Person[pid]["中毒程度"]=0;
        end
    end

    --我方人员参数恢复，输赢都有
    for i=0,WAR.PersonNum-1 do
        local pid=WAR.Person[i]["人物编号"]
        if instruct_16(pid) then
			if warStatus==1 then
				JY.Person[pid]["生命"]=JY.Person[pid]["生命"]+math.modf((JY.Person[pid]["生命最大值"]-JY.Person[pid]["生命"])*0.3)
				JY.Person[pid]["内力"]=JY.Person[pid]["内力"]+math.modf((JY.Person[pid]["内力最大值"]-JY.Person[pid]["内力"])*0.3)
				JY.Person[pid]["体力"]=JY.Person[pid]["体力"]+math.modf((100-JY.Person[pid]["体力"])*0.3)
				JY.Person[pid]["受伤程度"]=math.modf(JY.Person[pid]["受伤程度"]/2)
				JY.Person[pid]["中毒程度"]=math.modf(JY.Person[pid]["中毒程度"]/2)
			else
				if JY.Person[pid]["生命"]<JY.Person[pid]["生命最大值"]/4 then
					JY.Person[pid]["生命"]=math.modf(JY.Person[pid]["生命最大值"]/4);
				end
				if JY.Person[pid]["体力"]<10 then
					JY.Person[pid]["体力"]=10 ;
				end				
			end
        end
    end
    
	JY.Person[50]["武功1"]=26 
	JY.Wugong[13]["名称"]="铁掌" 
	 
	if WAR.ZDDH==82 then SetS(10,0,18,0,1) end	   
	if WAR.ZDDH==217 and warStatus==1 then SetS(10,0,16,0,1) end
	if WAR.ZDDH==44 then
       	instruct_3(55,6,1,0,0,0,0,-2,-2,-2,0,-2,-2)
		instruct_3(55,7,1,0,0,0,0,-2,-2,-2,0,-2,-2)
	end
	if WAR.ZDDH==45 then instruct_3(55,9,1,0,0,0,0,-2,-2,-2,0,-2,-2) end
	if WAR.ZDDH==46 then instruct_3(55,13,0,0,0,0,0,-2,-2,-2,0,-2,-2) end  
	
	--[[for i=0,190 do
	      if JY.Person[i]["代号"]~=i then
		     say(CC.EXITSAY)
			 JY.Status=GANE_END
		  end
	end]]
	
    if warStatus==2 and isexp==0 then  --输，没有经验，退出
        return ;
    end

    local liveNum=0;          --计算我方活着的人数
    for i=0,WAR.PersonNum-1 do
        if WAR.Person[i]["我方"]==true and JY.Person[WAR.Person[i]["人物编号"]]["生命"]>0  then
            liveNum=liveNum+1;
        end
    end
    local canyu=false;
    --分配战斗经验---基本经验，战斗数据中的
    if warStatus==1 then     --赢了才有
	  if WAR.Data["经验"]<1000 then WAR.Data["经验"]=1000 end
	  --if WAR.Data["代号"]==226 then WAR.Data["经验"]=10000 end
        for i=0,WAR.PersonNum-1 do
            local pid=WAR.Person[i]["人物编号"]
            if WAR.Person[i]["我方"]==true and inteam(pid) then
                if JY.Person[pid]["生命"]>0 then
					if pid==0 then
						canyu=true;
					end
					for ii=1,10 do
					   if JY.Person[pid]["武功"..ii]==98 then
                          WAR.Person[i]["经验"]=WAR.Person[i]["经验"] + math.modf(WAR.Data["经验"]*1.5/liveNum);
					   end
					end     
					      WAR.Person[i]["经验"]=WAR.Person[i]["经验"] + math.modf(WAR.Data["经验"]/liveNum)
					
                end
            end
        end
    end


    --每个人经验增加，以及升级 XLDS
    for i=0,WAR.PersonNum-1 do
        local pid=WAR.Person[i]["人物编号"];
        AddPersonAttrib(pid,"物品修炼点数",math.modf(WAR.Person[i]["经验"]*8/10));
        AddPersonAttrib(pid,"修炼点数",math.modf(WAR.Person[i]["经验"]*8/10));
        if JY.Person[pid]["修炼点数"]<0 then JY.Person[pid]["修炼点数"]=0 end
	  
        if WAR.Person[i]["我方"]==true and inteam(pid) then

            DrawStrBoxWaitKey( string.format(CC.WARS124,JY.Person[pid]["姓名"],WAR.Person[i]["经验"]),C_WHITE,CC.DefaultFont);
			AddPersonAttrib(pid,"经验",math.modf(WAR.Person[i]["经验"]/2));

			local r=War_AddPersonLVUP(pid);     --人物升级

			if r==true then
				DrawStrBoxWaitKey( string.format(CC.WARS125,JY.Person[pid]["姓名"]),C_WHITE,CC.DefaultFont);
			end
		else			
			AddPersonAttrib(pid,"经验",WAR.Person[i]["经验"]);
        end

        War_PersonTrainBook(pid);            --修炼秘籍
        War_PersonTrainDrug(pid);            --修炼药品
    end
	--[[if warStatus==1 and canyu and JY.Person[0]["经验"]==60000 and JY.Person[0]["武功1"]<109 and JY.Person[0]["武功7"]>0 then
		CreatKf(WAR.Data["经验"]/100);
	end]]--
	if WAR.ZDDH==48 then
	   SetS(57,52,29,1,0)
       SetS(57,52,30,1,0)
    elseif WAR.ZDDH==175 then
	   instruct_3(32,12,1,0,0,0,0,0,0,0,-2,-2,-2); 
	--elseif WAR.ZDDH==217 then
	   --SetS(10,0,16,0,1)
	elseif WAR.ZDDH==82 then	   
	   SetS(10,0,18,0,1)
	elseif WAR.ZDDH==214 then
	   SetS(10,0,19,0,1)
	end
	
	if WAR.ZDDH==217 and warStatus==1 then 
	    SetS(65,1,1,5,517)
	end
end

function War_AddPersonLVUP(pid)      --人物是否升级 Level
--人物是否升级
--pid 人id
--返回 true 升级，false不升级
    local tmplevel=JY.Person[pid]["等级"];
    if tmplevel>=CC.Level then     --级别到顶
        return false;
    end

    if JY.Person[pid]["经验"]<CC.Exp[tmplevel] then     --经验不够升级
        return false
    end

    while true do          --判断可以升几级
        if tmplevel >= CC.Level then
            break;
        end
        if JY.Person[pid]["经验"]>=CC.Exp[tmplevel] then
			--JY.Person[pid]["经验"]=JY.Person[pid]["经验"]-CC.Exp[tmplevel]
            tmplevel=tmplevel+1;
        else
            break;
        end
    end
    local leveladd=tmplevel-JY.Person[pid]["等级"];   --升级次数
    JY.Person[pid]["等级"]=JY.Person[pid]["等级"]+leveladd;
    AddPersonAttrib(pid,"生命最大值", (JY.Person[pid]["生命增长"]+Rnd(3))*leveladd*3);
    JY.Person[pid]["生命"]=JY.Person[pid]["生命最大值"];
    JY.Person[pid]["体力"]=CC.PersonAttribMax["体力"];
    JY.Person[pid]["受伤程度"]=0;
    JY.Person[pid]["中毒程度"]=0;

    local function cleveradd()
		local ca
		local rndnum;
		if CC.Debug then
			rndnum=math.random(1);
		else
			rndnum=math.random(1);
		end
		--if JY.Person[pid]["资质"]>100 then JY.Person[pid]["资质"]=100 end
		--ca=JY.Person[pid]["资质"]+Rnd(120-JY.Person[pid]["资质"]);
		ca=JY.Person[pid]["资质"]/(rndnum+4);
		--ca=ca/7
		return ca
	end
	
	local function mymodf(x)
		local x1=math.modf(x)
		if math.random()<x-x1 then return x1
		else return x1 end
	end
	--[[
    if JY.Person[pid]["资质"]<30 then
        cleveradd=1+Rnd(15);
    elseif JY.Person[pid]["资质"]<50 then
        cleveradd=2+Rnd(6);
    elseif JY.Person[pid]["资质"]<70 then
        cleveradd=3+Rnd(5);
    elseif JY.Person[pid]["资质"]<90 then
        cleveradd=4+Rnd(4);
    else
        cleveradd=5+Rnd(3);
    end
	]]--
    --cleveradd=Rnd(cleveradd)+1;        --按照资质计算的增长点，越高则技能增加越多，而内力增加越少。
	local theadd=cleveradd()
    AddPersonAttrib(pid,"内力最大值",  math.modf(leveladd*((10-JY.Person[pid]["生命增长"])*7+210/(theadd+1))));   --聪明人不练内力
    if pid==0 and GetS(4,5,5,5)==5 then
	   AddPersonAttrib(pid,"内力最大值",50*leveladd)
	end
	JY.Person[pid]["内力"]=JY.Person[pid]["内力最大值"];

	--local totaladd=3*leveladd;
        
	for i=1,leveladd do	
		local ups=math.modf((JY.Person[pid]["资质"]-1)/15)+1;

			if pid==35 and GetD(82,1,0)==1 then  --TLV
			   ups=3
			end
		
			if pid==55 and JY.Person[pid]["等级"]>20 then
			   ups=6
			end
			
			if T1LEQ(pid) then ups=8 end
			
		if JY.Thing[202][WZ7]==2 then ups=ups+1 end
		if JY.Thing[202][WZ7]==3 then ups=ups+2 end
		
        AddPersonAttrib(pid,"攻击力",ups);
        AddPersonAttrib(pid,"防御力",ups);
        AddPersonAttrib(pid,"轻功",ups);
		
		local a1=JY.Person[pid]['攻击力'];
		local a2=JY.Person[pid]['防御力'];
		local a3=JY.Person[pid]['轻功'];
		local a4='攻击力'
		
		if a2>=a1 and a2>=a3 then a4='防御力' end
		if a3>=a2 and a3>=a1 then a4='轻功' end
		
		AddPersonAttrib(pid,a4,1);
		
		if JY.Thing[202][WZ7]>1 then
			local ran=math.random(3);
			if ran==1 then
			   AddPersonAttrib(pid,"攻击力",1);
			elseif ran==2 then
			   AddPersonAttrib(pid,"防御力",1);
			else
			   AddPersonAttrib(pid,"轻功",1);
			end
		end
		if JY.Thing[202][WZ7]>2 then
		    local ran=math.random(3);
			if ran==1 then
			   AddPersonAttrib(pid,"攻击力",1);
			elseif ran==2 then
			   AddPersonAttrib(pid,"防御力",1);
			else
			   AddPersonAttrib(pid,"轻功",1);
			end
		end		
	end	
		
	--[[
	if add_a>=CC.PersonAttribMax['攻击力'] then
		add_a=0
	end
	if add_b>=CC.PersonAttribMax['防御力'] then
		add_b=0
	end
	if add_c>=CC.PersonAttribMax['轻功'] then
		add_c=0
	end
	]]--
	--add_c=add_c*0.6;
	--local total=add_a+add_b+add_c+1;
	--add_a=mymodf(totaladd*add_a/total);
	--add_b=mymodf(totaladd*add_b/total);
	--add_c=mymodf(totaladd*add_c/total);
	--[[local rnn=math.random(3);
	if rnn==1 then
		add_a=add_a+1;
	elseif rnn==2 then
		add_b=add_b+1;
	else
		add_c=add_c+1;
	end
	rnn=math.random(3);
	if rnn==1 then
		add_a=add_a+1;
	elseif rnn==2 then
		add_b=add_b+1;
	else
		add_c=add_c+1;
	end
      if T1LEQ(pid) then
         totaladd=0
       for i=1,leveladd do
	   totaladd=28;
       
       add_a=math.random(totaladd)
       if add_a>totaladd/2 then
          add_a=totaladd/2
       end
       add_b=math.random(totaladd-add_a)
       add_c=totaladd-add_a-add_b
       AddPersonAttrib(pid,"攻击力",add_b)
       AddPersonAttrib(pid,"防御力",add_c)
       AddPersonAttrib(pid,"轻功",add_a)
       end
      else           
    AddPersonAttrib(pid,"攻击力",add_a);
    AddPersonAttrib(pid,"防御力",add_b);
    AddPersonAttrib(pid,"轻功",add_c);
      end]]
	--[[
    AddPersonAttrib(pid,"攻击力",  mymodf(cleveradd()*leveladd));
    AddPersonAttrib(pid,"防御力",  mymodf(cleveradd()*leveladd));
    AddPersonAttrib(pid,"轻功",  mymodf(cleveradd()*leveladd*0.6));
	]]--
    if JY.Person[pid]["医疗能力"]>=20 then
        AddPersonAttrib(pid,"医疗能力",  math.random(2));
    end
    if JY.Person[pid]["用毒能力"]>=20 then
        AddPersonAttrib(pid,"用毒能力",  math.random(2));
    end
    if JY.Person[pid]["解毒能力"]>=20 then
        AddPersonAttrib(pid,"解毒能力",  math.random(2));
    end
    
   if pid==75 then	
    if JY.Person[pid]["拳掌功夫"]>=0 then
        AddPersonAttrib(pid,"拳掌功夫",  math.random(3)*leveladd);
    end
    if JY.Person[pid]["御剑能力"]>=0 then
        AddPersonAttrib(pid,"御剑能力",  (5+math.random(3))*leveladd);
    end
    if JY.Person[pid]["耍刀技巧"]>=0 then
        AddPersonAttrib(pid,"耍刀技巧",  (5+math.random(3))*leveladd);
    end
    if JY.Person[pid]["特殊兵器"]>=0 then
        AddPersonAttrib(pid,"特殊兵器",  (5+math.random(3))*leveladd);
    end
   end
	
    if JY.Person[pid]["暗器技巧"]>=20 then
        AddPersonAttrib(pid,"暗器技巧",  math.random(2));
    end
  

    return true;

end

function War_PersonTrainBook(pid)           --战斗后修炼秘籍是否成功
    local p=JY.Person[pid];

    local thingid=p["修炼物品"];
    if thingid<0 then
        return ;
    end

	local wugongid=JY.Thing[thingid]["练出武功"];
	local wg=0;
	
	if JY.Person[pid]["武功10"]>0 and wugongid>=0 then
	   for i=1,10 do
	        if JY.Thing[thingid]["练出武功"]==JY.Person[pid]["武功"..i] then
			   wg=1
			   break;
			end
		end
		if wg==0 then return end
	end   

	local yes1,yes2,kfnum=false,false
	while true do
    local needpoint=TrainNeedExp(pid);      --计算修炼成功需要点数

    if p["修炼点数"]>=needpoint then   --修炼成功
		yes1=true

        AddPersonAttrib(pid,"生命最大值",JY.Thing[thingid]["加生命最大值"]);
		if thingid==139 then 
		   AddPersonAttrib(pid,"生命最大值",-15) 
		   AddPersonAttrib(pid,"生命",-15) 
		   if JY.Person[pid]["生命最大值"]<1 then JY.Person[pid]["生命最大值"]=1 end
		   if JY.Person[pid]["生命"]<1 then JY.Person[pid]["生命"]=1 end	   
		end
        if JY.Thing[thingid]["改变内力性质"]==2 then
            p["内力性质"]=2;
        end
        AddPersonAttrib(pid,"内力最大值",JY.Thing[thingid]["加内力最大值"]);
        AddPersonAttrib(pid,"攻击力",JY.Thing[thingid]["加攻击力"]);
        AddPersonAttrib(pid,"轻功",JY.Thing[thingid]["加轻功"]);
        AddPersonAttrib(pid,"防御力",JY.Thing[thingid]["加防御力"]);
        AddPersonAttrib(pid,"医疗能力",JY.Thing[thingid]["加医疗能力"]);
        AddPersonAttrib(pid,"用毒能力",JY.Thing[thingid]["加用毒能力"]);
        AddPersonAttrib(pid,"解毒能力",JY.Thing[thingid]["加解毒能力"]);
        AddPersonAttrib(pid,"抗毒能力",JY.Thing[thingid]["加抗毒能力"]);

        if pid==56 then
        AddPersonAttrib(pid,"拳掌功夫",JY.Thing[thingid]["加拳掌功夫"]*2);
        AddPersonAttrib(pid,"御剑能力",JY.Thing[thingid]["加御剑能力"]*2);
        AddPersonAttrib(pid,"耍刀技巧",JY.Thing[thingid]["加耍刀技巧"]*2);
        AddPersonAttrib(pid,"特殊兵器",JY.Thing[thingid]["加特殊兵器"]*2);
        else
        AddPersonAttrib(pid,"拳掌功夫",JY.Thing[thingid]["加拳掌功夫"]);
        AddPersonAttrib(pid,"御剑能力",JY.Thing[thingid]["加御剑能力"]);
        AddPersonAttrib(pid,"耍刀技巧",JY.Thing[thingid]["加耍刀技巧"]);
        AddPersonAttrib(pid,"特殊兵器",JY.Thing[thingid]["加特殊兵器"]);
        end
      

        AddPersonAttrib(pid,"暗器技巧",JY.Thing[thingid]["加暗器技巧"]);
        AddPersonAttrib(pid,"武学常识",JY.Thing[thingid]["加武学常识"]);
        AddPersonAttrib(pid,"品德",JY.Thing[thingid]["加品德"]);
        AddPersonAttrib(pid,"攻击带毒",JY.Thing[thingid]["加攻击带毒"]);
        if JY.Thing[thingid]["加攻击次数"]==1 then
            p["左右互搏"]=1;
        end
        
		if thingid>186 then
		   p["修炼点数"]=p["修炼点数"]-needpoint;
		end

		if thingid<187 then
		   p["修炼点数"]=p["修炼点数"]-needpoint;
		end

        if wugongid>=0 then
			yes2=true
            local oldwugong=0;
            for i =1,10 do
                if p["武功" .. i]==wugongid then
                    oldwugong=1;
                    p["武功等级" .. i]=math.modf((p["武功等级" .. i]+100)/100)*100;
					kfnum=i

                    break;
                end
            end
            if oldwugong==0 then  --新的武功
                for i=1,10 do
                    if p["武功" .. i]==0 then
                        p["武功" .. i]=wugongid;
						kfnum=i
                        break;
                    end
                end
                ---这里不考虑10个武功已满的时候如何增加新的武功
            end
        end
	else 
		break
    end
	end
	
	if yes1 then
        DrawStrBoxWaitKey( string.format(CC.WARS126,p["姓名"],JY.Thing[thingid]["名称"]),C_WHITE,CC.DefaultFont);
	end
	if yes2 then 
        DrawStrBoxWaitKey(string.format(CC.WARS127,JY.Wugong[wugongid]["名称"],math.modf(p["武功等级" ..kfnum]/100)+1),C_WHITE,CC.DefaultFont);
	end
end

function War_PersonTrainDrug(pid)         --战斗后是否修炼出物品药品
    local p=JY.Person[pid];

    local thingid=p["修炼物品"];
    if thingid<0 then
        return ;
    end

    if JY.Thing[thingid]["练出物品需经验"] <=0 then          --不可以修炼出物品
        return ;
    end

    local needpoint=(7-math.modf(p["资质"]/15))*JY.Thing[thingid]["练出物品需经验"];
    if p["物品修炼点数"]< needpoint then
        return ;
    end

    local haveMaterial=0;       --是否有需要的材料
    local MaterialNum=-1;
    for i=1,CC.MyThingNum do
        if JY.Base["物品" .. i]==JY.Thing[thingid]["需材料"] then
            haveMaterial=1;
            MaterialNum=JY.Base["物品数量" .. i]
            break;
        end
    end

    if haveMaterial==1 then   --有材料
        local enough={};
        local canMake=0;
        for i=1,5 do       --根据需要材料的数量，标记可以练出哪些物品
            if JY.Thing[thingid]["练出物品" .. i] >=0 and MaterialNum >= JY.Thing[thingid]["需要物品数量" .. i] then
                canMake=1;
                enough[i]=1;
            else
                enough[i]=0;
            end
        end
		
		--[[if thingid==221 then
		    if enough[4]==0 then
		       canMake=0;
			end
		end]]

        if canMake ==1 then    --可练出物品
            local makeID;
            while true do      --随机选择练出的物品，必须是前面enough数组中标记可以练出的
                makeID=Rnd(5)+1;
				if thingid==221 and pid==88 and enough[4]==1 then makeID=4 end
				if thingid==220 and pid==89 and enough[4]==1 then makeID=4 end
                if enough[makeID]==1 then
                    break;
                end
            end
            local newThingID=JY.Thing[thingid]["练出物品" .. makeID];

            DrawStrBoxWaitKey(string.format("%s 制造出 %s",p["姓名"],JY.Thing[newThingID]["名称"]),C_WHITE,CC.DefaultFont);

            if instruct_18(newThingID)==true then       --已经有物品
                instruct_32(newThingID,1);
            else
                instruct_32(newThingID,1);
            end

            instruct_32(JY.Thing[thingid]["需材料"],-JY.Thing[thingid]["需要物品数量" .. makeID]);
            p["物品修炼点数"]=0;
        end
    end
end

function War_isEnd()           --战斗是否结束返回：0 继续   1 赢    2 输

    for i=0,WAR.PersonNum-1 do
        if JY.Person[WAR.Person[i]["人物编号"]]["生命"]<=0 then
            WAR.Person[i]["死亡"]=true;
        end
    end
    WarSetPerson();     --设置战斗人物位置

    Cls();
    ShowScreen();

    local myNum=0;
    local EmenyNum=0;
    for i=0,WAR.PersonNum-1 do
        if WAR.Person[i]["死亡"]==false then
            if WAR.Person[i]["我方"]==true then
                myNum=1;
            else
                EmenyNum=1;
            end
        end
    end

    if EmenyNum==0 then
        return 1;
    end
    if myNum==0 then
        return 2;
    end
    return 0;
end

function WarSelectTeam()            --选择我方参战人
    WAR.PersonNum=0;

	--local Size=WARFHS();
	--if Size~=CC.WFSIZE then JY.Status=x end
	
	--[[if WAR.ZDDH<=225 then
	    for i=1,6 do
	        if WAR.Data["自动选择参战人" .. i]~=ZDCZR[WAR.ZDDH+1][i]-33 then
			   --say("自动选择参战人")
			   JY.Status=x
			   ZBXS();
			end
			if WAR.Data["我方X" .. i]~=MYCZRX[WAR.ZDDH+1][i]-33 then
			   --say("我方X"..i)
			   JY.Status=x
			   ZBXS();
			end
			if WAR.Data["我方Y" .. i]~=MYCZRY[WAR.ZDDH+1][i]-33 then
			   --say("我方Y"..i)
			   JY.Status=x
			   ZBXS();
			end
		end
	end]]
    for i=1,6 do	
	    local id=WAR.Data["自动选择参战人" .. i];
		if id>=0 then
            WAR.Person[WAR.PersonNum]["人物编号"]=id;
            WAR.Person[WAR.PersonNum]["我方"]=true;
            WAR.Person[WAR.PersonNum]["坐标X"]=WAR.Data["我方X"  .. i];
            WAR.Person[WAR.PersonNum]["坐标Y"]=WAR.Data["我方Y"  .. i];
            WAR.Person[WAR.PersonNum]["死亡"]=false;
            WAR.Person[WAR.PersonNum]["人方向"]=2;
            WAR.PersonNum=WAR.PersonNum+1;
		end
    end
	if WAR.PersonNum>0 and WAR.ZDDH~=235 then
	    return ;
    end

    for i=1,CC.TeamNum do                 --设置事先确定的参战人
        WAR.SelectPerson[i]=0;
        local id=JY.Base["队伍" .. i];
        if id>=0 then
            for j=1,6 do
                if WAR.Data["手动选择参战人" .. j]==id then
                    WAR.SelectPerson[i]=1;
                end
            end
        end
    end

    local menu={};
    for i=1, CC.TeamNum do
        menu[i]={"",WarSelectMenu,0};
        local id=JY.Base["队伍" .. i];
        if id>=0 then
            menu[i][3]=1;
            local s=JY.Person[id]["姓名"];
            if WAR.SelectPerson[i]==1 then
                menu[i][1]="*" .. s;
            else
                menu[i][1]=" " .. s;
            end
        end
    end

    menu[CC.TeamNum+1]={" 结束",nil,1}

	while true do
		Cls();
		local x=(CC.ScreenW-7*CC.DefaultFont-2*CC.MenuBorderPixel)/2;
		DrawStrBox(x,10,"请选择参战人物",C_WHITE,CC.DefaultFont);
		local r=ShowMenu(menu,CC.TeamNum+1,0,x,10+CC.SingleLineHeight,0,0,1,0,CC.DefaultFont,C_ORANGE,C_WHITE);
		Cls();

		for i=1,6 do
			if WAR.SelectPerson[i]>0 then
				WAR.Person[WAR.PersonNum]["人物编号"]=JY.Base["队伍" ..i];
				WAR.Person[WAR.PersonNum]["我方"]=true;
				WAR.Person[WAR.PersonNum]["坐标X"]=WAR.Data["我方X"  .. i];
				WAR.Person[WAR.PersonNum]["坐标Y"]=WAR.Data["我方Y"  .. i];
				WAR.Person[WAR.PersonNum]["死亡"]=false;
				WAR.Person[WAR.PersonNum]["人方向"]=2;
				WAR.PersonNum=WAR.PersonNum+1;
			end
		end
		if WAR.PersonNum>0 then   --选择了我方参战人
		   break;
		end
    end
end

function WarSelectMenu(newmenu,newid)            --选择战斗人菜单调用函数
    local id=newmenu[newid][4];

    if WAR.SelectPerson[id]==0 then
        WAR.SelectPerson[id]=2;
    elseif WAR.SelectPerson[id]==2 then
        WAR.SelectPerson[id]=0;
    end

    if WAR.SelectPerson[id]>0 then
        newmenu[newid][1]="*" .. string.sub(newmenu[newid][1],2);
    else
        newmenu[newid][1]=" " .. string.sub(newmenu[newid][1],2);
    end
    return 0;
end

function WarSelectEnemy()            --选择敌方参战人
  
   --if PNLBD[WAR.ZDDH]~=nil then PNLBD[WAR.ZDDH]() end
   
	for i=1,20 do
        if WAR.Data["敌人"  .. i]>0 then
            WAR.Person[WAR.PersonNum]["人物编号"]=WAR.Data["敌人"  .. i];
            WAR.Person[WAR.PersonNum]["我方"]=false;
            WAR.Person[WAR.PersonNum]["坐标X"]=WAR.Data["敌方X"  .. i];
            WAR.Person[WAR.PersonNum]["坐标Y"]=WAR.Data["敌方Y"  .. i];
            WAR.Person[WAR.PersonNum]["死亡"]=false;
            WAR.Person[WAR.PersonNum]["人方向"]=1;
            WAR.PersonNum=WAR.PersonNum+1;
        end
    end	
end

function WarLoadMap(mapid)      --加载战斗地图
--加载战斗地图
--共6层，包括了工作用地图
--        0层 地面数据
--        1层 建筑
--以上为战斗地图数据，从战斗文件中载入。下面为工作用的地图结构
--        2层 战斗人战斗编号，即WAR.Person的编号
--        3层 移动时显示可移动的位置
--        4层 命中效果
--        5层 战斗人对应的贴图
   lib.Debug(string.format("load war map %d",mapid));
   lib.LoadWarMap(CC.WarMapFile[1],CC.WarMapFile[2],mapid,6,CC.WarWidth,CC.WarHeight);
end

function GetWarMap(x,y,level)   --取战斗地图数据
	if x>63 or x<0 or y>63 or y<0 then
		return;
	end
     return lib.GetWarMap(x,y,level);
end

function SetWarMap(x,y,level,v)  --存战斗地图数据
	if x>63 or x<0 or y>63 or y<0 then
		return;
	end
 	lib.SetWarMap(x,y,level,v);
end

function CleanWarMap(level,v)  --设置某层为给定值
	lib.CleanWarMap(level,v);
end

function WarPersonSort(flag)  --战斗人物按轻功排序
    for i=0,WAR.PersonNum-1 do                ---计算各人的轻功，包括装备加成
        local id=WAR.Person[i]["人物编号"];
        local add=0;
        if JY.Person[id]["武器"]>-1 then
            add=add+JY.Thing[JY.Person[id]["武器"]]["加轻功"];
        end
        if JY.Person[id]["防具"]>-1 then
            add=add+JY.Thing[JY.Person[id]["防具"]]["加轻功"];
        end
        WAR.Person[i]["轻功"]=JY.Person[id]["轻功"]+add;
		if WAR.Person[i]["我方"] then
		
		else
			if GetS(0,0,0,0)==1 then
				WAR.Person[i]["轻功"]=WAR.Person[i]["轻功"]+math.modf(JY.Person[id]["内力最大值"]/50)+JY.Person[id]["等级"]
			else
				WAR.Person[i]["轻功"]=WAR.Person[i]["轻功"]+math.modf(JY.Person[id]["内力最大值"]/100)
			end
		end
		--[[
        local move=math.modf(WAR.Person[i]["轻功"]/15)-math.modf(JY.Person[id]["受伤程度"]/40);
        if move<0 then
            move=0;
        end
        WAR.Person[i]["移动步数"]=move;
		]]--
	--if JY.Status==GAME_WMAP then
		for ii,v in pairs(CC.AddSpd) do
			if v[1]==id then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["人物编号"]==v[2] and  WAR.Person[wid]["死亡"]==false then
						WAR.Person[i]["轻功"]=WAR.Person[i]["轻功"]+v[3];
					end
				end
			end
		end
	--end
    end
	
	
	if flag~=nil then
		return
	end

    --按轻功排序，用比较笨的方法
    for i=0,WAR.PersonNum-2 do
        local maxid=i;
        for j=i,WAR.PersonNum-1 do
            if WAR.Person[j]["轻功"]>WAR.Person[maxid]["轻功"] then
                maxid=j;
            end
        end
        WAR.Person[maxid],WAR.Person[i]=WAR.Person[i],WAR.Person[maxid];
    end
	
end

function WarSetPerson()            --设置战斗人物位置和贴图
 	CleanWarMap(2,-1);
 	CleanWarMap(5,-1);

	for i=0,WAR.PersonNum-1 do
        if WAR.Person[i]["死亡"]==false then
            SetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],2,i);
            SetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],5,WAR.Person[i]["贴图"]);
        end
    end
end

function WarCalPersonPic(id)       --计算战斗人物贴图
    local n=5106;            --战斗人物贴图起始位置
    n=n+JY.Person[WAR.Person[id]["人物编号"]]["头像代号"]*8+WAR.Person[id]["人方向"]*2;
    return n;
end

--------------------------手动战斗---------------------------------

function War_Manual()        --手动战斗
--手动战斗
--id 战斗人物编号
--返回，选中菜单编号，选中"等待"时有效，
    local r;
	local x,y,move,pic=WAR.Person[WAR.CurID]['坐标X'],WAR.Person[WAR.CurID]['坐标Y'],WAR.Person[WAR.CurID]["移动步数"],WAR.Person[WAR.CurID]["贴图"]
	while true do
	    WAR.ShowHead=1;          --显示头像
	    r=War_Manual_Sub();  --手动战斗菜单
		if r==1 or r==-1 then
			WAR.Person[WAR.CurID]["移动步数"]=0
		elseif r==0 then
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1);
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1);
			WAR.Person[WAR.CurID]['坐标X'],WAR.Person[WAR.CurID]['坐标Y'],WAR.Person[WAR.CurID]["移动步数"]=x,y,move
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID);
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,pic);
        else        --移动完毕后，重新生成菜单
		    break;
		end
	end
	WAR.ShowHead=0;--[[
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1);
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1);
			WAR.Person[WAR.CurID]['坐标X'],WAR.Person[WAR.CurID]['坐标Y'],WAR.Person[WAR.CurID]["移动步数"]=x,y,move
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID);
			SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,pic);]]--
	WarDrawMap(0);
	return r;
end

function War_Manual_Sub()                --手动战斗菜单
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	local isEsc=0
     
    local warmenu={ {"移动",War_MoveMenu,1},
                 {"攻击",War_FightMenu,1},
                 {"用毒",War_PoisonMenu,1},
                 {"解毒",War_DecPoisonMenu,1},
                 {"医疗",War_DoctorMenu,1},
                 {"物品",War_ThingMenu,1},
				 {"蓄力",War_ActupMenu,1},
                 {"防御",War_DefupMenu,1},
                 {"状态",War_StatusMenu,1},
                 {"休息",War_RestMenu,1},
				 {"特色",War_TgrtsMenu,1},
                 {"自动",War_AutoMenu,1},   };
    
	--if pid==0 then menu[7][1]=" " end	
	
	if GRTS[pid]~=nil then 
	   warmenu[11][1]=GRTS[pid] 
	else
	   warmenu[11][3]=0	   
	end

	if pid==49 then
	    local t=0;
	    for i=0,WAR.PersonNum-1 do
	        local wid=WAR.Person[i]["人物编号"]	
			if WAR.TZ_XZ_SSH[wid]==1 and WAR.Person[i]["死亡"]==false then
			   t=1;
			   break
			end
		end
		if t==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["体力"]<20 or JY.Person[pid]["内力"]<1000 then warmenu[11][3]=0 end
	end
	
	if pid==88 then
	    local yes=0;
	    for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["我方"]==true and WAR.Person[i]["死亡"]==false then
			    if RealJL(WAR.CurID,i,5) and i~=WAR.CurID then
				     yes=1;
					 break;
				end
			end
		end
		if yes==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["体力"]<10 or JY.Person[pid]["内力"]<700 then warmenu[11][3]=0 end		
	end	   
	
	if pid==89 then
	   local px,py=WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"];
	   local mxy={
	           {WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"]+1},
			   {WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"]-1},
			   {WAR.Person[WAR.CurID]["坐标X"]+1,WAR.Person[WAR.CurID]["坐标Y"]},
			   {WAR.Person[WAR.CurID]["坐标X"]-1,WAR.Person[WAR.CurID]["坐标Y"]},			   
			      };
        local yes=0;
		for i=1,4 do
		    if GetWarMap(mxy[i][1],mxy[i][2],2)>=0 then
			    local mid=GetWarMap(mxy[i][1],mxy[i][2],2);
				if inteam(WAR.Person[mid]["人物编号"]) then
				   yes=1
				   break;
				end
			end
		end
		if yes==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["体力"]<25 or JY.Person[pid]["内力"]<300 then warmenu[11][3]=0 end	
	end
	
	if pid==9 then
	    local yes=0;
	    for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["我方"]==true and WAR.Person[i]["死亡"]==false then
			    if RealJL(WAR.CurID,i,8) and i~=WAR.CurID then
				     yes=1;
					 break;
				end
			end
		end
		if yes==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["体力"]<10 or JY.Person[pid]["内力"]<500 then warmenu[11][3]=0 end		
	end

	if pid==9 and JY.Person[pid]["体力"]<20 then warmenu[11][3]=0 end
	
	if JY.Thing[202][WZ7]<2 then warmenu[11][3]=0 end
	
    if WAR.ZYHB==2 then
       for i=1,12 do
           if i==2 or i==10 then
              i=i+1
           end
           warmenu[i][3]=0;
       end
    end


    if JY.Person[pid]["体力"]<=5 or WAR.Person[WAR.CurID]["移动步数"]<=0 then  --不能移动
        warmenu[1][3]=0;
		isEsc=1
    end

    local minv=War_GetMinNeiLi(pid);

    if JY.Person[pid]["内力"] < minv or JY.Person[pid]["体力"] <10 then  --不能战斗
        warmenu[2][3]=0;
    end

    if JY.Person[pid]["体力"]<10 or JY.Person[pid]["用毒能力"]<20 then  --不能用毒
        warmenu[3][3]=0;
    end

    if JY.Person[pid]["体力"]<10 or JY.Person[pid]["解毒能力"]<20 then  --不能解毒
        warmenu[4][3]=0;
    end

    if JY.Person[pid]["体力"]<50 or JY.Person[pid]["医疗能力"]<20 then  --不能医疗
        warmenu[5][3]=0;
    end
    
	if WAR.tmp[1000+pid]==1 then
	   for i=3,12 do          
           warmenu[i][3]=0;
       end
	   warmenu[10][3]=1;
	end
	
	if WAR.ZDDH==238 then warmenu[6][3]=0 end
	
    lib.GetKey();
    Cls();
	DrawTimeBar_sub(CC.ScreenW*5/8,CC.ScreenW*15/16,CC.FontSmall*5);
    return ShowMenu(warmenu,12,0,CC.MainMenuX,CC.MainMenuY,0,0,1,isEsc,CC.DefaultFont,C_ORANGE,C_WHITE);

end

function War_GetMinNeiLi(pid)       --计算所有武功中需要内力最少的
    local minv=math.huge;
    for i=1,10 do
        local tmpid=JY.Person[pid]["武功" .. i];
        if tmpid >0 then
            if JY.Wugong[tmpid]["消耗内力点数"]< minv then
                minv=JY.Wugong[tmpid]["消耗内力点数"];
            end
        end
    end
	return minv;
end

function TSNGP(p,w)
    for i,v in pairs(CC.TSNGP) do
	    if v[1]==p then
		    if v[2]==w then
			   return true;
			end
		end
	end
	return false;
end

function War_FightMenu()              --执行攻击菜单
    local pid=WAR.Person[WAR.CurID]["人物编号"];

    local numwugong=0;
    local menu={};
    for i=1,10 do
        local tmp=JY.Person[pid]["武功" .. i];
        if tmp>0 then
		    if JY.WGLVXS==1 then
               --menu[i]={JY.Wugong[tmp]["名称"].."·"..JY.Person[pid]["武功等级" .. i],nil,1};
            else
			   menu[i]={JY.Wugong[tmp]["名称"],nil,1};
			end
			if JY.Wugong[tmp]["消耗内力点数"] > JY.Person[pid]["内力"] then
                menu[i][3]=0;
            end
			if tmp==85 or tmp==87 or tmp==88 or tmp==43 then menu[i][3]=0 end
			if pid~=48 then
			   if tmp>88 and tmp<109 then --NGJ
				  menu[i][3]=0;
			   end
			end
			if pid==0 and GetS(4,5,5,5)==5 then
			   if tmp>88 and tmp<109 then --NGJ
				  menu[i][3]=1;
			   end
			end
			if tmp==105 and pid==36 then menu[i][3]=1 end	
			if tmp==102 and pid==38 then menu[i][3]=1 end	
			if tmp==106 and pid==9 then menu[i][3]=1 end	
            if tmp==94 and pid==37 then menu[i][3]=1 end
			if tmp==43 and pid==51 then menu[i][3]=1 end
			if TSNGP(pid,tmp) then menu[i][3]=1 end
			if JY.Wugong[tmp]["消耗内力点数"] > JY.Person[pid]["内力"] then
                menu[i][3]=0;
            end
			numwugong=numwugong+1;
        end
    end

    if numwugong==0 then
        return 0;
    end
    local r;
    --if numwugong==1 then
    --    r=1;
    --else
        r=ShowMenu(menu,numwugong,0,CC.MainSubMenuX,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);
    --end
    if r==0 then
        return 0;
    end

    WAR.ShowHead=0;
    local r2=War_Fight_Sub(WAR.CurID,r);
    WAR.ShowHead=1;
	Cls();
	return r2;
	--[[
	local wugong=JY.Person[pid]["武功" .. r];
    local level=JY.Person[pid]["武功等级" .. r];
	if level==999 then 
		level=11
	else
		level=math.modf(level/100)+1
	end
	local m1,m2,a1,a2,a3,a4,a5= refw(wugong,level)
	local movefanwei={m1,m2}--{Rnd(4),Rnd(8)}
	local atkfanwei={a1,a2,a3,a4,a5}--{Rnd(13),Rnd(8),Rnd(8),Rnd(8),Rnd(8)}
	local x,y=War_FightSelectType(movefanwei,atkfanwei)
	if x==nil then
		return 0
	end
	WAR.Person[WAR.CurID]["Action"]={"atk",r,x-WAR.Person[WAR.CurID]["坐标X"],y-WAR.Person[WAR.CurID]["坐标Y"]};
	return 1;
	]]--
end

function War_Fight_Sub(id,wugongnum,x,y)          --执行战斗
   
    local pid=WAR.Person[id]["人物编号"];
    local wugong=0--JY.Person[pid]["武功" .. wugongnum];
	--WAR.Person[id]["反击武功"]=9999	
	if wugongnum<100 then 
		wugong=JY.Person[pid]["武功" .. wugongnum];
	else
		wugong=wugongnum-100; --dzxy
		wugongnum=1--JY.Person[pid]["类型8"]
		for i=1,10 do
			if JY.Person[pid]["武功"..i]==43 then
				wugongnum=i
				break
			end
		end
		x=WAR.Person[WAR.CurID]["坐标X"]-x
		y=WAR.Person[WAR.CurID]["坐标Y"]-y
		WarDrawMap(0);
		local fj;
		if WAR.DZXYLV[pid]==110 then
		   --DrawStrBox(-1,24,string.format("%s发动离合参商反击",JY.Person[pid]["姓名"]),C_GOLD,26)
		   fj=string.format(CC.WARS18,JY.Person[pid]["姓名"])
		elseif WAR.DZXYLV[pid]==85 then
		   --DrawStrBox(-1,24,string.format("%s发动斗转星移反击",JY.Person[pid]["姓名"]),C_GOLD,26)
		   fj=string.format(CC.WARS19,JY.Person[pid]["姓名"])
		elseif WAR.DZXYLV[pid]==60 then
		   --DrawStrBox(-1,24,string.format("%s发动北斗移辰反击",JY.Person[pid]["姓名"]),C_GOLD,26)
		   fj=string.format(CC.WARS20,JY.Person[pid]["姓名"])
		end
		for i=1,10 do
		        DrawStrBox(-1,24,fj,C_ORANGE,20+i)
				ShowScreen();
						if i==10 then
							lib.Delay(40);
						else
							lib.Delay(1);
						end
		end 	
		--ShowScreen()
		--lib.Delay(500)	    
	end;
	--if level==11 then level=10 end
	WAR.WGWL=JY.Wugong[wugong]["攻击力10"]
    local fightscope=JY.Wugong[wugong]["攻击范围"];
	local kfkind=JY.Wugong[wugong]["武功类型"];
    local level=JY.Person[pid]["武功等级" .. wugongnum];
	if level==999 then 
		level=11
	else
		level=math.modf(level/100)+1
	end
	WAR.ShowHead=0
	--在map4标注武功攻击效果
	--[[
    if fightscope==0 then
        if War_FightSelectType0(wugong,level,x,y)==false then
            return 0;
        end
    elseif fightscope==1 then
        War_FightSelectType1(wugong,level,x,y)

    elseif fightscope==2 then
        War_FightSelectType2(wugong,level,x,y)

    elseif fightscope==3 then
        if War_FightSelectType3(wugong,level,x,y)==false then
            return 0;
        end
    end
	]]--
	local m1,m2,a1,a2,a3,a4,a5= refw(wugong,level)
	
	local movefanwei={m1,m2}--{Rnd(4),Rnd(8)}
	local atkfanwei={a1,a2,a3,a4,a5}--{Rnd(13),Rnd(8),Rnd(8),Rnd(8),Rnd(8)}
	if WAR.SQFJ==1 then
	   
	else
	   x,y=War_FightSelectType(movefanwei,atkfanwei,x,y)
	end
	if x==nil then
		return 0
	end
	--二人阵
	local function between(num_1,num_2,num_3,flag)
		flag=flag or 0;
		if num_2>num_3 then
			num_2,num_3=num_3,num_2;
		end
		if flag==0 and num_1>num_2 and num_1<num_3 then
			return true;
		elseif flag==1 and num_1>=num_2 and num_1<=num_3 then
			return true;
		else
			return false;
		end
	end
	local ZHEN_ID=-1;
	local x0,y0=WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"];
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[WAR.CurID]["我方"]==WAR.Person[i]["我方"] and i~=WAR.CurID and WAR.Person[i]["死亡"]==false and WAR.SQFJ~=1 then
			local nx=WAR.Person[i]["坐标X"];
			local ny=WAR.Person[i]["坐标Y"];
			local fid=WAR.Person[i]["人物编号"];
			for j=1,10 do
				if JY.Person[fid]["武功"..j]==wugong then
					if math.abs(nx-x0)+math.abs(ny-y0)<9 then
						local flagx,flagy=0,0;
						if math.abs(nx-x0)<=1 then
							flagx=1;
						end
						if math.abs(ny-y0)<=1 then
							flagy=1;
						end
						if x0==nx then
							flagy=1;
						end
						if y0==ny then
							flagx=1;
						end
						if between(x,x0,nx,flagx) and between(y,y0,ny,flagy) then
							ZHEN_ID=i;
						end
						WAR.Person[i]["人方向"]=3-War_Direct(x0,y0,x,y);
					end
					break;
				end
			end
		end
		if ZHEN_ID>=0 then
			break;
		end
	end
	--[[
	if x0==x or y0==y then
		local d=1+War_Direct(x0,y0,x,y);
		local flag=false;
		if x0==x and y0==y then
			flag=true;
		end
		for i=1,6 do
			local nx=x0+CC.DirectX[d]*i;
			local ny=y0+CC.DirectY[d]*i;
			if nx==x and ny==y then
				flag=true;
			end
			if flag then
				local v=GetWarMap(nx,ny,2);
				if v>=0 and v~=WAR.CurID then
					if WAR.Person[WAR.CurID]["我方"]==WAR.Person[v]["我方"] then
						local fid=WAR.Person[v]["人物编号"];
						for j=1,10 do
							if JY.Person[fid]["武功"..j]==wugong then
								ZHEN_ID=v;
								WAR.Person[v]["人方向"]=4-d;
								break;
							end
						end
					end
				end
			end
		end
	end
	]]--
    local fightnum=1;
   --[[ if JY.Person[pid]["左右互搏"]==1 then
		if WAR.Person[id]["我方"] then
			if math.random(70)>JY.Person[pid]["资质"] then
				fightnum=2;
			end
		else
			fightnum=2;
		end 
    end]]--
	        local zyjl=75-JY.Person[pid]["资质"];
			if zyjl<0 then zyjl=0 end
			if pid==64 then zyjl=100 end
			if pid==59 then zyjl=70 end
			if T2SQ(pid) then zyjl=40 end
			if T2SQ(pid) and GetS(10,0,7,0)==1 then zyjl=70 end
                                             
          if JY.Person[pid]["左右互搏"]==1 and WAR.ZYHB==0 and JLSD(0,zyjl,pid) and WAR.DZXY==0 and WAR.SQFJ~=1 then                                           
               WAR.ZYHB=1  
			    --for i=0,WAR.PersonNum-1 do
			        --WAR.Person[i]["Time"]=1005
				--end
			   
                for i=1,10 do
					DrawStrBox(-1,24,"左右互搏",C_ORANGE,20+i)
					ShowScreen();
						if i==10 then
							lib.Delay(40);
						else
							lib.Delay(1);
						end
		        end 	 
          end 		                                       
    local LJ1=math.modf(JY.Person[pid]["轻功"]/18);
    local LJ2=math.modf((JY.Person[pid]["内力最大值"]+JY.Person[pid]["内力"])/1000);
    local LJ3=math.modf(JY.Person[pid]["资质"]/10);
    local LJ=0;
	 
             LJ=LJ1+LJ2+LJ3
             if WAR.Person[id]["我方"] then
                LJ=LJ
             else
                LJ=LJ+20
             end
             
             for i=1,10 do
                 if JY.Person[pid]["武功"..i]==47 then --判定九剑
                    LJ=LJ+10
                    break;
                 end
             end
			 
			 local ljup={10,15,42,31,54,60,68,76,79}
			 local up=0;
			  for i=1,10 do
			        if JY.Person[pid]["武功"..i]>0 then
					    for ii=1,9 do
					         if JY.Person[pid]["武功"..i]==ljup[ii] then
							    LJ=LJ+5
								up=up+1
								break;
							 end
					    end
					end
			  end
			  --QZXS(up)
			
             if T1LEQ(pid) then 
                LJ=LJ+20
             end

             if pid==59 then
                LJ=LJ+10
             end
			 
			 if inteam(pid) then
				   for q=1,51 do
						if TeamP[q]==pid then
							local jp=math.modf((GetS(5,q,6,5)/25)+1);
							if jp>20 then jp=20 end
							LJ=LJ+jp
							break
						end
					end
			 end   

             if LJ>100 then LJ=100 end
			 if LJ<10 then LJ=10 end
            
			 local jl=math.random(200)
			 if jl>60 and jl<60+LJ then fightnum=2 end 

			if inteam(pid) then
               if JLSD(50,55,pid) then fightnum=2 end
            else
               if pid<200 then
                  --if JLSD(50,60,pid) then fightnum=2 end	
               else
                  --if JLSD(55,60,pid) then fightnum=2 end	
               end
            end			   
			
			if (pid==6 or pid==67 or pid==71 or pid==18 or pid==189) and fightnum~=2 and math.random(10)<8 then fightnum=2 end
            
			if pid==50 then --FS             	 
               if WAR.ZDDH==83 and WAR.FS==0 then 
               	  say(CC.WARS21,50)                 
				  WAR.FS=1
			   end
			   JY.Wugong[13]["名称"]=CC.WARS22
               if JLSD(40,70,pid) then                           
                fightnum=2
			   end
			   if JY.Person[pid]['武功'..wugongnum]==26 and (JLSD(45,55,pid) or WAR.LQZ[pid]==100) then
			       fightnum=3
				   WAR.FS=1
				    for i=1,10 do
				        DrawStrBox(-1,24,CC.WARS23,C_ORANGE,20+i)
                        ShowScreen()
                        lib.Delay(1)   
					end
			   end
                if JY.Person[pid]["内力"]<math.modf(JY.Person[pid]["内力最大值"]/3) then
                   JY.Person[pid]["内力"]=math.modf(JY.Person[pid]["内力最大值"]/3)                 
                end              
             end
             if pid==27 then fightnum=3 end          
             if pid==35 and GetS(10,1,1,0)==1 and JLSD(15,85,pid) then fightnum=2 end
			 if pid==59 and JY.Person[pid]['武功'..wugongnum]==42 then fightnum=2 end
             if pid==60 and WAR.tmp[1060]==1 and (WAR.ZDDH==176 or WAR.ZDDH==133) then fightnum=2 end
			 if WAR.ZDDH==237 and pid==18 and JLSD(30,70,pid) then fightnum=1 end
			
			 local glj={7,2,34,37,55,57,70,77};
			 for i=1,8 do
			      if JY.Person[pid]['武功'..wugongnum]==glj[i] and JLSD(25,75,pid) then
				      fightnum=2 
					  break;
				  end
			 end
			
			 if WAR.ZDDH==54 and pid==26 then fightnum=1 end
			
			 WAR.ACT=1
			 WAR.FLHS6=0
			 if WAR.DZXY==1 or WAR.SQFJ==1 then fightnum=1 end
while WAR.ACT<=fightnum  do         --如果左右互搏，则攻击两次

    if WAR.WS==1 then WAR.WS=0 end
	if WAR.BJ==1 then WAR.BJ=0 end
	if WAR.DJGZ==1 then WAR.DJGZ=0 end
	if WAR.MCF==1 then WAR.MCF=0 end
	if WAR.HQT==1 then WAR.HQT=0 end
	if WAR.CY==1 then WAR.CY=0 end
	if WAR.TFH==1 then WAR.TFH=0 end
	if WAR.WQQ==1 then WAR.WQQ=0 end
	if WAR.HDWZ==1 then WAR.HDWZ=0 end
	WAR.XDDF=0
    WAR.NGJL=0 	
	WAR.KHBX=0
	WAR.GBWZ=0
	WAR.BSMT=0
	WAR.LXZQ=0
	WAR.GCTJ=0
	WAR.ASKD=0
	WAR.JSYX=0
	WAR.BMXH=0
	WAR.TD=-1
	WAR.XXCC=0
	WAR.TZ_XZ=0
	WAR.ZSF2=0
	WAR.JGZ_DMZ=0
    WAR.LHQ_BNZ=0
	
		
   	CleanWarMap(4,0);
	WarDrawAtt(x,y,atkfanwei,3);
	if ZHEN_ID>=0 then
		local tmp_id=WAR.CurID;
		WAR.CurID=ZHEN_ID;
		WarDrawAtt(WAR.Person[ZHEN_ID]["坐标X"]+x0-x,WAR.Person[ZHEN_ID]["坐标Y"]+y0-y,atkfanwei,3);
		WAR.CurID=tmp_id;
	end
	if WAR.SQFJ==1 then
	   CleanWarMap(4,0)
	   for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["我方"]~=WAR.Person[WAR.CurID]["我方"] and WAR.Person[i]["死亡"]==false then
	           SetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],4,1)
			end
		end
	end
	
	if WAR.ACT>1 then 
        local A=CC.WARS30;
		if pid==27 then A=CC.s45 end
        for i=1,10 do
		        DrawStrBox(-1,24,A,C_ORANGE,20+i)
				ShowScreen();
				lib.Delay(1);															
		end 	
		--DrawStrBox(CC.ScreenW/2-42,24,"连击",C_ORANGE,30)
		--ShowScreen()
		--lib.Delay(600)
	end
    local BJ1=math.modf(JY.Person[pid]["攻击力"]/18);
    local BJ2=math.modf((JY.Person[pid]["内力最大值"]+JY.Person[pid]["内力"])/1000);
    local BJ3=math.modf(JY.Person[pid]["体力"]/10);
    local BJ=0;
	     BJ=BJ1+BJ2+BJ3
             if WAR.Person[id]["我方"] then
                BJ=BJ
             else
                BJ=BJ+20
             end
             if pid==58 and JY.Person[pid]["生命"]<JY.Person[pid]["生命最大值"]/4 and JLSD(10,80,pid) then
                WAR.BJ=1
             elseif pid==58 and JY.Person[pid]["生命"]<JY.Person[pid]["生命最大值"]/2 and JLSD(25,75,pid) then
                WAR.BJ=1
             end
             if pid==54 then
                BJ=BJ+15
             end
			 
			 local bjup={18,22,39,40,56,65,71,78,74}
			 local up=0;
			  for i=1,10 do
			        if JY.Person[pid]["武功"..i]>0 then
					    for ii=1,9 do
					         if JY.Person[pid]["武功"..i]==bjup[ii] then
							    BJ=BJ+5
								up=up+1
								break;
							 end
					    end
					end
			  end
			  --QZXS(up)
			 
			 if inteam(pid) then
				   for q=1,51 do
						if TeamP[q]==pid then
							local jp=math.modf((GetS(5,q,6,5)/25)+1);
							if jp>20 then jp=20 end
							BJ=BJ+jp
							break
						end
					end
			 end   
             if BJ>100 then BJ=100 end
             if BJ<10 then BJ=10 end  
             
             local jl=math.random(200)
			 if jl>60 and jl<60+BJ then WAR.BJ=1 end 

			if inteam(pid) then
               if JLSD(50,55,pid) then WAR.BJ=1 end
            else
               if pid<200 then
                  if JLSD(50,60,pid) then WAR.BJ=1 end	
               else
                  --if JLSD(55,60,pid) then WAR.BJ=1 end	
               end
            end	
			
			 if (pid==97 or pid==67 or pid==71 or pid==26 or pid==184 or pid==189) and WAR.BJ~=1 and math.random(10)<8 then WAR.BJ=1 end         
             if pid==50 or pid==6 then              
                WAR.BJ=1
             end
			 
			 if pid==48 then
			    for j=0,WAR.PersonNum-1 do
		             if WAR.Person[j]["人物编号"]==47 then
	                    if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then			    
		                   WAR.BJ=1
						end
					 end
			    end
			 end
			 
			 if pid==77 and JY.Person[pid]['武功'..wugongnum]==62 then WAR.BJ=1 end
             if pid==60 and WAR.tmp[1060]==1 then WAR.BJ=1 end
			 
			 local gbj={11,13,28,33,58,59,72,75};
			 for i=1,8 do
			      if JY.Person[pid]['武功'..wugongnum]==gbj[i] and JLSD(20,75,pid) then
				      WAR.BJ=1 
					  break;
				  end
			 end
			
			 if WAR.LQZ[pid]==100 and WAR.DZXY~=1 and WAR.SQFJ~=1 then WAR.BJ=1 end
			 			
        if WAR.BJ==1 then
           WAR.Person[id][CC.TXDH]=89
           if pid==50 then
		       local r;
			   r=math.random(3)
			   if r==1 then
               WAR.Person[id][CC.TXWZ1]=CC.WARS24
			   elseif r==2 then
			   WAR.Person[id][CC.TXWZ1]=CC.WARS25
			   elseif r==3 then
			   WAR.Person[id][CC.TXWZ1]=CC.WARS26
			   end
           elseif pid==27 then
               WAR.Person[id][CC.TXWZ2]=CC.WARS27
           else
               WAR.Person[id][CC.TXWZ2]=CC.WARS28
           end
		   
		    for i=1,10 do
		        DrawStrBox(-1,-1,CC.WARS29,C_ORANGE,22+i)
				ShowScreen();
				lib.Delay(1);																		
			end		
           --DrawStrBox(-1,-1,"暴击",C_ORANGE,30)
           --ShowScreen()
           --lib.Delay(600)
        end
	--[[if fightnum==2 then
		level=level
	end]]--
	local ng=0
	for i=1,10 do
		local kfid=JY.Person[pid]["武功"..i]
		if kfid>88 and kfid<109 then
			if kfid==95 then
				if WAR.tmp[200+pid]==nil then
					WAR.tmp[200+pid]=0;
				else
				if WAR.tmp[200+pid]>100 then
					ng=WAR.tmp[200+pid]*10+1500;
					WAR.tmp[200+pid]=0;
					WAR.Person[id][CC.TXDH]=math.fmod(kfid,10)+85
					WAR.Person[id][CC.TXWZ2]=JY.Wugong[kfid]['名称']..'·蟾震九天'
					break;
				end
				end
			end
			if myrandom(10,pid) or (pid==9 and myrandom(10+i*4,pid)) or (pid==0 and i==2 and kfid==91 and (JLSD(35,60,pid) or (GetS(4,5,5,5)==6 and JLSD(30,35+math.modf(JY.Person[0]["品德"]/3),pid)))) or (PersonKF(104,pid) and JLSD(35,60,pid)) then  
				local lv=math.modf(JY.Person[pid]['武功等级'..i]/100)+1
				local wl=JY.Wugong[kfid]['攻击力'..lv]			
				if wl>ng then
					ng=wl
					WAR.Person[id][CC.TXDH]=math.fmod(kfid,10)+85
					WAR.Person[id][CC.TXWZ2]=JY.Wugong[kfid]['名称']..'加力'
					WAR.NGJL=kfid					
				end
			end
		end
	end
	
	if WAR.NGJL==92 and (WAR.Person[WAR.CurID]["我方"]==false or math.random(10)<6 or pid==13) then
					ng=1;
					WAR.Person[id][CC.TXDH]=math.fmod(92,10)+85;
					if pid==13 then
					   WAR.Person[id][CC.TXWZ2]=JY.Wugong[92]['名称']..CC.WARS130;
					else
					   WAR.Person[id][CC.TXWZ2]=JY.Wugong[92]['名称']..CC.WARS31;
					end
					for j=0,WAR.PersonNum-1 do
						if WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] and WAR.Person[j]["死亡"]==false then
							WAR.Person[j]["TimeAdd"]=WAR.Person[j]["TimeAdd"]-100;
							if pid==13 then
							   WAR.Person[j]["TimeAdd"]=WAR.Person[j]["TimeAdd"]-200;
							end
						end
					end					
	end
	
	if PersonKF(pid,105) then
	   if WAR.Person[id][CC.TXWZ2]==nil and math.random(10)<6 then
	      WAR.Person[id][CC.TXDH]=math.fmod(105,10)+85
		  WAR.Person[id][CC.TXWZ2]=CC.WARS32
		  WAR.NGJL=105
		  ng=ng+1000
	   end
	end
	
	if pid==0 and WAR.NGJL==91 and GetS(10,0,7,0)==1 and GetS(4,5,5,5)~=8 then
	   local t=math.random(4);
	   local mc=JY.Wugong[91]["名称"]
	   if GetS(4,5,5,5)==6 and GetS(10,0,11,0)~=1 then t=math.random(2)+1 end	      		
	   if GetS(4,5,5,5)==6 and GetS(10,0,11,0)==1 and JLSD(25,75,pid) then t=math.random(2)+1 end	
	   if GetS(4,5,5,5)==6 and GetS(10,0,11,0)==1 and (t==1 or t==4) then
	      if WAR.FLHS6>2 then t=math.random(2)+1 end
	   end	   
		if t==3 then
	      WAR.Person[id][CC.TXDH]=6
		  WAR.Person[id][CC.TXWZ2]=mc..FLHSYL[1]
		  WAR.FLHS1=1
		   for j=0,WAR.PersonNum-1 do
	        if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then                            			   			                   
		        WAR.Person[j]["Time"]=WAR.Person[j]["Time"]+100
                if WAR.Person[j]["Time"]>980 then WAR.Person[j]["Time"]=980	end		
            end
           end
		elseif t==2 then
		   WAR.Person[id][CC.TXDH]=6
		   WAR.Person[id][CC.TXWZ2]=mc..FLHSYL[3]
	       ng=ng+3000
		else
		   if (GetS(4,5,5,5)==6 or math.random(10)<5) and GetS(10,0,11,0)==1 and WAR.FLHS6<3 then
			   WAR.Person[id][CC.TXDH]=6
			   WAR.Person[id][CC.TXWZ2]=mc..FLHSYL[6]
			   fightnum=fightnum+1
			   WAR.FLHS6=WAR.FLHS6+1
		   end
		end
	end

	if (PersonKF(pid,85) or T1LEQ(pid)) and JLSD(25,75,pid) then
	    if WAR.Person[id][CC.TXDH]==-1 then
	       WAR.Person[id][CC.TXDH]=math.fmod(85,10)+85
		end
	    if WAR.Person[id][CC.TXWZ2]==nil then
	      WAR.Person[id][CC.TXWZ2]=CC.WARS33
		else
		  WAR.Person[id][CC.TXWZ2]=WAR.Person[id][CC.TXWZ2].."+"..CC.WARS33
		end
		WAR.BMXH=1
		for w=1,10 do
		    if JY.Person[pid]["武功"..w]==85 then
			    JY.Person[pid]["武功等级"..w]=JY.Person[pid]["武功等级"..w]+10
				if JY.Person[pid]["武功等级"..w]>999 then JY.Person[pid]["武功等级"..w]=999 end
				break
			end
		end
	end

	if (PersonKF(pid,88) and JLSD(35,70,pid) and WAR.BMXH==0) or pid==26 then
	    if WAR.Person[id][CC.TXDH]==-1 then
	       WAR.Person[id][CC.TXDH]=math.fmod(88,10)+85
		end
	    if WAR.Person[id][CC.TXWZ2]==nil then
	      WAR.Person[id][CC.TXWZ2]=CC.WARS34
		else
		  WAR.Person[id][CC.TXWZ2]=WAR.Person[id][CC.TXWZ2].."+"..CC.WARS34
		end
		WAR.BMXH=2
		for w=1,10 do
		    if JY.Person[pid]["武功"..w]==88 then
			    JY.Person[pid]["武功等级"..w]=JY.Person[pid]["武功等级"..w]+10
				if JY.Person[pid]["武功等级"..w]>999 then JY.Person[pid]["武功等级"..w]=999 end
				break
			end
		end
	end
	
	if PersonKF(pid,87) and JLSD(25,75,pid) and WAR.BMXH==0 then
	   if WAR.Person[id][CC.TXDH]==-1 then
	       WAR.Person[id][CC.TXDH]=math.fmod(87,10)+85
		end
	    if WAR.Person[id][CC.TXWZ2]==nil then
	      WAR.Person[id][CC.TXWZ2]=CC.WARS35
		else
		  WAR.Person[id][CC.TXWZ2]=WAR.Person[id][CC.TXWZ2].."+"..CC.WARS35
		end
		WAR.BMXH=3
		for w=1,10 do
		    if JY.Person[pid]["武功"..w]==87 then
			    JY.Person[pid]["武功等级"..w]=JY.Person[pid]["武功等级"..w]+10
				if JY.Person[pid]["武功等级"..w]>999 then JY.Person[pid]["武功等级"..w]=999 end
				break
			end
		end
	end
	
	if pid==50 and WAR.Person[id][CC.TXWZ2]==nil then
	       WAR.Person[id][CC.TXDH]=53
		   WAR.Person[id][CC.TXWZ2]=CC.WARS36
		   ng=ng+1500
	end

	if pid==103 then
	       WAR.Person[id][CC.TXDH]=math.fmod(98,10)+85
		   WAR.Person[id][CC.TXWZ2]=CC.WARS37
		   ng=ng+1000
	end
	
	if pid==64 then
	       WAR.Person[id][CC.TXDH]=math.fmod(100,10)+85
		   WAR.Person[id][CC.TXWZ2]=CC.WARS38
		   ng=ng+1000
	end
	
	if pid==0 and GetS(4,5,5,5)==5 then
	   if JY.Person[pid]['武功'..wugongnum]>88 and JY.Person[pid]['武功'..wugongnum]<109 then
	      if JY.Person[pid]['武功等级'..wugongnum]==999 and JLSD(25,75,pid) then
		     WAR.Person[id][CC.TXWZ3]=CC.WARS39..JY.Wugong[JY.Person[pid]['武功'..wugongnum]]["名称"]	      
		     ng=ng+JY.Wugong[JY.Person[pid]['武功'..wugongnum]]["攻击力10"]
	      end
		  if JY.Person[pid]['武功等级'..wugongnum]==999 then WAR.WS=1 end
	  end
	end
	
	if pid==9 and WAR.Person[id][CC.TXWZ2]==nil and PersonKF(9,106) then --ZWJ
	   local z=math.random(2);
	   if z==1 then
		   WAR.Person[id][CC.TXDH]=math.fmod(97,10)+85
		   WAR.Person[id][CC.TXWZ2]=CC.WARS40
		   ng=ng+850
	   else 
		   WAR.Person[id][CC.TXDH]=math.fmod(106,10)+85
		   WAR.Person[id][CC.TXWZ2]=CC.WARS41
		   ng=ng+1200
	   end
	end	
	
	if pid==26 then
	   WAR.Person[id][CC.TXDH]=6
	   WAR.Person[id][CC.TXWZ2]=CC.WARS42
	   ng=ng+1500
	end
	
	if JY.Person[pid]['武功'..wugongnum]==26 then
           if pid==50 or (pid==55 and math.random(10)<4) or (pid==69 and math.random(10)<6) or (pid==0 and GetS(4,5,5,5)==1 and JY.Person[pid]['武功等级'..wugongnum]==999 and JLSD(30,70,pid)) then		
			WAR.Person[id][CC.TXWZ3]=XL18JY[math.random(8)]
			--JY.Person[pid]['攻击力']=JY.Person[pid]['攻击力']*3
			ng=ng+2500
			WAR.WS=1
			--[[
			for i=1,level do
				for d=1,4 do
					SetWarMap(WAR.Person[WAR.CurID]['坐标X']+CC.DirectX[d]*i,WAR.Person[WAR.CurID]['坐标Y']+CC.DirectY[d]*i,4,1)
				end
			end
			]]--
			for i=1,level/2+1 do
				for j=1,level/2+1 do
				SetWarMap(x+i-1,y+j-1,4,1)
				SetWarMap(x-i+1,y+j-1,4,1)
				SetWarMap(x+i-1,y-j+1,4,1)
				SetWarMap(x-i+1,y-j+1,4,1)
				end
			end
             else
                       if myrandom(15+level,pid) then			
			WAR.Person[id][CC.TXWZ3]=XL18[math.random(6)]
			--JY.Person[pid]['攻击力']=JY.Person[pid]['攻击力']*3
			ng=ng+2000
			for i=1,(1+level)/2 do
				for j=1,(1+level)/2 do
		SetWarMap(WAR.Person[WAR.CurID]['坐标X']+i*2-1,WAR.Person[WAR.CurID]['坐标Y']+j*2-1,4,1)
		SetWarMap(WAR.Person[WAR.CurID]['坐标X']-i*2+1,WAR.Person[WAR.CurID]['坐标Y']+j*2-1,4,1)
		SetWarMap(WAR.Person[WAR.CurID]['坐标X']+i*2-1,WAR.Person[WAR.CurID]['坐标Y']-j*2+1,4,1)
		SetWarMap(WAR.Person[WAR.CurID]['坐标X']-i*2+1,WAR.Person[WAR.CurID]['坐标Y']-j*2+1,4,1)
				end
			end
                        end
             end
                    
        end		
	   
	if JY.Person[pid]['武功'..wugongnum]==49 then
	    if PersonKF(pid,17) then
		    if JLSD(20,80,pid) or pid==53 then
		       WAR.Person[id][CC.TXWZ3]=LMSJ[math.random(6)]			
			   ng=ng+2000
			    if pid==53 then 
			       WAR.LMSJwav=1 
				   WAR.WS=1
				end
			end
		else		
			if myrandom(level,pid) or (pid==53 and math.random(10)<6) then			
				WAR.Person[id][CC.TXWZ3]=LMSJ[math.random(6)]			
				ng=ng+2000
				if pid==53 then WAR.LMSJwav=1 end
			end
		end
	end
	
	if JY.Person[pid]['武功'..wugongnum]==1 and PersonKF(pid,108) then	    
		if inteam(pid) then
		    if JLSD(20,80,pid) then WAR.LHQ_BNZ=1 end
		else
		    WAR.LHQ_BNZ=1
		end
	end
	
	if JY.Person[pid]['武功'..wugongnum]==22 and PersonKF(pid,108) then	    
		if inteam(pid) then
		    if JLSD(20,60,pid) then WAR.JGZ_DMZ=1 end
		else
		    WAR.JGZ_DMZ=1
		end
	end
	
	if pid>480 and pid<490 then
	   WAR.Person[id][CC.TXWZ2]=CC.EVB201
	   ng=ng+1200
	   WAR.JGZ_DMZ=1
	end
	
	if pid==38 and wugong==102 then
	   if JY.Person[pid]['武功等级'..wugongnum]==999 and JLSD(25,75,pid) then
	      WAR.Person[id][CC.TXWZ3]=XKXSJ[math.random(4)]
		  ng=ng+1200
		end
	end
	
	if pid==37 and wugong==94 then
	   if JY.Person[pid]['武功等级'..wugongnum]==999 and JLSD(25,75,pid) then
	      WAR.Person[id][CC.TXWZ3]=CC.WARS43
		  ng=ng+1000
		end
	end
	
	if JY.Person[pid]['武功'..wugongnum]==44 and JY.Person[pid]['武功等级'..wugongnum]==999 and math.random(10)<6 then
	   for i=1,10 do
	       if JY.Person[pid]['武功'..i]==67 and JY.Person[pid]['武功等级'..i]==999 then
		      WAR.Person[id][CC.TXWZ1]=CC.WARS44
			  WAR.Person[id][CC.TXDH]=6
			  WAR.DJGZ=1
			  ng=ng+2000
			  break		   		  
		   end
	   end
	end
	
	if JY.Person[pid]['武功'..wugongnum]==67 and JY.Person[pid]['武功等级'..wugongnum]==999 and math.random(10)<6 then
	   for i=1,10 do
	       if JY.Person[pid]['武功'..i]==44 and JY.Person[pid]['武功等级'..i]==999 then
		      WAR.Person[id][CC.TXWZ1]=CC.WARS44
			  WAR.Person[id][CC.TXDH]=6
			  WAR.DJGZ=1
			  ng=ng+2000
			  break		   		  
		   end
	   end
	end
	
	if pid==90 and JY.Person[pid]['武功'..wugongnum]==113 then WAR.TD=-2 end
	
    if pid==57 and WAR.ACT==1 then
       	for j=0,WAR.PersonNum-1 do		    
	            if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then	
				   if JY.Person[WAR.Person[j]["人物编号"]]["内力"]>1000 then
		              JY.Person[WAR.Person[j]["人物编号"]]["内力"]=JY.Person[WAR.Person[j]["人物编号"]]["内力"]-1000
	               else
				      JY.Person[WAR.Person[j]["人物编号"]]["内力"]=0
					  JY.Person[WAR.Person[j]["人物编号"]]["生命"]=JY.Person[WAR.Person[j]["人物编号"]]["生命"]-100
				   end
                end
        end
		 WAR.Person[id][CC.TXWZ3]=CC.WARS45
	     WAR.Person[id][CC.TXDH]=39
    end		
	
	if pid==60 then WAR.WS=1 end
	if pid==27 then WAR.WS=1 end
	if (pid==50 or pid==55 or pid==69) and JY.Person[pid]['武功'..wugongnum]==26 then WAR.WS=1 end
	if pid==35 and GetS(10,1,1,0)==1 and JY.Person[pid]['武功'..wugongnum]==47 then WAR.WS=1 end
	
	if pid==62 then ng=ng+2000 end 
	
	if pid==84 then ng=ng+1000 end 
	
	if pid==78 and JY.Person[pid]['武功'..wugongnum]==11 then 
	   WAR.MCF=1 
	   WAR.Person[id][CC.TXWZ3]=CC.WARS46
	end
	
	if pid==52 and JY.Person[pid]['武功'..wugongnum]==70 then 
	   WAR.Person[id][CC.TXWZ3]=CC.WARS47
	   ng=ng+1000
	end
	
	if pid==25 or pid==83 then WAR.TFH=1 end
	
	if pid==91 and JY.Person[pid]['武功'..wugongnum]==28 then WAR.WQQ=1 end
	
	if pid==74 and JY.Person[pid]['武功'..wugongnum]==29 then WAR.HQT=1 end

	if pid==63 and JY.Person[pid]['武功'..wugongnum]==38 then WAR.CY=1 end
	
	if pid==58 and WAR.XK~=2 then           
          for j=0,WAR.PersonNum-1 do
	        if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then                            			   			                   
		        WAR.Person[j]["TimeAdd"]=WAR.Person[j]["TimeAdd"]-100             			               
            end
          end
		  if WAR.Person[id][CC.TXDH]==nil then WAR.Person[id][CC.TXDH]=89 end
		      WAR.Person[id][CC.TXWZ1]=CC.WARS48
    end
	
	
	if WAR.XK==2 and pid==58 and WAR.Person[WAR.CurID]["我方"]==WAR.XK2 then
                   for e=0,WAR.PersonNum-1 do
					     if WAR.Person[e]["死亡"]==false and WAR.Person[e]["我方"]~=WAR.Person[WAR.CurID]["我方"] then     
			                WAR.Person[e]["TimeAdd"]=WAR.Person[e]["TimeAdd"]-math.modf(JY.Person[WAR.Person[WAR.CurID]["人物编号"]]["内力"]/5)
							if WAR.Person[e]["Time"]<-450 then WAR.Person[e]["Time"]=-450 end
	                        JY.Person[WAR.Person[e]["人物编号"]]["内力"]=JY.Person[WAR.Person[e]["人物编号"]]["内力"]-math.modf(JY.Person[WAR.Person[WAR.CurID]["人物编号"]]["内力"]/5)
                            if JY.Person[WAR.Person[e]["人物编号"]]["内力"]<0 then JY.Person[WAR.Person[e]["人物编号"]]["内力"]=0 end						
		                    JY.Person[WAR.Person[e]["人物编号"]]["生命"]=JY.Person[WAR.Person[e]["人物编号"]]["生命"]-math.modf(JY.Person[WAR.Person[WAR.CurID]["人物编号"]]["内力"]/25)
							if JY.Person[WAR.Person[e]["人物编号"]]["生命"]<0 then JY.Person[WAR.Person[e]["人物编号"]]["生命"]=0 end							
						  end
					end
					if inteam(pid) then
                       JY.Person[58]["内力"]=0
					   JY.Person[58]["内力最大值"]=JY.Person[58]["内力最大值"]-100
					   JY.Person[300]["声望"]=JY.Person[300]["声望"]+1
					else
					   AddPersonAttrib(pid,"内力",-1000);
					end
					if JY.Person[58]["内力最大值"]<500 then JY.Person[58]["内力最大值"]=500 end
					WAR.Person[id][CC.TXWZ1]=CC.WARS49
	                WAR.Person[id][CC.TXDH]=6
				    WAR.XK=3
	end
   
	if pid==73 and JY.Person[pid]['武功'..wugongnum]==73  then
	   if math.random(10)<7 then
	    WAR.Person[id][CC.TXWZ3]=CC.WARS50
	    WAR.Person[id][CC.TXDH]=89
	     for j=0,WAR.PersonNum-1 do
	          if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then                            			   			                   
		        JY.Person[WAR.Person[j]["人物编号"]]["生命"]=JY.Person[WAR.Person[j]["人物编号"]]["生命"]-70
			  end
	   end
	  else
	   if math.random(10)<7 then
	    for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["人物编号"]==35 then
	            if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then			    
		            JY.Person[WAR.Person[j]["人物编号"]]["体力"]=100
					JY.Person[WAR.Person[WAR.CurID]["人物编号"]]["体力"]=100
					JY.Person[WAR.Person[j]["人物编号"]]["受伤程度"]=0
					JY.Person[WAR.Person[WAR.CurID]["人物编号"]]["受伤程度"]=0
					WAR.Person[id][CC.TXWZ3]=CC.WARS51
	                WAR.Person[id][CC.TXDH]=89
			    end
			end
		 end
	   end
	  end
	 end
	   		   	
	if pid==5 and math.random(10)<8 then
	   WAR.ZSF=1
	   WAR.Person[id][CC.TXWZ1]=CC.WARS52	   
	end
	
	if pid==49 and math.random(10)<7 then
	   WAR.XZZ=1
	   WAR.Person[id][CC.TXWZ1]=CC.WARS53	  
	end
	
	if pid==27 and math.random(10)<7 then
	   WAR.Person[id][CC.TXWZ3]=CC.WARS54
	   ng=ng+1200
	end	
	
	if pid==2 then
	   for j=0,WAR.PersonNum-1 do
	        if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then                            			   			                   
		        JY.Person[WAR.Person[j]["人物编号"]]["中毒程度"]=JY.Person[WAR.Person[j]["人物编号"]]["中毒程度"]+20
                if 	JY.Person[WAR.Person[j]["人物编号"]]["中毒程度"]>100 then			
	                JY.Person[WAR.Person[j]["人物编号"]]["中毒程度"]=100 
				end
			end
		end
		WAR.Person[id][CC.TXWZ1]=CC.WARS55
		WAR.Person[id][CC.TXDH]=64
	end
	
	if pid==103 and JY.Person[pid]['武功'..wugongnum]==66 then
	   for j=0,WAR.PersonNum-1 do
	        if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then                            			   			                   
		        JY.Person[WAR.Person[j]["人物编号"]]["受伤程度"]=JY.Person[WAR.Person[j]["人物编号"]]["受伤程度"]+30
                if 	JY.Person[WAR.Person[j]["人物编号"]]["受伤程度"]>100 then			
	                JY.Person[WAR.Person[j]["人物编号"]]["受伤程度"]=100 
				end
			end
		end	
        WAR.Person[id][CC.TXWZ1]=CC.WARS56		
		WAR.Person[id][CC.TXDH]=58
		ng=ng+1000
	end
	
	if pid==18 then
	   WAR.Person[id][CC.TXWZ2]=CC.WARS57		
	   WAR.Person[id][CC.TXDH]=6
	   ng=ng+2000
	   WAR.Person[id][CC.TXWZ3]=CC.WARS58
	end
	
	if JY.Person[pid]['武功'..wugongnum]==63 and (JY.Person[pid]["武器"]==44 or pid==97) then WAR.XDDF=1 end
	   
	if JY.Person[pid]['武功'..wugongnum]==16 then
		if WAR.tmp[3000+pid]==nil then
			WAR.tmp[3000+pid]=0;
		else
			if WAR.tmp[3000+pid]>0 then
				WAR.Person[id][CC.TXWZ3]=CC.WARS59;
				ng=ng+1;
			end
		end
	end
	for i,v in pairs(CC.KfName) do
		if v[1]==wugong then
			if myrandom(level,pid) or WAR.NGJL==98 or WAR.LQZ[pid]==100 or (PersonKF(pid,98) and JLSD(30,70,pid)) then
				WAR.Person[id][CC.TXWZ3]=v[2];
				ng=ng+v[3];
				break;
			end
		end
	end
	
	if pid==5 then
	    if WAR.Person[id][CC.TXWZ3]~=nil and JLSD(30,70,pid) then
		    WAR.Person[id][CC.TXWZ3]=CC.EVB110.."·"..WAR.Person[id][CC.TXWZ3]
	        ng=ng+1000;
		    WAR.ZSF2=1;
		end
	end	
	
	if pid==0 and GetS(4,5,5,5)==3 and wugong==64 and JLSD(20,80,pid) then
	   local d=math.random(math.modf(GetS(14,3,1,4)/100+1)+2)+6
	   ng=ng+d*100	   
	   WAR.Person[id][CC.TXWZ3]=CC.s53..SZB[d]
	end

	if JY.Person[pid]['武功'..wugongnum]==8 and pid==49 and PersonKF(pid,101) and (JLSD(20,80,pid) or WAR.NGJL==98) then
	   WAR.Person[id][CC.TXWZ3]=CC.WARS60	  
	   ng=ng+1700
	   WAR.SSFwav=1;
	   WAR.TZ_XZ=1;
	end
	
	if JY.Person[pid]['武功'..wugongnum]==80 and JY.Person[pid]['武功等级'..wugongnum]==999 and (JLSD(30,70,pid) or (GetS(4,5,5,5)==4 and JLSD(30,75,pid))) then
           WAR.Person[id][CC.TXWZ3]=CC.WARS61
	       WAR.Person[id][CC.TXDH]=89	
           if WAR.Person[id][CC.TXWZ3]~=nil then ng=ng-800 end  
			ng=ng+1500	
            WAR.WS=1			
			for i=1,6 do
				for j=1,6 do
				SetWarMap(x+i-1,y+j-1,4,1)
				SetWarMap(x-i+1,y+j-1,4,1)
				SetWarMap(x+i-1,y-j+1,4,1)
				SetWarMap(x-i+1,y-j+1,4,1)
				end
			end
	end
	
	if pid==1 and JY.Person[pid]['武功'..wugongnum]==67 and WAR.Person[id][CC.TXWZ3]==nil and JY.Person[pid]['武功等级'..wugongnum]==999 and math.random(10)<6 then	   
			WAR.Person[id][CC.TXWZ3]=HDZC[math.random(3)]	
			WAR.WS=1	
			ng=ng+1200
	end
	
	if pid==58 and JY.Person[pid]['武功'..wugongnum]==45 and WAR.Person[id][CC.TXWZ3]==nil and JY.Person[pid]['武功等级'..wugongnum]==999 and math.random(10)<7 then
	      WAR.Person[id][CC.TXWZ3]=CC.WARS62
	       WAR.Person[id][CC.TXDH]=84			
			ng=ng+1800	
            WAR.WS=1			
			for i=1,5 do
				for j=1,5 do
				SetWarMap(x+i-1,y+j-1,4,1)
				SetWarMap(x-i+1,y+j-1,4,1)
				SetWarMap(x+i-1,y-j+1,4,1)
				SetWarMap(x-i+1,y-j+1,4,1)
				end
			end
	end
	
	if pid==84 and WAR.Person[id][CC.TXWZ1]==nil and math.random(10)<7 then
	    WAR.HDWZ=1
		WAR.Person[id][CC.TXWZ1]=CC.WARS63
	    WAR.Person[id][CC.TXDH]=89			
    end
	
	if T2SQ(pid) and GetS(10,0,7,0)==1 and JLSD(25,75,0) and WAR.SQFJ~=1 and WAR.DZXY~=1 then
	   Cls();
	   DHZFXS(CC.WARS64)											   
	   --WAR.Person[id][CC.TXWZ1]="火凤燎原"
	   WAR.Person[id][CC.TXDH]=65
	    WAR.WS=1			
			for i=1,10 do
				for j=1,10 do
				SetWarMap(x+i-1,y+j-1,4,1)
				SetWarMap(x-i+1,y+j-1,4,1)
				SetWarMap(x+i-1,y-j+1,4,1)
				SetWarMap(x-i+1,y-j+1,4,1)
				end
			end
	end
	
	if pid==553 and WAR.YZB2>0 then
	   if WAR.YZB2>2 then
	      WAR.Person[id][CC.TXWZ3]=CC.WARS65
	   elseif WAR.YZB2>1 then
	      WAR.Person[id][CC.TXWZ3]=CC.WARS66
	   elseif WAR.YZB2>0 then
	      WAR.Person[id][CC.TXWZ3]=CC.WARS67
	   end	       
	    WAR.Person[id][CC.TXDH]=6	
        ng=ng+200+WAR.YZB2*600
		WAR.WS=1
		for i=1,4+WAR.YZB2*2 do
				for j=1,4+WAR.YZB2*2 do
				SetWarMap(x+i-1,y+j-1,4,1)
				SetWarMap(x-i+1,y+j-1,4,1)
				SetWarMap(x+i-1,y-j+1,4,1)
				SetWarMap(x-i+1,y-j+1,4,1)
				end
		end
    end	

	if pid==516 and WAR.KHCM[pid]~=1 then
	   WAR.Person[id][CC.TXWZ3]=CC.WARS68
	   WAR.Person[id][CC.TXDH]=6	
	   WAR.GBWZ=1
	   WAR.WS=1
	   ng=ng+1500
	end
	
	if WAR.Data["代号"]==130 then
	   for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["人物编号"]==541 then
	            if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then			    
		            WAR.BSMT=1
					WAR.WS=1
					ng=ng+1500
					WAR.Person[id][CC.TXWZ1]=CC.WARS69
	                WAR.Person[id][CC.TXDH]=6	
			     end
		    end
       end
	end
	   
	if  JY.Person[pid]['武功'..wugongnum]==48 and JY.Person[pid]['武功等级'..wugongnum]==999 and WAR.NGJL==105 and WAR.KHCM[pid]~=1 then
	    WAR.KHBX=1
		WAR.Person[id][CC.TXWZ3]=CC.WARS70
	    WAR.Person[id][CC.TXDH]=6			
	end
	
    if WAR.KHCM[pid]==1 then
       WAR.Person[id][CC.TXDH]=89	
	   WAR.Person[id][CC.TXWZ2]=CC.WARS71
	end
	
	local xb=JY.Wugong[wugong]["武功类型"];
	local pz=math.modf(JY.Person[0]["资质"]/5)
	
	if pid==0 and GetS(4,5,5,5)==2 and JY.Person[pid]["御剑能力"]>=120 and JY.Person[pid]['武功10']>0 and xb==2 and JLSD(30,50+pz,pid) and GetS(10,0,7,0)==1 then 
	   CleanWarMap(4,0)
	   for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["我方"]~=WAR.Person[WAR.CurID]["我方"] and WAR.Person[i]["死亡"]==false then
	           SetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],4,1)
			end
		end
		WAR.Person[id][CC.TXDH]=6	
		if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[2]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[2].."·"..WAR.Person[id][CC.TXWZ3]
		end	
		ng=ng+1500
		WAR.WS=1
		Cls();
		--lib.LoadPicture(CC.TF,-1,-1) 
		if JY.HEADXZ==1 then
		    lib.PicLoadCache(91,1*2,100,-1,1); 
        else
           	lib.PicLoadCache(91,1*2,-1,1,1); 
        end			
				   ShowScreen();
				   lib.Delay(40)
		--WaitKey();
		--Cls();
		for i=12,24 do		        
		        NewDrawString(-1,-1,ZJTF[2]..TFSSJ[2],C_GOLD,25+i)						
				--NewDrawString(-1,-1,"『神洲铁脊·封狼居胥』",C_GOLD,25+i)										
				ShowScreen();
						if i==24 then
						    Cls();							
							NewDrawString(-1,-1,ZJTF[2]..TFSSJ[2],C_GOLD,25+i)
							ShowScreen();
							lib.Delay(500);
							--WaitKey();
						else
							lib.Delay(1);
						end						
		end
		WAR.JSYX=1
	end
	
	if pid==0 and GetS(4,5,5,5)==1 and JY.Person[pid]['武功10']>0 and JY.Person[pid]["拳掌功夫"]>=120 and JLSD(30,50+pz,pid) and xb==1 and GetS(10,0,7,0)==1 then
	   WAR.Person[id][CC.TXDH]=6	
	    if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[1]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[1].."·"..WAR.Person[id][CC.TXWZ3]
		end	
	   ng=ng+1200
	   WAR.WS=1
	   Cls();
	   if JY.HEADXZ==1 then
		    lib.PicLoadCache(91,0*2,-1,-1,1); 
        else
           	lib.PicLoadCache(91,0*2,25,1,1); 
        end		                                     
				   ShowScreen();
				   lib.Delay(40)
	   for i=12,24 do
		        NewDrawString(-1,-1,ZJTF[1]..TFSSJ[1],C_GOLD,25+i)
				ShowScreen();
						if i==24 then
							Cls();							
							NewDrawString(-1,-1,ZJTF[1]..TFSSJ[1],C_GOLD,25+i)
							ShowScreen();
							lib.Delay(500);
						else
							lib.Delay(1);
						end						
		end
	   WAR.LXZQ=1
	end
	
	if pid==0 and GetS(4,5,5,5)==4 and JY.Person[pid]['武功10']>0 and JY.Person[pid]["特殊兵器"]>=120 and JLSD(25,55+pz,pid) and xb==4 and GetS(10,0,7,0)==1 then
	   WAR.Person[id][CC.TXDH]=6	
	    if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[4]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[4].."·"..WAR.Person[id][CC.TXWZ3]
		end	
	   ng=ng+1000
	   WAR.WS=1
	   Cls();
	    if JY.HEADXZ==1 then
		    lib.PicLoadCache(91,3*2,-100,-1,1); 
        else
           	lib.PicLoadCache(91,3*2,130,1,1); 
        end		 	                                    
				   ShowScreen();
				   lib.Delay(40)
	   for i=12,24 do
		        NewDrawString(-1,-1,ZJTF[4]..TFSSJ[4],C_GOLD,25+i)
				ShowScreen();
						if i==24 then
							Cls();							
							NewDrawString(-1,-1,ZJTF[4]..TFSSJ[4],C_GOLD,25+i)
							ShowScreen();
							lib.Delay(500);
						else
							lib.Delay(1);
						end						
		end
	   WAR.GCTJ=1
	end
	
	if pid==0 and GetS(4,5,5,5)==3 and JY.Person[pid]['武功10']>0 and JY.Person[pid]["耍刀技巧"]>=120 and JLSD(30,55+pz,pid) and xb==3 and GetS(10,0,7,0)==1 then
	   WAR.Person[id][CC.TXDH]=6	
	    if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[3]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[3].."·"..WAR.Person[id][CC.TXWZ3]
		end	
	   ng=ng+2000
	   WAR.WS=1
	   Cls();
	   if JY.HEADXZ==1 then
		    lib.PicLoadCache(91,2*2,-1,-1,1);  
        else
           	lib.PicLoadCache(91,2*2,55,1,1); 
        end		                                      
				   ShowScreen();
				   lib.Delay(40)
	   for i=12,24 do
		        --NewDrawString(-1,-1,ZJTF[3],C_GOLD,25+i)
				 NewDrawString(-1,-1,ZJTF[3]..TFSSJ[3],C_GOLD,25+i)				
				 ShowScreen();				 
						if i==24 then
							Cls();							
							NewDrawString(-1,-1,ZJTF[3]..TFSSJ[3],C_GOLD,25+i)
							ShowScreen();
							lib.Delay(500);
						else
							lib.Delay(1);
						end						
		end
	   WAR.ASKD=1
	end
	
	if pid==0 and GetS(4,5,5,5)==5 and WAR.JSTG<150 and WAR.DZXY~=1 and JLSD(25,55+pz,pid) then
	    local tg=0;
	            for i=1,10 do
			        if JY.Person[pid]["武功"..i]>84 and JY.Person[pid]["武功"..i]<109 and JY.Person[pid]["武功"..i]~=86 or JY.Person[pid]["武功"..i]==43 then
					    if JY.Person[pid]["武功等级"..i]==999 then
					       tg=tg+1
						end
					end
				end 
        if tg==10 then
           	    Cls();
				    if JY.HEADXZ==1 then
						lib.PicLoadCache(91,4*2,100,-1,1);  
					else
						lib.PicLoadCache(91,4*2,49,1,1); 
					end				                                      
				   ShowScreen();
				   lib.Delay(40)
				   for i=12,24 do
							NewDrawString(-1,-1,ZJTF[5]..TFSSJ[5],C_GOLD,25+i)
							ShowScreen();
									if i==24 then
										Cls();							
										NewDrawString(-1,-1,ZJTF[5]..TFSSJ[5],C_GOLD,25+i)
										ShowScreen();
										lib.Delay(500);
									else
										lib.Delay(1);
									end						
					end
                WAR.JSTG=150
        end
    end		
	
	if WAR.LQZ[pid]==100 and WAR.DZXY~=1 and WAR.SQFJ~=1 then
	    WAR.Person[id][CC.TXDH]=6
		if WAR.Person[id][CC.TXWZ1]~=nil then
		   WAR.Person[id][CC.TXWZ1]=WAR.Person[id][CC.TXWZ1]..CC.WARS72
	    else
		   WAR.Person[id][CC.TXWZ1]=CC.WARS73
	    end
	    ng=ng+1500
    end
	
	if WAR.Actup[pid]~=nil then
	    if WAR.Person[id][CC.TXWZ1]~=nil then
		   WAR.Person[id][CC.TXWZ1]=WAR.Person[id][CC.TXWZ1]..CC.WARS74
	    else
		   WAR.Person[id][CC.TXWZ1]=CC.WARS75
	    end
		if PersonKF(pid,103) then
		   ng=ng+1200
		else
		   ng=ng+600
		end
	end
	
	if WAR.Person[id][CC.TXWZ1]~=nil then
	    if WAR.Person[id][CC.TXDH]==-1 then
	       WAR.Person[id][CC.TXDH]=88
		end
	end
	
    for i=0,CC.WarWidth-1 do
        for j=0,CC.WarHeight-1 do
			local effect=GetWarMap(i,j,4);
            if effect>0 then              --攻击效果地方			   
  				local emeny=GetWarMap(i,j,2);
				
				   
                 if emeny>=0 then          --有人				 
                     if emeny~=WAR.CurID then       --是敌人
						if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[emeny]["我方"] or ((GetS(0,0,0,0)==1 or WAR.tmp[1000+pid]~=nil) and ZHEN_ID<0 and WAR.WS==0) then       --是敌人
					     --只有点和面攻击可以杀内力。此时伤害类型有效
							if JY.Wugong[wugong]["伤害类型"]==1 and (fightscope==0 or fightscope==3) then
								if level==11 then level=10 end
								WAR.Person[emeny]["点数"]=-War_WugongHurtNeili(emeny,wugong,level)
								SetWarMap(i,j,4,3);
								WAR.Effect=3;
							else
								WAR.Person[emeny]["点数"]=-War_WugongHurtLife(emeny,wugong,level,ng)
								WAR.Effect=2;
								SetWarMap(i,j,4,2);  							
							end
						end
                     end
                 end
            end			
         end
    end
	for i=0,CC.WarWidth-1 do
        for j=0,CC.WarHeight-1 do
	        if GetWarMap(i,j,2)>=0 then  
			    if WAR.NYSH[GetWarMap(i,j,2)]==1 then				 				  
				    WAR.Person[GetWarMap(i,j,2)]["点数"]=WAR.Person[GetWarMap(i,j,2)]["点数"]-WAR.fthurt
				    WAR.Effect=2;
				    SetWarMap(i,j,4,2);
					WAR.NYSH[GetWarMap(i,j,2)]=0
				end				 
			end
			
		end
	end
	
	if fightnum==2 then level=level end
	
	local dhxg=JY.Wugong[wugong]["武功动画&音效"]
	if WAR.LXZQ==1 then
	   dhxg=71
	elseif WAR.JSYX==1 then
	   dhxg=84
	elseif WAR.ASKD==1 then
	   dhxg=65
	elseif  WAR.GCTJ==1 then
	   dhxg=108
	end
    War_ShowFight(pid,wugong,JY.Wugong[wugong]["武功类型"],level,x,y,dhxg,ZHEN_ID);
	--end
	
    for i=0,WAR.PersonNum-1 do
        WAR.Person[i]["点数"]=0;
    end

    WAR.Person[WAR.CurID]["经验"]=WAR.Person[WAR.CurID]["经验"]+2;
	
	local rz=0
	if WAR.Person[id]["我方"] then--and inteam(pid) then
	
	else
		rz=40 
	end
	
	--if JY.WGLVXS==1 then rz=100 end

	if inteam(pid) then
		if JY.Person[pid]["武功等级" .. wugongnum]<900 then
			JY.Person[pid]["武功等级" .. wugongnum]=JY.Person[pid]["武功等级" .. wugongnum]+2+Rnd(2);
		elseif JY.Person[pid]["武功等级" .. wugongnum]<999 then
			JY.Person[pid]["武功等级" .. wugongnum]=JY.Person[pid]["武功等级" .. wugongnum]+math.modf(JY.Person[pid]["资质"]/15+math.random(2))+rz
			if JY.Person[pid]["武功等级" .. wugongnum]>= 999 then    --武功升级了
				JY.Person[pid]["武功等级" .. wugongnum]=999
				PlayWavAtk(42) 
				DrawStrBoxWaitKey(string.format(CC.WARS76,JY.Person[pid]["姓名"],JY.Wugong[JY.Person[pid]["武功" .. wugongnum]]["名称"]),C_ORANGE,CC.DefaultFont)
				ShowScreen();
				lib.Delay(200);
				Cls();
				ShowScreen();
				if pid==38 and JY.Person[pid]["武功" .. wugongnum]==102 then
				   say(CC.say2,38)
				   DrawStrBoxWaitKey(CC.say3,C_ORANGE,CC.DefaultFont)
				   ShowScreen();
				   JY.Person[38]['轻功']=JY.Person[38]['轻功']+50
				end
			end
		end
	end

    if math.modf(JY.Person[pid]["武功等级" .. wugongnum]/100)+1 > level then    --武功升级了
        level=math.modf(JY.Person[pid]["武功等级" .. wugongnum]/100)+1;
        DrawStrBox(-1,-1,string.format(CC.WARS77,JY.Wugong[JY.Person[pid]["武功" .. wugongnum]]["名称"],level),C_ORANGE,CC.DefaultFont)
        ShowScreen();
        lib.Delay(500);
        Cls();
        ShowScreen();
    end
	if WAR.Person[WAR.CurID]["我方"] then  --定义消耗内力
		local nl
		if JY.Person[pid]["武功"..wugongnum]==43 then
			nl=math.modf((level+3)/2)*JY.Wugong[wugong]["消耗内力点数"]
			if nl>400 then nl=400 end
			if pid==51 then nl=math.modf(nl/2) end
		else
			nl=math.modf((level+3)/2)*JY.Wugong[wugong]["消耗内力点数"]
		end
                
                for i=1,10 do
                   if JY.Person[pid]["武功"..i]==99 then
                       nl=nl-math.modf(nl*(JY.Person[pid]["武功等级"..i]/100*0.05))
                   end
                end
		AddPersonAttrib(pid,"内力",-nl)
	else
		if GetS(0,0,0,0)~=1 then
			AddPersonAttrib(pid,"内力",-math.modf((level+1)/3)*JY.Wugong[wugong]["消耗内力点数"])
		else
			AddPersonAttrib(pid,"内力",-math.modf((level+1)/6)*JY.Wugong[wugong]["消耗内力点数"])
		end
	end
	if JY.Person[pid]["内力"]<0 then JY.Person[pid]["内力"]=0 end
	
	if JY.Person[pid]["生命"]<=0 then break end

	DrawTimeBar2();	
	WAR.ACT=WAR.ACT+1
end
    local jtl=0;
    if WAR.WGWL>=1100 then
	   jtl=7+math.random(2)
	elseif WAR.WGWL>=900 then
	   jtl=5+math.random(2)
	elseif WAR.WGWL>=600 then
	   jtl=3+math.random(2) 
    else
       jtl=1+math.random(2) 
    end	   
	
    if pid==89 then
      
    else
		if WAR.Person[WAR.CurID]["我方"] then
		   AddPersonAttrib(pid,"体力",-jtl)
		else
		   AddPersonAttrib(pid,"体力",-2)
		end
    end
		   
        
	local dz={}
	local dznum=0
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]["反击武功"]~=-1 and WAR.Person[i]["反击武功"]~=9999 then  			--
			dznum=dznum+1
			dz[dznum]={i,WAR.Person[i]["反击武功"],x-WAR.Person[WAR.CurID]["坐标X"],y-WAR.Person[WAR.CurID]["坐标Y"]}
			WAR.Person[i]["反击武功"]=9999
		end
	end	
		
	for i = 1, dznum do
		local tmp=WAR.CurID
		WAR.CurID=dz[i][1]
		WAR.DZXY=1
		if WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]==1 then
		   WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]=60
		elseif WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]==2 then
		   WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]=85
		elseif WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]==3 then
		   WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]=110
		end
		--lib.Delay(100)
		War_Fight_Sub(dz[i][1],dz[i][2]+100,dz[i][3],dz[1][4])--dz[i][3],dz[i][4])          --执行战斗
		WAR.Person[WAR.CurID]["反击武功"]=-1
		WAR.DZXYLV[WAR.Person[WAR.CurID]["人物编号"]]=nil
		WAR.CurID=tmp
        WAR.DZXY=0			
	end
	
	if WAR.YTFS==-1 then	    
	    for i=0,WAR.PersonNum-1 do
		      if WAR.Person[i]["人物编号"]==0 and T2SQ(WAR.Person[i]["人物编号"]) then--and JY.Person[0]["生命"]>0 then
		         local tmp=WAR.CurID
				 WAR.CurID=i
				 WAR.SQFJ=1
				 WAR.YTFS=0
				 WarDrawMap(0);				 
				 CurIDTXDH(i,1209,1224)	
				 CurIDTXDH(i,1186,1191)	
				 --DHZFXS(CC.WARS78)
				 Cls();
				 lib.PicLoadCache(91,7*2,150,-1,1);                                  
				   ShowScreen();
				   lib.Delay(40)
				   for i=12,24 do
							NewDrawString(-1,-1,CC.WARS78,C_GOLD,25+i)
							ShowScreen();
									if i==24 then
										Cls();							
										NewDrawString(-1,-1,CC.WARS78,C_GOLD,25+i)
										ShowScreen();
										lib.Delay(500);
									else
										lib.Delay(1);
									end						
					end
				 War_Fight_Sub(i,2,WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"])
		         WAR.SQFJ=0
				 for w=1,10 do
				        if JY.Person[0]["武功"..w]==JY.Person[0]["武功2"] and w~=2 then
				           JY.Person[0]["武功2"]=WAR.YT1
				           JY.Person[0]["武功等级2"]=WAR.YT2
						    break
					    end
				  end					
				 WAR.CurID=tmp				 
				 break
			  end
		end
	end
	
    return 1;
end

function myrandom(p,pp) --机率
	for i=0,WAR.PersonNum-1 do
		local pid=WAR.Person[i]["人物编号"];
		if WAR.Person[i]["死亡"]==false and pid==76 then
			if inteam(pp) then
				p=p+5;
			end
			break;
		end
	end
	for i=1,10 do
		if JY.Person[pp]["武功"..i]==102 then
			p=p+(math.modf(JY.Person[pp]["武功等级"..i]/100)+1);
			break;
		end
	end	
	p=math.modf(p+JY.Person[pp]["生命最大值"]*4/(JY.Person[pp]["生命"]+20)+JY.Person[pp]["体力"]/20)	
	if pp==38 then p=p+20 end
	if WAR.tmp[1000+pp]==1 then p=p+40 end	
	if inteam(pp) then
	   for q=1,51 do
	        if TeamP[q]==pp then
			    local jp=math.modf((GetS(5,q,6,5)/25)+1);
				if jp>20 then jp=20 end
				p=p+jp
				break
			end
		end
	end   
	p=p+limitX(math.modf(JY.Person[pp]['内力']/500),0,20);
	--DrawStrBoxWaitKey(string.format("%4d",p),C_GOLD,30)
	local times=1;
	if inteam(pp) then
		if math.random(120)-10>JY.Person[pp]['资质'] then
			times=2;
		end
		if T1LEQ(pp) and GetS(10,0,7,0)==1 then times=2 end		 
	else
		times=3;
		p=p+40
	end
	for i=1,times do
	    local bd=math.random(120)+10;
		--DrawStrBoxWaitKey(string.format("BD%4d",bd),C_GOLD,30)
		if bd<=p then			
			return true;			
		end
	end
	--[[
	if math.random(100)<=p then
		return true
	else
		local luck
		if inteam(pp) then
			luck=100-JY.Person[pp]['资质']
		else
			luck=100
			p=p*3
		end
		p=p+math.modf(JY.Person[pp]['内力']/400)
		if math.random(100)<=luck then
			if math.random(100)<=p then
				return true
			end
		end
	end
	]]--
	return false
end

function War_Direct(x1,y1,x2,y2)             --计算人方向
--计算人方向
--(x1,y1) 人位置     -(x2,y2) 目标位置
--返回： 方向
    local x=x2-x1;
    local y=y2-y1;
	if x==0 and y==0 then
		return WAR.Person[WAR.CurID]["人方向"]
	end
    if math.abs(y)>math.abs(x) then
        if y>0 then
            return 3;
        else
            return 0
        end
    else--if math.abs(y)<math.abs(x) then
        if x>0 then
            return 1;
        else
            return 2;
        end
    end
end

function KungfuString(str,x,y,color,size,font,place)					--返回显示武功的特效文字
	if str==nil then return end
	local w,h=size,size+5;
	local len=string.len(str)/2
	x=x-len*w/2
	y=y-h*place
	lib.DrawStr(x,y,str,color,size,font,0,0)
end

function War_ShowFight(pid,wugong,wugongtype,level,x,y,eft,ZHEN_ID)              --显示战斗动画
--显示战斗动画
--pid 人id
--wugong  武功编号， 0 表示用毒解毒等，使用普通攻击效果
--wogongtype =0 医疗用毒解毒，1,2,3,4 武功类型  -1 暗器
--level 武功等级
--x,y 攻击坐标
--eft  武功动画效果id  eft.idx/grp中的效果
	ZHEN_ID=ZHEN_ID or -1
	local x0=WAR.Person[WAR.CurID]["坐标X"];
	local y0=WAR.Person[WAR.CurID]["坐标Y"];
		
	if wugong==47 or pid==114 then
		eft=math.random(100)
	end	
	
	local ZHEN_pid;
	local ZHEN_type;
	local ZHEN_startframe;
	local ZHEN_fightframe;
	if ZHEN_ID>=0 then
		ZHEN_pid=WAR.Person[ZHEN_ID]["人物编号"];
		ZHEN_type=wugongtype;
		ZHEN_startframe=0;
		ZHEN_fightframe=0;
	end
	
    local fightdelay,fightframe,sounddelay;
    if wugongtype>=0 then
        fightdelay=JY.Person[pid]["出招动画延迟" .. wugongtype+1];
        fightframe=JY.Person[pid]["出招动画帧数" .. wugongtype+1];
        sounddelay=JY.Person[pid]["武功音效延迟" .. wugongtype+1];
    else            ---暗器，这些数据什么意思？？
        fightdelay=0;
        fightframe=-1;
        sounddelay=-1;
    end
	--对那些没有动画帧数的，使用默认的帧数
	if fightdelay==0 or fightframe==0 then
		for i=1,5 do
			if JY.Person[pid]["出招动画帧数"..i]~=0 then
				fightdelay=JY.Person[pid]["出招动画延迟"..i];
				fightframe=JY.Person[pid]["出招动画帧数"..i];
				sounddelay=JY.Person[pid]["武功音效延迟"..i];
				wugongtype=i-1
			end
		end		
	end
	if ZHEN_ID>=0 then
		if JY.Person[ZHEN_pid]["出招动画帧数" .. ZHEN_type+1]==0 then
			for i=1,5 do
				if JY.Person[ZHEN_pid]["出招动画帧数"..i]~=0 then
					ZHEN_type=i-1;
					ZHEN_fightframe=JY.Person[ZHEN_pid]["出招动画帧数"..i];
				end
			end
		else
			ZHEN_fightframe=JY.Person[ZHEN_pid]["出招动画帧数"..ZHEN_type+1];
		end
	end
	
    local framenum=fightdelay+CC.Effect[eft];            --总帧数

    local startframe=0;               --计算fignt***中当前出招起始帧
    if wugongtype>=0 then
        for i=0,wugongtype-1 do
            startframe=startframe+4*JY.Person[pid]["出招动画帧数" .. i+1];
        end
    end
	if ZHEN_ID>=0 then
		if ZHEN_type>=0 then
			for i=0,ZHEN_type-1 do
				ZHEN_startframe=ZHEN_startframe+4*JY.Person[ZHEN_pid]["出招动画帧数" .. i+1];
			end
		end
	end
	
    local starteft=0;          --计算起始武功效果帧
    for i=0,eft-1 do
        starteft=starteft+CC.Effect[i];
    end

	WAR.Person[WAR.CurID]["贴图类型"]=0;
	WAR.Person[WAR.CurID]["贴图"]=WarCalPersonPic(WAR.CurID);
	if ZHEN_ID>=0 then
		WAR.Person[ZHEN_ID]["贴图类型"]=0;
		WAR.Person[ZHEN_ID]["贴图"]=WarCalPersonPic(ZHEN_ID);
	end

    --WarSetPerson();

	--WarDrawMap(0);
	--ShowScreen();

    local fastdraw;
    if CONFIG.FastShowScreen==0 or CC.AutoWarShowHead==1 then    --显示头像则全部重绘
        fastdraw=0;
	else
	    fastdraw=1;
	end

    --在显示动画前先加载贴图
    local oldpic=WAR.Person[WAR.CurID]["贴图"]/2;
	local oldpic_type=0;

    local oldeft=-1;
	local kfname=JY.Wugong[wugong]["名称"]
	local showsize=32
	local showx=CC.ScreenW/2-showsize*string.len(kfname)/4

    for i=0,framenum-1 do
        local tstart=lib.GetTime();
		local mytype;
        if fightframe>0 then
            WAR.Person[WAR.CurID]["贴图类型"]=1;
		    mytype=4+WAR.CurID;
            if i<fightframe then
                WAR.Person[WAR.CurID]["贴图"]=(startframe+WAR.Person[WAR.CurID]["人方向"]*fightframe+i)*2;
            end
        else       --暗器，不使用fight中图像
            WAR.Person[WAR.CurID]["贴图类型"]=0;
            WAR.Person[WAR.CurID]["贴图"]=WarCalPersonPic(WAR.CurID);
			mytype=0;
        end
		
		if ZHEN_ID>=0 then
			if ZHEN_fightframe>0 then
				WAR.Person[ZHEN_ID]["贴图类型"]=1;
				if i<ZHEN_fightframe and i<framenum-1 then
					WAR.Person[ZHEN_ID]["贴图"]=(ZHEN_startframe+WAR.Person[ZHEN_ID]["人方向"]*ZHEN_fightframe+i)*2;
				else
					WAR.Person[ZHEN_ID]["贴图"]=WarCalPersonPic(ZHEN_ID);
				end
			else
				WAR.Person[ZHEN_ID]["贴图类型"]=0;
				WAR.Person[ZHEN_ID]["贴图"]=WarCalPersonPic(ZHEN_ID);
			end
			SetWarMap(WAR.Person[ZHEN_ID]["坐标X"],WAR.Person[ZHEN_ID]["坐标Y"],5,WAR.Person[ZHEN_ID]["贴图"]);
		end

        if i==sounddelay then
            PlayWavAtk(JY.Wugong[wugong]["出招音效"]);
        end
        if i==fightdelay then
            PlayWavE(eft);
        end
		if i==1 and WAR.SSFwav==1 then
		    --PlayWavAtk(32)
			WAR.SSFwav=0
		end
		if i==1 and WAR.LMSJwav==1 then
		   PlayWavAtk(31)
		   WAR.LMSJwav=0
		end
		
		local pic=WAR.Person[WAR.CurID]["贴图"]/2;
		if fastdraw==1 then
			local rr=ClipRect(Cal_PicClip(0,0,oldpic,oldpic_type,0,0,pic,mytype));
			if rr ~=nil then
				lib.SetClip(rr.x1,rr.y1,rr.x2,rr.y2);
			end
		else
			lib.SetClip(0,0,0,0);
		end
		oldpic=pic;
		oldpic_type=mytype;

		if i<fightdelay then   --只显示出招
		
		    WarDrawMap(4,pic*2,mytype,-1);
			local hb=GetS(JY.SubScene,x0,y0,4)--[[
				local dx=WAR.Person[WAR.CurID]["坐标X"]-WAR.Person[WAR.CurID]["坐标X"]
				local dy=WAR.Person[i]["坐标Y"]-WAR.Person[WAR.CurID]["坐标Y"]
				local rx=CC.XScale*(dx-dy)+CC.ScreenW/2;
				local ry=CC.YScale*(dx+dy)+CC.ScreenH/2;--]]
			if CONFIG.Zoom==1 then
				hb=hb*2;
			end
			if i==1 and WAR.Person[WAR.CurID][CC.TXDH]~=-1 then
				local theeft=WAR.Person[WAR.CurID][CC.TXDH]
				local sf=0
				for ii=0,theeft-1 do
					sf=sf+CC.Effect[ii];
				end
				local ssid=lib.SaveSur(CC.ScreenW/2-80,CC.ScreenH/2-hb-150,CC.ScreenW/2+80,CC.ScreenH/2-hb+30);
				for ii=CC.Effect[theeft],1,-1 do
					--Cls();
					lib.PicLoadCache(3,(sf+ii)*2,CC.ScreenW/2,CC.ScreenH/2-hb,2,192)
					if WAR.Person[WAR.CurID][CC.TXWZ1]~=nil then  --TX
						KungfuString(WAR.Person[WAR.CurID][CC.TXWZ1],CC.ScreenW/2,CC.ScreenH/2-hb,C_RED,24,CC.FontName,3)
					end
					if WAR.Person[WAR.CurID][CC.TXWZ2]~=nil then  --TX
						KungfuString(WAR.Person[WAR.CurID][CC.TXWZ2],CC.ScreenW/2,CC.ScreenH/2-hb,C_GOLD,24,CC.FontName,2)
					end
					if WAR.Person[WAR.CurID][CC.TXWZ3]~=nil then
						KungfuString(WAR.Person[WAR.CurID][CC.TXWZ3],CC.ScreenW/2,CC.ScreenH/2-hb,C_WHITE,24,CC.FontName,1)
					end
					
					ShowScreen();
					lib.Delay(30);
					lib.LoadSur(ssid,CC.ScreenW/2-80,CC.ScreenH/2-hb-150);
				end
				lib.FreeSur(ssid);
				WAR.Person[WAR.CurID][CC.TXDH]=-1
			else
				if WAR.Person[WAR.CurID][CC.TXWZ1]~=nil or WAR.Person[WAR.CurID][CC.TXWZ2]~=nil or WAR.Person[WAR.CurID][CC.TXWZ3]~=nil then
				    KungfuString(WAR.Person[WAR.CurID][CC.TXWZ1],CC.ScreenW/2,CC.ScreenH/2-hb,C_RED,24,CC.FontName,3)					
					KungfuString(WAR.Person[WAR.CurID][CC.TXWZ2],CC.ScreenW/2,CC.ScreenH/2-hb,C_GOLD,24,CC.FontName,2)
					KungfuString(WAR.Person[WAR.CurID][CC.TXWZ3],CC.ScreenW/2,CC.ScreenH/2-hb,C_WHITE,24,CC.FontName,1)
					lib.Delay(30)
				end
			end
		else		--同时显示武功效果
            starteft=starteft+1;            --此处似乎是eft第一个数据有问题，应该是10，现为9，因此加1

			if fastdraw==1 then
				local clip1={};
				clip1=Cal_PicClip(WAR.EffectXY[1][1]-x0,WAR.EffectXY[1][2]-y0,oldeft,3,
										WAR.EffectXY[1][1]-x0,WAR.EffectXY[1][2]-y0,starteft,3);
				local clip2={};
				clip2=Cal_PicClip(WAR.EffectXY[2][1]-x0,WAR.EffectXY[2][2]-y0,oldeft,3,
										WAR.EffectXY[2][1]-x0,WAR.EffectXY[2][2]-y0,starteft,3);
				local clip=ClipRect(MergeRect(clip1,clip2));

				if clip ~=nil then
					local area=(clip.x2-clip.x1)*(clip.y2-clip.y1);          --计算脏矩形面积
					if area <CC.ScreenW*CC.ScreenH/2 then        --面积足够小，则更新脏矩形。
						WarDrawMap(4,pic*2,mytype,starteft*2);
						lib.SetClip(clip.x1,clip.y1,clip.x2,clip.y2);
						WarDrawMap(4,pic*2,mytype,starteft*2);
					else    --面积太大，直接重绘
						lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);
						WarDrawMap(4,pic*2,mytype,starteft*2);
					end
				else
				    WarDrawMap(4,pic*2,mytype,starteft*2);
				end
			else
				lib.SetClip(0,0,0,0);
				WarDrawMap(4,pic*2,mytype,starteft*2);
			end
			oldeft=starteft;
			if  ZHEN_ID>=0 then
				DrawStrBox(CC.ScreenW/2-48,6,"双人合击",C_WHITE,24)
				lib.Delay(20);
			end
			if wugong~=0 then
			    if WAR.LHQ_BNZ==1 then kfname=CC.EVB202 end
				if WAR.JGZ_DMZ==1 then kfname=CC.EVB203 end
				DrawStrBox(showx,45,kfname,C_ORANGE,showsize)
			end
		end
		ShowScreen(fastdraw);
        lib.SetClip(0,0,0,0);
		local tend=lib.GetTime();
    	if tend-tstart<1*CC.Frame then
            lib.Delay(1*CC.Frame-(tend-tstart));
	    end

    end

	lib.SetClip(0,0,0,0);
    WAR.Person[WAR.CurID]["贴图类型"]=0;
    WAR.Person[WAR.CurID]["贴图"]=WarCalPersonPic(WAR.CurID);
    WarSetPerson();
    WarDrawMap(0);

    ShowScreen();
    lib.Delay(200);

    WarDrawMap(2);          --全黑显示命中人物
    ShowScreen();
    lib.Delay(200);

    WarDrawMap(0);
    ShowScreen();

    local HitXY={};               --记录命中点数的坐标
	local HitXYNum=0;
    for i = 0, WAR.PersonNum-1 do
	    local x1=WAR.Person[i]["坐标X"];
	    local y1=WAR.Person[i]["坐标Y"];		
		if WAR.Person[i]["死亡"]==false then
 		    if GetWarMap(x1,y1,4)>1 then
				SetWarMap(x1,y1,4,1)
			    local n=WAR.Person[i]["点数"]
				--lib.Debug(i..','..n)
					if n==0 then
						HitXY[HitXYNum]={x1,y1,"miss","  ","  "};						
					else
					  if WAR.FXXS[WAR.Person[i]["人物编号"]]==1 then
						HitXY[HitXYNum]={x1,y1,string.format("%d",n),"封穴"};
						WAR.FXXS[WAR.Person[i]["人物编号"]]=0
					  else
					    HitXY[HitXYNum]={x1,y1,string.format("%d",n),"  "};
					  end
                      if WAR.LXXS[WAR.Person[i]["人物编号"]]==1 then	
                          HitXY[HitXYNum][5]="流血"
						  WAR.LXXS[WAR.Person[i]["人物编号"]]=0
					  else
					      HitXY[HitXYNum][5]="  "
					  end
					end
				HitXYNum=HitXYNum+1;
				if WAR.TD>-1 then
				   if WAR.TD==118 then
				      say("１哈哈哈－－－，想偷偶的斗转星移？没门儿！要想得斗转下次就乖乖跟偶合作吧！",51)
				   else
				      instruct_2(WAR.TD,1) 
				   end
				   WAR.TD=-1
				end
				
 		    end
		end
	end
	
	--显示守方特效
	--for x=0,63 do			--清除第四层，和后面的有些冲突，暂时先不管了--改了，现在应该不冲突了
	--	for y=0,63 do SetWarMap(x,y,4,0) end
	--end
	--local fanji=false
	--for i = 0, WAR.PersonNum-1 do
	--	if WAR.Person[i][CC.TXDH]>100 then fanji=true break end;
	--	if WAR.Person[i][CC.TXDH]~=-1 then SetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],4,1) end
	--end
	--if not fanji then
	local sssid=lib.SaveSur(0,0,CC.ScreenW,CC.ScreenH);
	local TP=0;
	local TPXS={};
	for i = 0, WAR.PersonNum-1 do	
	      if WAR.Person[i][CC.TXDH]~=-1 then
		     TP=TP+1
			 TPXS[i]=TP
		  end
	end
	if TP~=0 then TP=math.modf(20/TP) end
	for ii=1,20 do
		local yanshi=false		
		for i = 0, WAR.PersonNum-1 do		
			local theeft=WAR.Person[i][CC.TXDH]
			if theeft~=-1 and ii<CC.Effect[theeft] then
				local dx=WAR.Person[i]["坐标X"]-x0--WAR.Person[WAR.CurID]["坐标X"]
				local dy=WAR.Person[i]["坐标Y"]-y0--WAR.Person[WAR.CurID]["坐标Y"]
				local rx=CC.XScale*(dx-dy)+CC.ScreenW/2;
				local ry=CC.YScale*(dx+dy)+CC.ScreenH/2;
				starteft=ii
				for i=0,WAR.Person[i][CC.TXDH]-1 do
					starteft=starteft+CC.Effect[i];
				end
				--lib.LoadSur(sssid,0,0)
				local hb=GetS(JY.SubScene,dx+x0,dy+y0,4)
				if CONFIG.Zoom==1 then
					hb=hb*2;
				end
				ry=ry-hb
				lib.PicLoadCache(3,starteft*2,rx,ry,2,192)
				if ii<TPXS[i]*TP and ii>(TPXS[i]-1)*TP then
				   KungfuString(WAR.Person[i][CC.TXWZ1],rx,ry,C_WHITE,24,CC.FontName,1)
				   KungfuString(WAR.Person[i][CC.TXWZ2],rx,ry,C_GOLD,24,CC.FontName,2)
				   KungfuString(WAR.Person[i][CC.TXWZ3],rx,ry,C_RED,24,CC.FontName,3)
				--DrawString(0,0,tostring(WAR.Person[i][CC.TXWZ1]).."|"..tostring(WAR.Person[i][CC.TXWZ2]).."|"..tostring(WAR.Person[i][CC.TXWZ3]),C_WHITE,16)
				--lib.ShowSurface(0)
				--lib.Delay(10)		
				   yanshi=true
				end
			end	
		end
		if yanshi then
			lib.ShowSurface(0)
			lib.LoadSur(sssid,0,0)
			lib.Delay(30)
		end
	end
	lib.FreeSur(sssid);
	--end

if HitXYNum>0 then
	local clips={};                --计算命中点数clip
	for i=0,HitXYNum-1 do
		local dx=HitXY[i][1]-x0;
		local dy=HitXY[i][2]-y0;
		local hb=GetS(JY.SubScene,HitXY[i][1],HitXY[i][2],4)
		if CONFIG.Zoom==1 then
			hb=hb*2;
		end
		local ll=string.len(HitXY[i][3]);
		local w=ll*CC.DefaultFont/2+1;
		clips[i]={x1=CC.XScale*(dx-dy)+CC.ScreenW/2,
				 y1=CC.YScale*(dx+dy)+CC.ScreenH/2-hb,
				 x2=CC.XScale*(dx-dy)+CC.ScreenW/2+w,
				 y2=CC.YScale*(dx+dy)+CC.ScreenH/2+CC.DefaultFont+1 };
	end

    local clip=clips[0];

	for i=1,HitXYNum-1 do
	    clip=MergeRect(clip,clips[i]);
	end

	local area=(clip.x2-clip.x1)*(clip.y2-clip.y1)
	
	
	local surid=lib.SaveSur(0,0,CC.ScreenW,CC.ScreenH);
	for y=3,5 do
    for i=5,15 do           --显示命中的点数
	    local tstart=lib.GetTime();
        local y_off=i*2+65;
        if fastdraw==1 and area <CC.ScreenW*CC.ScreenH/2 then
			local tmpclip={x1=clip.x1, y1=clip.y1-y_off, x2=clip.x2, y2=clip.y2-y_off};
			tmpclip=ClipRect(tmpclip);
			if tmpclip~=nil then
				lib.SetClip(tmpclip.x1,tmpclip.y1,tmpclip.x2,tmpclip.y2);
				WarDrawMap(0)
				for j=0,HitXYNum-1 do
					DrawString(clips[j].x1, clips[j].y1-y_off, HitXY[j][y],
							   WAR.EffectColor[WAR.Effect],CC.DefaultFont)						   
				end
			end
		else    --面积太大，直接重绘  YCXS
			lib.SetClip(0,0,CC.ScreenW,CC.ScreenH);
			--WarDrawMap(0)
			lib.LoadSur(surid,0,0);           		
			 for j=0,HitXYNum-1 do
				    DrawString(clips[j].x1, clips[j].y1-y_off, HitXY[j][y],
 			                   WAR.EffectColor[WAR.Effect],math.modf(CC.DefaultFont*3/3))
			 end	           			 
		end
		
		ShowScreen(1);
		lib.SetClip(0,0,0,0);

        local tend=lib.GetTime();
		if (tend-tstart)<CC.Frame then
	        lib.Delay(CC.Frame-(tend-tstart));
		end					
    end
	end
	lib.FreeSur(surid);
	
end	
	
	for i = 0, WAR.PersonNum-1 do
		WAR.Person[i][CC.TXDH]=-1
		WAR.Person[i][CC.TXWZ1]=nil
		WAR.Person[i][CC.TXWZ2]=nil
		WAR.Person[i][CC.TXWZ3]=nil
	end
	
    lib.SetClip(0,0,0,0);
    WarDrawMap(0);
    ShowScreen();
end

function War_WugongHurtLife(emenyid,wugong,level,ang)             --计算武功伤害生命
--武功伤害生命
--enemyid 敌人战斗id，
--wugong  我方使用武功
--返回：伤害点数
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local eid=WAR.Person[emenyid]["人物编号"];
	local dng=0
	local WGLX=JY.Wugong[wugong]["武功类型"]
	local function DWPD()
     if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then
	   return true;
	 else
	   return false;
	 end
    end
    --计算武学常识
    local mywuxue=0;
    local emenywuxue=0;
    for i=0,WAR.PersonNum-1 do
        local id =WAR.Person[i]["人物编号"]
        if WAR.Person[i]["死亡"]==false and JY.Person[id]["武学常识"]>10 then
            if WAR.Person[WAR.CurID]["我方"]==WAR.Person[i]["我方"] then
				if JY.Person[id]["武学常识"]>mywuxue then
					mywuxue=JY.Person[id]["武学常识"];
				end
            end
			if WAR.Person[emenyid]["我方"]==WAR.Person[i]["我方"] then
				if JY.Person[id]["武学常识"]>emenywuxue then
					emenywuxue=JY.Person[id]["武学常识"];
                                        if emenywuxue<50 then
                                           emenywuxue=50
                                        end
				end
            end
        end
    end

    --计算实际使用武功等级
    while true do
        if math.modf((level+1)/2)*JY.Wugong[wugong]["消耗内力点数"] > JY.Person[pid]["内力"] then
            level=level-1;
        else
            break;
        end
    end

    if level<=0 then     --防止出现左右互博时第一次攻击完毕，第二次攻击没有内力的情况。
	    level=1;
    end
	
	for i=1,10 do
		local kfid=JY.Person[eid]['武功'..i]
		if kfid>88 and kfid<109 and kfid~=97 and WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then
			if kfid==95 then
				if myrandom(20,eid) then
					WAR.Person[emenyid][CC.TXWZ2]=JY.Wugong[kfid]['名称']..'蓄力'
					WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85;
					local lv=math.modf(JY.Person[eid]['武功等级'..i]/100)+1;
					if WAR.tmp[200+eid]==nil or WAR.tmp[200+eid]==0 then
						WAR.tmp[200+eid]=lv*5;
					else
						WAR.tmp[200+eid]=WAR.tmp[200+eid]+lv*3;
					end
					if not inteam(eid) then
						dng=1000;
					end
					break;
				end
			end
			if myrandom(10,eid) or (eid==9 and myrandom(10+i*4,eid)) or (eid==0 and i==2 and kfid==91 and (JLSD(35,60,0) or (GetS(4,5,5,5)==6 and JLSD(30,70,0)))) or (PersonKF(95,eid) and JLSD(35,60,eid)) then
				local lv=math.modf(JY.Person[eid]['武功等级'..i]/100)+1
				local wl=JY.Wugong[kfid]['攻击力'..lv]
				if wl>dng then
					dng=wl
					WAR.Person[emenyid][CC.TXWZ2]=JY.Wugong[kfid]['名称']..'护体'					
					WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85--JY.Wugong[kfid]["武功动画&音效"]
				    WAR.NGHT=kfid
				end
			end
		end
	end

	if WAR.Defup[eid]==1 then 
	    if WAR.Person[emenyid][CC.TXWZ3]~=nil then
	      WAR.Person[emenyid][CC.TXWZ3]=WAR.Person[emenyid][CC.TXWZ3]..CC.WARS79
		else  
		  WAR.Person[emenyid][CC.TXWZ3]=CC.WARS80
		end
		if PersonKF(eid,101) then
		   dng=dng+1000
		else
		   dng=dng+500
		end
	end
	
	if eid==0 and WAR.NGHT==91 and GetS(10,0,7,0)==1 and GetS(4,5,5,5)~=8 then
	  if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then
	   local t=math.random(4);
	   local mc=JY.Wugong[91]["名称"]
	   if GetS(4,5,5,5)==6 and GetS(10,0,11,0)~=1 then t=math.random(2)+1 end
	   if t==3 then
	      WAR.Person[emenyid][CC.TXDH]=6
		  WAR.Person[emenyid][CC.TXWZ2]=mc..FLHSYL[2]
		  WAR.FLHS2=WAR.FLHS2+3
		elseif t==2 then
		  WAR.Person[emenyid][CC.TXDH]=6
		  WAR.Person[emenyid][CC.TXWZ2]=mc..FLHSYL[4]
		  WAR.FLHS4=1
		else
		  if (GetS(4,5,5,5)==6 or math.random(10)<5) and GetS(10,0,11,0)==1 then
			   WAR.Person[emenyid][CC.TXDH]=6
			   WAR.Person[emenyid][CC.TXWZ2]=mc..FLHSYL[5]
			   WAR.ACT=10
			   WAR.ZYHB=0
			   WAR.FLHS5=1
		  end
		end
	   end
	end	
	
	if eid==9 and WAR.Person[emenyid][CC.TXWZ2]==nil and PersonKF(9,106) then --ZWJ
		   WAR.Person[emenyid][CC.TXDH]=math.fmod(106,10)+85
		   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS81
		   dng=dng+1000	 
	end
	
	if eid==50 and WAR.Person[emenyid][CC.TXWZ2]==nil then 
		   WAR.Person[emenyid][CC.TXDH]=53
		   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS82
		   dng=dng+1500
	end
	
	if eid==103 then 
		   WAR.Person[emenyid][CC.TXDH]=math.fmod(98,10)+85
		   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS83
		   dng=dng+1000
	end
	
	if eid==18 then
	   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS84		
	   WAR.Person[emenyid][CC.TXDH]=math.fmod(106,10)+85
	   dng=dng+1200
	end
	
	if eid==64 then 
		   WAR.Person[emenyid][CC.TXDH]=math.fmod(100,10)+85
		   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS85
		   dng=dng+1000
	end
	
	if eid==26 then
	   WAR.Person[emenyid][CC.TXDH]=6
	   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS86
	   dng=dng+1200
	end
	
	if (PersonKF(eid,85) or T1LEQ(eid)) and JLSD(30,70,eid) then
	    if WAR.Person[emenyid][CC.TXDH]==-1 then
		   WAR.Person[emenyid][CC.TXDH]=85
		end
        if WAR.Person[emenyid][CC.TXWZ2]==nil then
		   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS87
		else
		   WAR.Person[emenyid][CC.TXWZ2]=WAR.Person[emenyid][CC.TXWZ2].."+"..CC.WARS87
		end   
		dng=dng+800
    end			
	
	for i=1,10 do
		local kfid=JY.Person[eid]['武功'..i]
		if kfid==43 and JY.Person[eid]["体力"]>10 and WAR.Person[emenyid]["反击武功"]==-1 and WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then			
			if JLSD(30,70,eid) or (eid==51 and JLSD(20,80,eid)) or (WAR.tmp[1000+eid]==1 and JLSD(30,70,eid)) then
			    local p=JY.Person[eid]
			    local dzlv=p["拳掌功夫"]+p["御剑能力"]+p["耍刀技巧"]+p["特殊兵器"]
			    local dzwz
			    if dzlv>=300 or eid==51 then
			      dzwz=CC.WARS88
				  WAR.DZXYLV[eid]=3
				elseif dzlv>=220 then
				  dzwz=CC.WARS89
				  WAR.DZXYLV[eid]=2
				else
				  dzwz=CC.WARS90
				  WAR.DZXYLV[eid]=1
				end
			
				if WAR.Person[emenyid][CC.TXWZ2]~=nil then
				   WAR.Person[emenyid][CC.TXWZ2]=WAR.Person[emenyid][CC.TXWZ2].."+"..dzwz
				else
				   WAR.Person[emenyid][CC.TXWZ2]=dzwz
				end
				if WAR.Person[emenyid][CC.TXDH]==nil then
				   WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85
				end
				WAR.Person[emenyid]["反击武功"]=wugong;
				JY.Person[eid]["体力"]=JY.Person[eid]["体力"]-3
				break
			end
		end
	end
	
	local hurt;
	if level>10 then 
		hurt=JY.Wugong[wugong]["攻击力" .. 10]/3
		level=10
	else
		hurt=JY.Wugong[wugong]["攻击力" .. level]/4
	end
	if wugong==64 and pid==0 and GetS(4,5,5,5)==3 then
	   hurt=hurt+math.modf(GetS(14,3,1,4)/3+1)
	end
    for i,v in ipairs(CC.ExtraOffense) do
        if v[1]==JY.Person[pid]["武器"] and v[2]==wugong then
            hurt=hurt+v[3]/4;
            break;
        end
    end
	
	if wugong==16 then
		if WAR.tmp[3000+pid]~=nil and WAR.tmp[3000+pid]>0 then
		   if WAR.tmp[3000+pid]>200 then WAR.tmp[3000+pid]=200 end
			hurt=hurt+WAR.tmp[3000+pid];
			WAR.tmp[3000+pid]=0;
		end
	end
	
	local atk=JY.Person[pid]["攻击力"];
	local def=JY.Person[eid]["防御力"];
	
	if JY.Status==GAME_WMAP then
		for i,v in pairs(CC.AddAtk) do
			if v[1]==pid then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["人物编号"]==v[2] and  WAR.Person[wid]["死亡"]==false then
						atk=atk+v[3];
					end
				end
			end
		end
		
		for i,v in pairs(CC.AddDef) do
			if v[1]==eid then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["人物编号"]==v[2] and  WAR.Person[wid]["死亡"]==false then
						def=def+v[3];
					end
				end
			end
		end
	end
	
	local t
	local function getnl(id)
		return (JY.Person[id]["内力"]*2+JY.Person[id]["内力最大值"])/3
	end
	if inteam(pid) then
		t=1;
	else
		hurt=hurt*1.2+30
		if GetS(0,0,0,0)~=1 then
			t=1.5;
		else
			t=2;
		end
	end
	atk=atk+t*getnl(pid)/50
	hurt=hurt+atk/4;
	if inteam(pid) then
		hurt=hurt+(mywuxue-emenywuxue)/2
	else
		hurt=hurt+(mywuxue-emenywuxue)/2
	end
	if inteam(eid) then
		t=1;
	else
		if GetS(0,0,0,0)~=1 then --WAR.Person[WAR.CurID]["我方"] and inteam(pid) 
			t=1.5;
		else 
			t=2;
		end
	end
	def=def+t*getnl(eid)/40+emenywuxue
	atk=atk+mywuxue+ang/10
	--def=def+emenywuxue
	hurt=hurt*atk/(atk+def)--*(1+(mywuxue-emenywuxue)/200)
	if inteam(pid)==false and WAR.tmp[200+pid]~=nil then
		hurt=hurt+WAR.tmp[200+pid]/2;
	end
	local function myrnd(x)
		if x<=1 then return 0 end
		return math.random(x*0.5,x)
	end
    if JY.Person[pid]["武器"]>=0 then
        hurt=hurt+myrnd(JY.Thing[JY.Person[pid]["武器"]]["加攻击力"]);
    end
    if JY.Person[pid]["防具"]>=0 then
        hurt=hurt+myrnd(JY.Thing[JY.Person[pid]["防具"]]["加攻击力"]);
    end
    if JY.Person[eid]["武器"]>=0 then
        hurt=hurt-myrnd(JY.Thing[JY.Person[eid]["武器"]]["加防御力"]);
    end
    if JY.Person[eid]["防具"]>=0 then
        hurt=hurt-myrnd(JY.Thing[JY.Person[eid]["防具"]]["加防御力"]);
    end
	
	hurt=hurt-def/8--JY.Person[eid]["防御力"]/8-JY.Person[eid]["内力"]/200
	
    hurt=hurt-dng/30+JY.Person[pid]["体力"]/5-JY.Person[eid]["体力"]/5+JY.Person[eid]["受伤程度"]/3-JY.Person[pid]["受伤程度"]/3+JY.Person[eid]["中毒程度"]/2-JY.Person[pid]["中毒程度"]/2;
	--[[
	local dlv=JY.Person[pid]["等级"]-JY.Person[eid]["等级"]
	if dlv>30 then dlv=30
	elseif dlv<-30 then dlv=-30 end	
	if (WAR.Person[WAR.CurID]["我方"] and dlv<0) or (WAR.Person[WAR.CurID]["我方"]==false and dlv>0) then
		hurt=hurt+dlv
	end--]]
	--[[
    if hurt <0 then
        hurt=Rnd(10)+myrnd(JY.Person[eid]["生命"]/100)+1;
    end
	--]]
    --考虑距离因素
	if inteam(pid) then--WAR.Person[WAR.CurID]["我方"] and inteam(pid)
		local offset=math.abs(WAR.Person[WAR.CurID]["坐标X"]-WAR.Person[emenyid]["坐标X"])+
					math.abs(WAR.Person[WAR.CurID]["坐标Y"]-WAR.Person[emenyid]["坐标Y"]);

		if offset <10 then
			hurt=hurt*(100-(offset-1)*3)/100;
		else
			hurt=hurt*2/3;
		end
	end
	
       if WAR.BJ==1 then
	      local SLWX=0
          for i=1,10 do
		        if JY.Person[eid]["武功" .. i]==106 or JY.Person[eid]["武功" .. i]==107 then
		           SLWX=SLWX+1
				end
		  end
          if JY.Person[eid]["内力性质"]==2	or (eid==0 and GetS(4,5,5,5)==5) then SLWX=SLWX+1 end
		  if SLWX==3 then 
              WAR.Person[emenyid][CC.TXDH]=6
			  if WAR.Person[emenyid][CC.TXWZ2]~=nil then
			     WAR.Person[emenyid][CC.TXWZ2]=WAR.Person[emenyid][CC.TXWZ2]..CC.WARS91
		      else
			     WAR.Person[emenyid][CC.TXWZ2]=CC.WARS92
		      end		  
		  else
			  if pid==44 or pid==98 or pid==99 or pid==100 then
				  hurt=hurt*2
			  else
				  hurt=math.modf(hurt*1.5);		
			  end
		  end		  
	   end
	
	   --if pid==27 and GetS(10,0,1,0)==1 then hurt=1 end
	     	   	   
	   if pid==50 then hurt=math.modf(hurt*1.5) end
	   
	   if eid==13 then hurt=math.modf(hurt*0.6) end
	    
	   if pid==37 and JY.Person[0]["品德"]>70 then 
	      hurt=math.modf((1+(JY.Person[0]["品德"]-70)/100)*hurt)
	   end
	   
	   if pid==63 and JY.Person[pid]["生命"]<math.modf(JY.Person[pid]["生命最大值"]/2) then
	      hurt=math.modf(hurt*1.2);	
	   end
	
	   if WAR.DJGZ==1 then hurt=math.modf(hurt*1.3) end
	   
	   if WAR.MCF==1 then hurt=math.modf(hurt*2) end
	   
	   if WAR.TFH==1 then hurt=math.modf(hurt*1.1) end 
	   
	   if WAR.WQQ==1 then hurt=math.modf(hurt*(1+math.random(200)/100)) end
	   
	   if pid==64 then hurt=math.modf(hurt*(1+WAR.ZBT/10)) end
	   
	   if WAR.LXZQ==1 then hurt=math.modf(hurt*1.3) end
	   
	   if pid==82 then
			local s=0
			for j=0,WAR.PersonNum-1 do
				if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then                            			   			                   
				   if JY.Person[WAR.Person[j]["人物编号"]]["性别"]==1 then
					  s=s+1
				   end
				end
			end
	   	   hurt=math.modf(hurt*(1+s/10))
	   end
	   
	for i=1,10 do
	    if JY.Person[pid]["武功"..i]==107 and (JY.Person[pid]["内力性质"]==0 or (pid==0 and GetS(4,5,5,5)==5)) then
		   hurt=math.modf(hurt*1.2);
		   break
		end
	end
	
	for i=1,10 do
	    if JY.Person[eid]["武功"..i]==106 and (JY.Person[eid]["内力性质"]==1 or (eid==0 and GetS(4,5,5,5)==5)) then
		   hurt=math.modf(hurt*0.8);
		   break
		end
	end
	
	if GetS(4,5,5,5)==1 and pid==0 then
	   local lxzq=0;
	    for i=1,10 do
	        if JY.Person[0]["武功"..i]==109 or (JY.Person[0]["武功"..i]<27 and JY.Person[0]["武功"..i]>0) then
			    if JY.Person[0]["武功等级"..i]==999 then
				   lxzq=lxzq+1
				end
			end
		end
	        hurt=math.modf(hurt*(1+0.05*lxzq)); 
	end
	
	if GetS(4,5,5,5)==3 and eid==0 then
	   local askd=0;
	    for i=1,10 do
	        if JY.Person[0]["武功"..i]==111 or (JY.Person[0]["武功"..i]<68 and JY.Person[0]["武功"..i]>49) then
			    if JY.Person[0]["武功等级"..i]==999 then
				   askd=askd+1
				end
			end
		end
	        hurt=math.modf(hurt*(1-0.05*askd)); 
	end
		
	if WAR.ZDDH==118 and pid==5 then
	   --hurt=math.modf(hurt*0.8);
	end
	
	if pid==79 then
	   local JF=0;
	   for i=1,10 do
	         if JY.Person[79]["武功"..i]<50 and JY.Person[79]["武功"..i]>26 then
			    if JY.Person[79]["武功等级"..i]==999 then
				   JF=JF+1
				end
		     end
	   end
	   hurt=math.modf(hurt*(1+0.05*JF));
	end
				
	
	if not inteam(pid) then 
	     for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["人物编号"]==87 or WAR.Person[j]["人物编号"]==74 then
	            if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]~=WAR.Person[WAR.CurID]["我方"] then			    
		            hurt=math.modf(hurt*0.9);
			    end
			end
		 end
	end
	
	if inteam(pid) then 
	     for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["人物编号"]==86 or WAR.Person[j]["人物编号"]==80 then
	            if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then			    
		            hurt=math.modf(hurt*1.1);
			    end
			end
		 end
	end
	
	if WAR.BSMT==1 then hurt=math.modf(hurt+100+math.random(50)) end
	 
    if WAR.DZXYLV[pid]~=nil and WAR.DZXYLV[pid]>10 then 
	    hurt=math.modf(hurt*WAR.DZXYLV[pid]/100) 
		ang=ang+WAR.DZXYLV[pid]*10
	end
	 
	if WAR.tmp[1000+pid]==1 and inteam(pid) then hurt=math.modf(hurt*1.35) end
	if WAR.tmp[1000+eid]==1 and inteam(eid) then hurt=math.modf(hurt*0.7) end
	 
    hurt=math.modf(hurt);--hurt2
	
	
	if inteam(pid) then hurt=math.modf(hurt*(1-JY.Person[pid]["受伤程度"]*0.002)) end
	if inteam(eid) then hurt=math.modf(hurt*(1+JY.Person[pid]["受伤程度"]*0.0015)) end
		
	if pid==5 and WAR.ZDDH>220 then hurt=math.modf(hurt*1.1) end
	if WAR.ZSF2==1 then
	   hurt=math.modf(hurt*1.2)
	end	
	
	if pid==60 and WAR.ZDDH==171 then hurt=math.modf(hurt*0.75) end
	if eid==60 and WAR.ZDDH==171 then hurt=math.modf(hurt*1.2) end
	
	if WAR.ZDDH==14 then
			    if pid==173 or pid==174 or pid==175 then
			      local shz=0;
				    for j=0,WAR.PersonNum-1 do
	                   if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then                            			   			                   
		                  shz=shz+1
					   end
				    end
					if shz==3 then 
					   hurt=math.modf(hurt*1.5) 
					   ang=ang+1000					   
					end
				end  				
	end	
	if WAR.ZDDH==14 then
			    if eid==173 or eid==174 or eid==175 then
			      local shz=0;
				    for j=0,WAR.PersonNum-1 do
	                   if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[emenyid]["我方"] then                            			   			                   
		                  shz=shz+1
					   end
				    end
					if shz==3 then 
					   hurt=math.modf(hurt*0.5) 
					   dng=dng+1000
					end
				end  				
	end	
	
	if WAR.HDWZ==1 then 
	   hurt=math.modf(hurt+50)
	    JY.Person[eid]["中毒程度"]=JY.Person[eid]["中毒程度"]+15
		if JY.Person[eid]["中毒程度"]>100 then JY.Person[eid]["中毒程度"]=100 end
	end
	
	if eid==114 then hurt=math.modf(hurt*0.6) end
		
	if eid==5 and math.random(10)<8 then
	   WAR.Person[emenyid][CC.TXWZ3]=CC.WARS93
	   WAR.Person[emenyid][CC.TXDH]=math.fmod(99,10)+85
	   hurt=math.modf(hurt*0.5);
	end
	
	local defadd=0;
	if wugong<109 and wugong>88 then 
	   JY.Wugong[wugong]["武功类型"]=math.random(4) 
	end
	if JY.Wugong[wugong]["武功类型"]==1 then
		defadd=JY.Person[eid]["拳掌功夫"];
	elseif JY.Wugong[wugong]["武功类型"]==2 then
		defadd=JY.Person[eid]["御剑能力"];
	elseif JY.Wugong[wugong]["武功类型"]==3 then
		defadd=JY.Person[eid]["耍刀技巧"];
	elseif JY.Wugong[wugong]["武功类型"]==4 then
		defadd=JY.Person[eid]["特殊兵器"];
	end
	hurt=math.modf(hurt*limitX(1.2-defadd/240,0.2,1.2));	
	
	if eid==35 and GetS(10,1,1,0)==1 and JLSD(15,85,eid) then
	 if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then
	   if JY.Wugong[wugong]["武功类型"]==1 then
	      WAR.Person[emenyid][CC.TXWZ3]=CC.WARS99
	   elseif JY.Wugong[wugong]["武功类型"]==2 then 
		  WAR.Person[emenyid][CC.TXWZ3]=CC.WARS100
	   elseif JY.Wugong[wugong]["武功类型"]==3 then
	      WAR.Person[emenyid][CC.TXWZ3]=CC.WARS101
	   elseif JY.Wugong[wugong]["武功类型"]==4 then
	      WAR.Person[emenyid][CC.TXWZ3]=CC.WARS102
	   end
	   if wugong<109 and wugong>88 then 
	      WAR.Person[emenyid][CC.TXWZ3]=CC.WARS103
	   end	    
	   WAR.Person[emenyid][CC.TXDH]=83	   
	   hurt=math.modf(hurt*(4+math.random(3))/10)	
      end	   
	end
	
	if eid==50 then
	   hurt=math.modf(hurt*0.85)
	   local minhurt=math.modf(hurt/4)
	   hurt=math.modf(hurt*JY.Person[eid]["生命"]/JY.Person[eid]["生命最大值"])
	   if hurt<minhurt then hurt=minhurt end	   
	end
	
	if WAR.Actup[pid]~=nil and WAR.DZXY~=1 then 
	    if PersonKF(pid,103) then
	      hurt=math.modf(hurt*1.4)
        else 		  
		  hurt=math.modf(hurt*1.25)
		end  
	end
	
	if WAR.Defup[eid]==1 then 
	    if PersonKF(eid,101) then
	      hurt=math.modf(hurt*0.6) 
		else
		  hurt=math.modf(hurt*0.75)
		end
	end
	
	if WAR.ACT>1 and pid~=27 then
       	hurt=math.modf(hurt*0.7)
		ang=math.modf(ang*0.7)
    end	
	
	local hurt2=0;
	local hurt2js=0;
	
	if JY.Thing[202][WZ7]==1 then  --MODEWL
	   if not inteam(pid) then hurt=math.modf(hurt*0.6) end 
	   if inteam(pid) then hurt=math.modf(hurt*0.7) end
	   hurt2js=6
	elseif JY.Thing[202][WZ7]==2 then
	   if not inteam(pid) then hurt=math.modf(hurt*1) end 
	   if inteam(pid) then hurt=math.modf(hurt*0.65) end
	   hurt2js=5
	else
	   if not inteam(pid) then hurt=math.modf(hurt*1.1) end 
	   if inteam(pid) then hurt=math.modf(hurt*0.6) end
	   hurt2js=4
	end	
	
	if inteam(pid) then
	    hurt2=math.modf(math.random(5)+atk/7)
	else
	    hurt2=math.modf(math.random(20)+atk/hurt2js)
	end
	if not inteam(pid) then hurt2=math.modf(hurt2*1.2) end
    if hurt<hurt2 then
		hurt=hurt2
    end
	
	if WAR.LHQ_BNZ==1 then hurt=hurt+50 end
	if WAR.JGZ_DMZ==1 then hurt=hurt+100 end
	
	if WAR.KHCM[pid]==1 then 
	    hurt=0 		
	end
	
	if eid==27 and JLSD(25,75,eid) then
	   hurt=math.modf(hurt/3) 
	   ang=0
	   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS94
	   WAR.Person[emenyid][CC.TXDH]=math.fmod(105,10)+85
    end 
	
    if eid==88 and JLSD(35,65,eid) then
	   hurt=0
	   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS95
	   WAR.Person[emenyid][CC.TXDH]=89
    end 	

    if eid==53 then
	    if WAR.TZ_DY==1 then
		    if JLSD(10,90,eid) then
			   hurt=0
			   WAR.Person[emenyid][CC.TXWZ2]=CC.WARS96
			   WAR.Person[emenyid][CC.TXDH]=88
			end
		else
		    if JLSD(30,60,eid) then
		       hurt=0
	           WAR.Person[emenyid][CC.TXWZ2]=CC.WARS96
	           WAR.Person[emenyid][CC.TXDH]=88
			end
		end	   
    end 
	
    if eid==36 then
	    for i=1,10 do
	         if JY.Person[eid]["武功"..i]==105 and math.random(10)<6 then
			    hurt=math.modf(hurt/3) 
	            ang=0
			    WAR.Person[emenyid][CC.TXWZ2]=CC.WARS97
			    WAR.Person[emenyid][CC.TXDH]=51	  
		        break
			 end
		end
	end

	if GetS(4,5,5,5)==4 and eid==0 then
	    local gctj=0;
	    for i=1,10 do
	        if JY.Person[0]["武功"..i]==112 or (JY.Person[0]["武功"..i]<85 and JY.Person[0]["武功"..i]>67) then
			    if JY.Person[0]["武功等级"..i]==999 then
				   gctj=gctj+1
				end
			end
		end
	        local tjsf=10+gctj*5
			if JLSD(30,30+tjsf,eid) then 
				hurt=0 
				WAR.Person[emenyid][CC.TXWZ3]=CC.WARS98
				WAR.Person[emenyid][CC.TXDH]=88
            end				
	end

    if eid==0 and WAR.FLHS4>0 and hurt>0 then hurt=10 end

	if eid==0 and WAR.JSTG>0 then
	    if WAR.JSTG>=hurt then
	      WAR.JSTG=WAR.JSTG-hurt
		  hurt=5+Rnd(6)
		  ang=math.modf(ang/2)
		else
		   hurt=hurt-WAR.JSTG
		   WAR.JSTG=0
		end
		if WAR.Person[emenyid][CC.TXWZ3]==nil then
		   WAR.Person[emenyid][CC.TXWZ3]=CC.WARS104
		else
		   WAR.Person[emenyid][CC.TXWZ3]=WAR.Person[emenyid][CC.TXWZ3]..CC.WARS105
		end
		WAR.Person[emenyid][CC.TXDH]=6	
	end
	
	for i=1,10 do  --乾坤大挪移伤害反弹
		local kfid=JY.Person[eid]['武功'..i]
		if WAR.QKNY<2 and kfid==97 and WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] and pid~=114 and pid~=50 then
			local lv=math.modf(JY.Person[eid]['武功等级'..i]/100)+1
			if (hurt>20 and math.random(10)<5) or (eid==9 and hurt>20 and math.random(10)<7) then			  			  
				--WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['名称']..'反弹'
				--SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],4,2)
				--local selfhurt=math.modf(hurt*30/100)+Rnd(9)+1
				WAR.fthurt=0
				WAR.fthurt=math.modf(hurt*30/100)
                        hurt=math.modf(hurt*(100-30)/100)
                if eid==9 then
                    WAR.fthurt=math.modf(hurt*50/100)
                    hurt=math.modf(hurt*(100-50)/100)
                end               
                
				local nydx={};
				local nynum=1;
				for i=0,WAR.PersonNum-1 do	
                    if WAR.Person[i]["我方"]~=WAR.Person[emenyid]["我方"] and WAR.Person[i]["死亡"]==false then
				         nydx[nynum]=i
						 nynum=nynum+1
					end
				end
				local nyft=nydx[math.random(nynum-1)];
				local nyft2=nydx[math.random(nynum-1)];
				--SetWarMap(WAR.Person[nyft]["坐标X"],WAR.Person[nyft]["坐标Y"],4,2)
				JY.Person[WAR.Person[nyft]["人物编号"]]["生命"]=JY.Person[WAR.Person[nyft]["人物编号"]]["生命"]-math.modf(WAR.fthurt/2+Rnd(3))
				if JY.Person[WAR.Person[nyft]["人物编号"]]["生命"]<1 then 
				   JY.Person[WAR.Person[nyft]["人物编号"]]["生命"]=0 				   
				end
				--WAR.Person[nyft]["点数"]=-fthurt
				WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['名称']..CC.WARS106--..JY.Person[WAR.Person[nyft]["人物编号"]]["姓名"]
				WAR.NYSH[nyft]=1
				if eid==9 and nyft~=nyft2 then
				    --SetWarMap(WAR.Person[nyft2]["坐标X"],WAR.Person[nyft2]["坐标Y"],4,2)
					JY.Person[WAR.Person[nyft2]["人物编号"]]["生命"]=JY.Person[WAR.Person[nyft2]["人物编号"]]["生命"]-math.modf(WAR.fthurt/2+Rnd(3))
					if JY.Person[WAR.Person[nyft2]["人物编号"]]["生命"]<1 then JY.Person[WAR.Person[nyft2]["人物编号"]]["生命"]=0 end
					--WAR.Person[nyft2]["点数"]=-fthurt
					WAR.Person[emenyid][CC.TXWZ1]=WAR.Person[emenyid][CC.TXWZ1]..CC.WARS107--"+"..JY.Person[WAR.Person[nyft2]["人物编号"]]["姓名"]
				    WAR.NYSH[nyft2]=1
				end
				--[[JY.Person[pid]["生命"]=JY.Person[pid]["生命"]-math.modf(selfhurt/2)
				if JY.Person[pid]["生命"]<=0 then JY.Person[pid]["生命"]=1 end
				WAR.Person[WAR.CurID]["点数"]=-selfhurt]]
				WAR.QKNY=WAR.QKNY+1
				 if WAR.Person[emenyid][CC.TXDH]==-1 then
				    WAR.Person[emenyid][CC.TXDH]=math.fmod(97,10)+85--JY.Wugong[kfid]["武功动画&音效"]
			     end				 
				break
			end
		elseif WAR.tmp[1000+eid]~=1 and WAR.ZDDH~=171 and eid==60 then --(kfid==104 and inteam(eid) or eid==60) 
			local lv=math.modf(JY.Person[eid]['武功等级'..i]/100)+1
			if ((hurt>150 and JLSD(45,60,eid)) or eid==60 or hurt>350) and JY.Person[eid]["体力"]>50 then
				WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85--JY.Wugong[kfid]["武功动画&音效"]
				if eid==60 then
				WAR.Person[emenyid][CC.TXWZ1]=CC.WARS108
				else
				WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['名称']..CC.WARS109
				end
				WAR.tmp[1000+eid]=1;
				break;
			end
		end
	end
	
	if eid==9 and WAR.Person[emenyid][CC.TXWZ1]==nil then
	   if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] and hurt>10 and PersonKF(9,106) then --ZWJ
		   WAR.Person[emenyid][CC.TXDH]=math.fmod(97,10)+85
		   WAR.Person[emenyid][CC.TXWZ1]=CC.WARS110
		   SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],4,2)
		   local selfhurt=math.modf(hurt*0.3)
		   JY.Person[pid]["生命"]=JY.Person[pid]["生命"]-math.modf(selfhurt/2)
		   WAR.Person[WAR.CurID]["点数"]=-selfhurt
		   if JY.Person[pid]["生命"]<=0 then JY.Person[pid]["生命"]=0 end
	    end
    end
	
	if WAR.Person[WAR.CurID]["我方"]==WAR.Person[emenyid]["我方"] and WAR.tmp[1000+pid]==nil then
		if WAR.Person[WAR.CurID]["我方"] then		    
            hurt=math.modf(hurt*0.5)+Rnd(3)	          		   
		else
			hurt=math.modf(hurt*0.2)+Rnd(3)
		end
	end
	
	if inteam(eid) then--WAR.Person[emenyid]["我方"] then--or GetS(0,0,0,0)~=1 then
		JY.Person[eid]["生命"]=JY.Person[eid]["生命"]-hurt;
	else
		JY.Person[eid]["生命"]=JY.Person[eid]["生命"]-math.modf(hurt*0.5);
	end
	
	for i=1,10 do
		local kfid=JY.Person[eid]['武功'..i]
		if kfid==16 then
			if WAR.tmp[3000+eid]==nil then
				WAR.tmp[3000+eid]=0;
			end
			WAR.tmp[3000+eid]=hurt;--+WAR.tmp[3000+eid];
		end
	end
	
    WAR.Person[WAR.CurID]["经验"]=WAR.Person[WAR.CurID]["经验"]+math.modf(hurt/5);
	
	if JY.Person[eid]["生命"]<=0 then  --神照起死回生
		for i=1,10 do
			local kfid=JY.Person[eid]['武功'..i]
		if kfid==94 and WAR.tmp[2000+eid]==nil then
				WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85--JY.Wugong[kfid]["武功动画&音效"]								
				WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['名称']..CC.WARS111			
				local lv=math.modf(JY.Person[eid]['武功等级'..i]/100)+1				
				if eid==37 then
				JY.Person[eid]["生命"]=JY.Person[eid]["生命最大值"]
				else
				JY.Person[eid]["生命"]=math.modf(JY.Person[eid]["生命最大值"]*(1+lv)/25)
				end
				JY.Person[eid]["内力"]=math.modf((JY.Person[eid]["内力"]+JY.Person[eid]["内力最大值"])/2)
				JY.Person[eid]["体力"]=math.modf((JY.Person[eid]["体力"]+50)/2)
				JY.Person[eid]["中毒程度"]=math.modf(JY.Person[eid]["中毒程度"]/2)
				JY.Person[eid]["受伤程度"]=math.modf(JY.Person[eid]["受伤程度"]/2)
                  WAR.Person[emenyid]["Time"]=WAR.Person[emenyid]["Time"]+500
				  if eid==37 then 
				     WAR.Person[emenyid]["Time"]=990 
					 WAR.DYSZ=1
				  end
				  if WAR.Person[emenyid]["Time"]>990 then WAR.Person[emenyid]["Time"]=990 end
				if math.random(10)~=8 then
					WAR.tmp[2000+eid]=1;
				end
			end
		end
	end
	
	if JY.Person[eid]["生命"]<=0 and (eid==129 or eid==65) and WAR.WCY<1 then
	   WAR.Person[emenyid][CC.TXDH]=19
	   WAR.Person[emenyid][CC.TXWZ1]=CC.WARS112
	   WAR.WCY=WAR.WCY+1
	   JY.Person[eid]["生命"]=JY.Person[eid]["生命最大值"]
	   JY.Person[eid]["内力"]=JY.Person[eid]["内力最大值"]
	   JY.Person[eid]["中毒程度"]=0
	   JY.Person[eid]["受伤程度"]=0
	   JY.Person[eid]["体力"]=100
	   WAR.Person[emenyid]["Time"]=980
	end
	
	if JY.Person[eid]["生命"]<=0 and WAR.XMH==0 then 
        for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["人物编号"]==45 and WAR.Person[i]["死亡"]==false and WAR.Person[i]["我方"]==WAR.Person[emenyid]["我方"] then
	           WAR.Person[emenyid][CC.TXDH]=89
	           WAR.Person[emenyid][CC.TXWZ1]=CC.WARS113
			   JY.Person[eid]["生命"]=JY.Person[eid]["生命最大值"]
			   JY.Person[eid]["内力"]=JY.Person[eid]["内力最大值"]
			   JY.Person[eid]["中毒程度"]=0
			   JY.Person[eid]["受伤程度"]=0
			   JY.Person[eid]["体力"]=100
			   WAR.FXDS[eid]=nil
			   WAR.LXZT[eid]=nil
			   WAR.XMH=1
			   break
			end
		end
	end
			   
	if eid==553 and JY.Person[eid]["生命"]<=0 then WAR.YZB=1 end--YZB
   
    if JY.Person[eid]["生命"]<=0 then                 --打死敌人获得额外经验
        JY.Person[eid]["生命"]=0;
        WAR.Person[WAR.CurID]["经验"]=WAR.Person[WAR.CurID]["经验"]+JY.Person[eid]["等级"]*5;
		WAR.Person[emenyid]["反击武功"]=-1
    end
	ang=ang-dng;
	if ang>0 then
		dng=0;
	else
		dng=-ang;
		ang=0;
	end
	
	if eid==114 then
	   --[[DrawStrBox(CC.ScreenW/2+200,24,"天地独尊",C_ORANGE,30)
                  ShowScreen()
                  lib.Delay(400)]]--
       	--WAR.Person[emenyid][CC.TXDH]=89								
		WAR.Person[emenyid][CC.TXWZ2]=CC.WARS114	
        WAR.Person[emenyid][CC.TXDH]=39		
	    dng=1
	end
	if hurt<20 then dng=1 end
	
	if eid==37 and WAR.DYSZ==1 then
	   dng=1
	   WAR.DYSZ=0
	end
	
	if eid==0 and WAR.FLHS4>0 then dng=1 end
	
	for i=1,10 do	     
	     if JY.Person[eid]["武功"..i]==16 or JY.Person[eid]["武功"..i]==46 then
		    if JY.Person[eid]["武功等级"..i]==999 then
		        WAR.TJAY=WAR.TJAY+1
		    end
		end
	end
	
	if WAR.TJAY==2 and JLSD(15,45+math.modf(JY.Person[eid]["资质"]/2.5),eid) then 
	   dng=1 
	   if WAR.Person[emenyid][CC.TXWZ2]~=nil and WAR.Person[emenyid][CC.TXWZ2]~=" " then
	       WAR.Person[emenyid][CC.TXWZ2]=WAR.Person[emenyid][CC.TXWZ2]..CC.WARS115
	   else
	       WAR.Person[emenyid][CC.TXWZ2]=CC.WARS116
	   end
	   WAR.Person[emenyid][CC.TXDH]=21	   
	end
	
	WAR.TJAY=0
	
	--[[if eid==35 and GetS(10,1,1,0)==1 and math.random(10)<6 then 
	   dng=1 
	   WAR.Person[emenyid][CC.TXWZ2]="万剑归宗·剑气护体"
	   --WAR.Person[emenyid][CC.TXDH]=21	  
	end]]
	
	if WAR.ASKD==1 then dng=0 end
	
	if dng==0 then
	    if inteam(eid) then
			if pid==80 then
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt*2/12));
				else
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt*2/6));
				end
			else
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt/12));
				else
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt/6));
				end
			end
		else
		    if pid==80 then
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt*2/16));
				else
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt*2/8));
				end
			else
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt/16));
				else
				 AddPersonAttrib(eid,"受伤程度",myrnd(hurt/8));
				end
			end
        end			
	end
	   
	if dng==0 and WAR.Person[WAR.CurID]["我方"]~=WAR.Person[emenyid]["我方"] then
        local killsq=0;
		if JY.Thing[202][WZ7]==1 then  --MODEWL
		   killsq=8
		elseif JY.Thing[202][WZ7]==2 then
		   killsq=7
		else
		   killsq=6
		end	
	   
	   if inteam(eid) then	
	      WAR.Person[emenyid]["TimeAdd"]=WAR.Person[emenyid]["TimeAdd"]-math.modf(ang/killsq);		
	   else
	      WAR.Person[emenyid]["TimeAdd"]=WAR.Person[emenyid]["TimeAdd"]-math.modf(ang/8);		
	   end		
		local spdhurt=0;
		if inteam(eid) then  --SJQ
			spdhurt=math.modf(hurt*0.7);
		end
		for i=1,10 do
			if JY.Person[pid]["武功"..i]==103 then
				spdhurt=math.modf(hurt*2/5);
				break;
			end
		end
		for i=1,10 do
			if JY.Person[eid]["武功"..i]==101 then
				spdhurt=0;
			end
		end
		WAR.Person[emenyid]["TimeAdd"]=WAR.Person[emenyid]["TimeAdd"]-spdhurt;		
	end

        if eid==59 and JY.Person[eid]["生命"]<=0 then 
		   WAR.XK=1 
		   WAR.XK2=WAR.Person[emenyid]["我方"]
		end        
  
		if pid==60 then
		   JY.Person[eid]["中毒程度"]=JY.Person[eid]["中毒程度"]+30
		    if JY.Person[eid]["中毒程度"]>100 then JY.Person[eid]["中毒程度"]=100 end
		end
		
	    if WAR.TD==-2 then
		   local i; 
	       i=math.random(4);		   
	       if JY.Person[eid]["携带物品数量"..i]>0 and JY.Person[eid]["携带物品"..i]>-1 and WAR.Person[WAR.CurID]["我方"]~=WAR.Person[emenyid]["我方"] then
		      JY.Person[eid]["携带物品数量"..i]=JY.Person[eid]["携带物品数量"..i]-1
			  WAR.TD=JY.Person[eid]["携带物品"..i]
			  if JY.Person[eid]["携带物品数量"..i]<1 then 
			     JY.Person[eid]["携带物品"..i]=-1
			  end
              --if WAR.TD==81 then WAR.TD=-1 end			  
		   else
              WAR.TD=-1	
           end			  
        end
				
		if WAR.XDDF==1 then
		   JY.Person[pid]["生命"]=JY.Person[pid]["生命"]+math.modf(hurt*0.1)
		   if JY.Person[pid]["生命"]>JY.Person[pid]["生命最大值"] then 
		      JY.Person[pid]["生命"]=JY.Person[pid]["生命最大值"]
		   end
		   WAR.XDXX=WAR.XDXX+math.modf(hurt*0.1)
		end
		
		if eid==85 and JY.Person[eid]["生命"]>0 then
		   JY.Person[eid]["生命"]=JY.Person[eid]["生命"]+50
		   if JY.Person[eid]["生命"]>JY.Person[eid]["生命最大值"] then 
		      JY.Person[eid]["生命"]=JY.Person[eid]["生命最大值"]
		   end
		end
		
		if eid==516 and JY.Person[eid]["生命"]>0 then
		   JY.Person[eid]["生命"]=JY.Person[eid]["生命"]+150
		   if JY.Person[eid]["生命"]>JY.Person[eid]["生命最大值"] then 
		      JY.Person[eid]["生命"]=JY.Person[eid]["生命最大值"]
		   end
		end
		   
		if WAR.HQT==1 then
		    JY.Person[eid]["体力"]=JY.Person[eid]["体力"]-15
		   if JY.Person[eid]["体力"]<1 then 
		      JY.Person[eid]["体力"]=1
		   end
		end
		
		if WAR.CY==1 then
		    JY.Person[eid]["内力"]=JY.Person[eid]["内力"]-300
		   if JY.Person[eid]["内力"]<1 then 
		      JY.Person[eid]["内力"]=1
		   end
		end
		
		if WAR.Data["代号"]==0 then
		   if pid==72 and eid==3 and JY.Person[eid]["生命"]<=0 and JY.Person[72]["武功1"]==28 then
		      WAR.TGN=1
		   end
		end
		
		if eid~=445 and eid~=446 and eid<578 and eid~=64 and WAR.ZDDH~=17 then
		   if pid==4 and JY.Person[eid]["生命"]<=0 and inteam(pid) then
		      if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] and not inteam(eid) then
		         WAR.YJ=WAR.YJ+math.random(15)+25
			  end
		   end
		end
		
		if pid==72 then 
		    for j=0,WAR.PersonNum-1 do
		      if WAR.Person[j]["人物编号"]==4 then
	            if WAR.Person[j]["死亡"]==false and WAR.Person[j]["我方"]==WAR.Person[WAR.CurID]["我方"] then			    
		            JY.Person[eid]["中毒程度"]=JY.Person[eid]["中毒程度"]+5+math.random(15)
		            if JY.Person[eid]["中毒程度"]>100 then JY.Person[eid]["中毒程度"]=100 end
			    end
			  end
			end
		end
		
		if WAR.KHBX==1 and hurt>0 then WAR.KHCM[eid]=1 end
		   
		if WAR.GBWZ==1 and math.random(10)<6 then
		    if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then 
		        JY.Person[eid]["生命"]=0
		    end
	    end
		
        if not inteam(pid) then
		   local gfxp={114,26,129,65,18,39,70,98,57,185}; --10
		    for g=1,10 do
		        if pid==gfxp[g] and JLSD(30,70,pid) then
				   WAR.BFX=1
				   break;
				end
		    end
		end
		if WAR.LXZQ==1 and JLSD(25,75,pid) then WAR.BFX=1 end

		if PersonKF(eid,104)==false and hurt>100 and (JLSD(30,75,pid) or WAR.GCTJ==1 or WAR.BFX==1) then 
		  if WGLX==1 or WGLX==4 or JLSD(35,70,pid) or WAR.BFX==1 then
		   if WAR.FXDS[eid]==nil then
		      if inteam(eid) then
		         WAR.FXDS[eid]=math.modf(hurt/10)
				 if WAR.FXDS[eid]<15 then WAR.FXDS[eid]=15 end
			  else
			     WAR.FXDS[eid]=math.modf(hurt/15)
				 if WAR.FXDS[eid]<10 then WAR.FXDS[eid]=10 end
			  end
		   else
		      if inteam(eid) then
		         WAR.FXDS[eid]=WAR.FXDS[eid]+math.modf(hurt/10) 
			  else
			     WAR.FXDS[eid]=WAR.FXDS[eid]+math.modf(hurt/15) 
			  end
		   end
		   WAR.FXXS[eid]=1
		    if WAR.FXDS[eid]>50 then WAR.FXDS[eid]=50 end
		  end
		end
		WAR.BFX=0
		
		 if not inteam(pid) then
		   local glxp={6,3,40,97,103,19,60,71,189,27}; --10
		    for g=1,10 do
		        if pid==glxp[g] and JLSD(30,70,pid) then
				   WAR.BLX=1
				   break;
				end
		    end
		end
		if WAR.ASKD==1 and JLSD(25,75,pid) then WAR.BLX=1 end
		
		if hurt>50 and (JLSD(30,75,pid) or WAR.GCTJ==1 or WAR.BLX==1) then
		   if WGLX~=1 or JLSD(35,70,pid) or WAR.BLX==1 then
			   if WAR.LXZT[eid]==nil then		     
				   WAR.LXZT[eid]=math.modf(hurt/5)
			   else
					WAR.LXZT[eid]=WAR.LXZT[eid]+math.modf(hurt/5)
			   end
			   WAR.LXXS[eid]=1
			   if WAR.LXZT[eid]>100 then WAR.LXZT[eid]=100 end
		   end
        end	
        WAR.BLX=0		
		
		--if eid==0 and JY.Person[eid]["体力"]>70 then WAR.tmp[1000]=1 end
		
		if JY.Person[eid]["生命"]>0 and (WAR.LQZ[eid]==nil or WAR.LQZ[eid]<100) and DWPD() and WAR.DZXY~=1 and WAR.ASKD~=1 then
		   local minlqzj=math.modf((hurt/3)*0.2)
		   local lqzj=math.random(math.modf(hurt/3)+1)
		   if lqzj<minlqzj then lqzj=minlqzj end
		   
		   if WAR.LQZ[eid]==nil then
		      WAR.LQZ[eid]=lqzj+2
		   else
		      WAR.LQZ[eid]=WAR.LQZ[eid]+lqzj+2
		   end
		   if WAR.Person[emenyid]["我方"]==false then 
		        local flqzj=0;
			    if JY.Thing[202][WZ7]==1 then  --MODEWL
				   flqzj=1
				elseif JY.Thing[202][WZ7]==2 then
				   flqzj=8
				else
				   flqzj=12
				end				  
		       WAR.LQZ[eid]=WAR.LQZ[eid]+flqzj;
		   end		      		   
		   if WAR.LQZ[eid]>100 then 
		       WAR.LQZ[eid]=100
			   WAR.Person[emenyid][CC.TXDH]=6
			   if WAR.Person[emenyid][CC.TXWZ3]~=nil then
			       WAR.Person[emenyid][CC.TXWZ3]=WAR.Person[emenyid][CC.TXWZ3]..CC.WARS117
		       else
			       WAR.Person[emenyid][CC.TXWZ3]=CC.WARS118
			   end
		  end
		end
		
		if WAR.ASKD==1 and DWPD() then WAR.LQZ[eid]=0 end
	
		if pid==97 and math.random(10)<6 then
		   if WAR.Person[emenyid]["我方"]~=WAR.Person[WAR.CurID]["我方"] then
		      WAR.Person[emenyid]["我方"]=WAR.Person[WAR.CurID]["我方"]
		   end
		end
		
		if WAR.ZDDH==205 and eid==141 then
		    JY.Person[eid]["生命"]=0
	    end
				
		if pid==48 then --YTZ
		   local d=math.modf((340-JY.Person[eid]["抗毒能力"]-JY.Person[eid]["内力"]/50)/4)
		   if d<0 then d=0 end
		   JY.Person[eid]["中毒程度"]=JY.Person[eid]["中毒程度"]+d
		   if JY.Person[eid]["中毒程度"]>100 then JY.Person[eid]["中毒程度"]=100 end
		end
		
		
	
	    if JY.Person[eid]["生命"]<=0 and inteam(pid) and DWPD() and WAR.SZJPYX[eid]==nil then
		   local wxzd={17,67,226,220,224,219,79};
		   local wx=0;
		   for i=1,7 do
		        if WAR.ZDDH==wxzd[i] then
				   wx=1
				   break
				end
		    end
			if WAR.ZDDH==82 and GetS(10,0,18,0)==1 then wx=1 end
			if WAR.ZDDH==214 and GetS(10,0,19,0)==1 then wx=1 end
			
			if wx==0 then
			    for i=1,51 do
					if pid==TeamP[i] then
					    local szexp=1;
					    if eid<191 and eid>0 then
					      szexp=WARSZJY[eid]
						end						
										
					    SetS(5,i,6,5,GetS(5,i,6,5)+szexp)
						
						WAR.SZJPYX[eid]=1;
					    break
					end
				end
			end
		end
		
		if JY.Person[eid]["生命"]<=0 and pid==28 then
		   WAR.PYZ=WAR.PYZ+1
		   if WAR.PYZ>5 then WAR.PYZ=5 end
		end
		
		if (WAR.BMXH==1 or WAR.BMXH==2) and hurt>0 and DWPD() then
		   local xnl;
		   xnl=math.modf(JY.Person[eid]["内力"]/16+2)	
		   if xnl>300 then xnl=300 end
		   AddPersonAttrib(eid,"内力",-xnl);
		   AddPersonAttrib(pid,"内力",math.modf(xnl+1));
		   AddPersonAttrib(pid,"内力最大值",math.modf(xnl*2/3+10));
		end
		
		if WAR.YTFS>100 and T2SQ(eid) and GetS(10,0,7,0)==1 and WAR.YTFS>100 then
		    WAR.Person[emenyid][CC.TXDH]=6
			   if WAR.Person[emenyid][CC.TXWZ1]~=nil then
			        WAR.Person[emenyid][CC.TXWZ1]=WAR.Person[emenyid][CC.TXWZ1]..CC.WARS119
		       else
			       WAR.Person[emenyid][CC.TXWZ1]=CC.WARS120
			   end
			WAR.YTFS=-1
			WAR.YT1=JY.Person[0]["武功2"]
			WAR.YT2=JY.Person[0]["武功等级2"]
			JY.Person[0]["武功2"]=wugong
			JY.Person[0]["武功等级2"]=999
		end
		
		if WAR.BMXH==3 and hurt>0 and DWPD() then
		   local xnl;
		   xnl=math.modf(JY.Person[eid]["内力"]/20+2)		   
		   AddPersonAttrib(eid,"内力",-xnl);
		   AddPersonAttrib(eid,"中毒程度",20);
		end
		
		if WAR.BMXH==2 and hurt>0 and DWPD() then
		   local xt1=Rnd(3)+2
		   local xt2=Rnd(5)+6
		   local xt3=2+Rnd(2)
		      AddPersonAttrib(eid,"体力",-xt1) 
			  AddPersonAttrib(pid,"体力",xt3) 			  			
		    if pid==26 then 
		      AddPersonAttrib(eid,"体力",-xt2) 
			  AddPersonAttrib(pid,"体力",xt2) 
			end
		end
		
		if wugong==64 and pid==0 and GetS(4,5,5,5)==3 and hurt>0 and WAR.XXCC==0 then
		   for i=1,10 do
		        if JY.Person[0]["武功"..i]==64 then
				    if JY.Person[0]["武功等级"..i]==999 then
					   SetS(14,3,1,4,GetS(14,3,1,4)+math.random(2))
					   if GetS(14,3,1,4)>600 then SetS(14,3,1,4,600) end
					   if GetS(14,3,1,4)>JY.Person[0]['耍刀技巧']*10-900 then 
					      SetS(14,3,1,4,JY.Person[0]['耍刀技巧']*10-900)
					   end					   
					   WAR.XXCC=1
					   --QZXS(GetS(14,3,1,4))
					   break
					end
				end
			end
		end
		
		if WAR.TZ_XZ==1 and DWPD() then
		    WAR.TZ_XZ_SSH[eid]=1
		end
				       
		
    --敌人中毒点数
    local poisonnum=math.modf(level*JY.Wugong[wugong]["敌人中毒点数"]+5*JY.Person[pid]["攻击带毒"]);

    if 10*JY.Person[eid]["抗毒能力"]< poisonnum and dng==0 and pid~=48 then
		poisonnum=math.modf(poisonnum/10-JY.Person[eid]["抗毒能力"]-JY.Person[eid]["内力"]/150)
		if poisonnum<0 then poisonnum=0 end
		AddPersonAttrib(eid,"中毒程度",myrnd(poisonnum));
    end
    
	WAR.NGHT=0
	WAR.FLHS4=0
	
	if PersonKF(eid,108) then JY.Person[eid]["中毒程度"]=0 end
	--if PersonKF(eid,100) then JY.Person[eid]["受伤程度"]=0 end
	
	if WAR.Person[emenyid][CC.TXWZ2]==nil then WAR.Person[emenyid][CC.TXWZ2]='  ' end
	if DWPD()==false then
	    WAR.Person[emenyid][CC.TXDH]=-1
		WAR.Person[emenyid][CC.TXWZ1]=nil
		WAR.Person[emenyid][CC.TXWZ2]=nil
		WAR.Person[emenyid][CC.TXWZ3]=nil
	end
	
	--WAR.Person[emenyid][CC.TXDH]=math.fmod(107,10)+85
	--WAR.Person[emenyid][CC.TXWZ2]="九阳神功护体+太极奥义"
	--WAR.Person[emenyid][CC.TXWZ1]="乾坤大挪移反弹妙风使+流云使"
	return hurt;
end

function War_WugongHurtNeili(enemyid,wugong,level)           --计算武功伤害内力
--武功伤害内力
--enemyid 敌人战斗id，
--wugong  我方使用武功
--返回：伤害点数
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local eid=WAR.Person[enemyid]["人物编号"];

    local addvalue=JY.Wugong[wugong]["加内力" .. level];
    local decvalue=JY.Wugong[wugong]["杀内力" .. level];
	
	if WAR.Person[WAR.CurID]["我方"]~=WAR.Person[enemyid]["我方"] then
		if addvalue>0 then
			if math.modf(addvalue/2)>0 then
				AddPersonAttrib(pid,"内力最大值",Rnd(math.modf(addvalue/2)));
			end
			AddPersonAttrib(pid,"内力",math.abs(addvalue+Rnd(3)-Rnd(3)));
		end
		if JY.Wugong[wugong]["代号"]==88 then
		   JY.Person[eid]['体力']=JY.Person[eid]['体力']-3-math.random(3)
		   if JY.Person[eid]['体力']<0 then JY.Person[eid]['体力']=0 end
		end
						
		return -AddPersonAttrib(eid,"内力",-math.abs(decvalue+Rnd(3)-Rnd(3)));
    else
	    return -AddPersonAttrib(eid,"内力",0);
    end
end

function War_PoisonMenu()              ---用毒菜单
    WAR.ShowHead=0;
    local r=War_ExecuteMenu(1);
	WAR.ShowHead=1;
	Cls();
	return r;
end

function War_PoisonHurt(pid,emenyid)     --计算敌人中毒点数
    local vv=math.modf((JY.Person[pid]["用毒能力"]-JY.Person[emenyid]["抗毒能力"])/4);
	if JY.Status==GAME_WMAP then
		for i,v in pairs(CC.AddPoi) do
			if v[1]==pid then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["人物编号"]==v[2] and  WAR.Person[wid]["死亡"]==false then
						vv=vv+v[3]/4;
					end
				end
			end
		end
	end
	vv=vv-(JY.Person[emenyid]["内力"]/200)
	for i=1,10 do
	    if JY.Person[emenyid]["武功"..i]==108 then
		   vv=0
		   break
		end
    end
	vv=math.modf(vv)
    if vv<0 then
        vv=0;
    end
    return AddPersonAttrib(emenyid,"中毒程度",vv);
end

function War_DecPoisonMenu()          ---解毒菜单
    WAR.ShowHead=0;
    local r=War_ExecuteMenu(2);
	WAR.ShowHead=1;
	Cls();
	return r;
end

function War_DoctorMenu()            ---医疗菜单
    WAR.ShowHead=0;
    local r=War_ExecuteMenu(3);
	WAR.ShowHead=1;
	Cls();
	return r;
end

function War_ExecuteMenu(flag,thingid)            ---执行医疗，解毒用毒暗器
---执行医疗，解毒用毒
---flag=1 用毒， 2 解毒，3 医疗 4 暗器
---thingid 暗器物品id
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local step;

    if flag==1 then
        step=math.modf(JY.Person[pid]["用毒能力"]/40);         --用毒步数
    elseif flag==2 then
        step=math.modf(JY.Person[pid]["解毒能力"]/40);         --解毒步数
    elseif flag==3 then
        step=math.modf(JY.Person[pid]["医疗能力"]/40);         --医疗步数
    elseif flag==4 then
        step=math.modf(JY.Person[pid]["暗器技巧"]/15)+1;         --暗器步数
    end

    War_CalMoveStep(WAR.CurID,step,1);

    local x1,y1=War_SelectMove();              --选择攻击对象

    if x1 ==nil then
        lib.GetKey();
		Cls();
        return 0;
    else
        return War_ExecuteMenu_Sub(x1,y1,flag,thingid);
    end
end

function War_ExecuteMenu_Sub(x1,y1,flag,thingid)     ---执行医疗，解毒用毒暗器的子函数，自动医疗也可调用
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local x0=WAR.Person[WAR.CurID]["坐标X"];
    local y0=WAR.Person[WAR.CurID]["坐标Y"];

    CleanWarMap(4,0);

	WAR.Person[WAR.CurID]["人方向"]=War_Direct(x0,y0,x1,y1);

	SetWarMap(x1,y1,4,1);

    local emeny=GetWarMap(x1,y1,2);
	if emeny>=0 then          --有人
		 if flag==1 then
			 if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[emeny]["我方"] then       --是敌人
				 WAR.Person[emeny]["点数"]=War_PoisonHurt(pid,WAR.Person[emeny]["人物编号"])
				 SetWarMap(x1,y1,4,5);
  			     WAR.Effect=5;
			 end
		 elseif flag==2 then
			 if WAR.Person[WAR.CurID]["我方"] == WAR.Person[emeny]["我方"] then       --不是敌人
				 WAR.Person[emeny]["点数"]=ExecDecPoison(pid,WAR.Person[emeny]["人物编号"])
				 SetWarMap(x1,y1,4,6);
  			     WAR.Effect=6;
			 end
		 elseif flag==3 then
		     if WAR.Person[WAR.CurID]["人物编号"]==0 and GetS(4,5,5,5)==7 then
				 
			 else	 
				 if WAR.Person[WAR.CurID]["我方"] == WAR.Person[emeny]["我方"] then       --不是敌人
					 WAR.Person[emeny]["点数"]=ExecDoctor(pid,WAR.Person[emeny]["人物编号"])
					 SetWarMap(x1,y1,4,4);
					 WAR.Effect=4;
				 end
			 end
		 elseif flag==4 then
			 if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[emeny]["我方"] then       --是敌人
				 WAR.Person[emeny]["点数"]=War_AnqiHurt(pid,WAR.Person[emeny]["人物编号"],thingid)*2
				 SetWarMap(x1,y1,4,2);
  			     WAR.Effect=2;
			 end
		 end

	end
	
	if flag==3 and WAR.Person[WAR.CurID]["人物编号"]==0 and GetS(4,5,5,5)==7 then				 
		for ex=x1-3,x1+3 do
			for ey=y1-3,y1+3 do
			    SetWarMap(ex,ey,4,1)
				--WAR.Effect=4;				
				if GetWarMap(ex,ey,2)~=nil and GetWarMap(ex,ey,2)>-1 then
				    local ep=GetWarMap(ex,ey,2)
					if WAR.Person[WAR.CurID]["我方"] == WAR.Person[ep]["我方"] then					
					   WAR.Person[ep]["点数"]=ExecDoctor(pid,WAR.Person[ep]["人物编号"])
					   SetWarMap(ex,ey,4,4)
				       WAR.Effect=4;			
					end
				end
			end
		end
	end
	
    WAR.EffectXY={};
	WAR.EffectXY[1]={x1,y1};
	WAR.EffectXY[2]={x1,y1};

	if flag==1 then
		War_ShowFight(pid,0,0,0,x1,y1,30);
	elseif flag==2 then
		War_ShowFight(pid,0,0,0,x1,y1,36);
	elseif flag==3 then
		War_ShowFight(pid,0,0,0,x1,y1,0);
	elseif flag==4 then
		if emeny>=0 then
			War_ShowFight(pid,0,-1,0,x1,y1,JY.Thing[thingid]["暗器动画编号"]);
		end
	end

	for i=0,WAR.PersonNum-1 do
		WAR.Person[i]["点数"]=0;
	end
	if flag==4 then
		if emeny>=0 then
			instruct_32(thingid,-1);            --物品数量减少
			return 1;
		else
			return 0;                   --暗器打空，则等于没有打
		end
	else
		WAR.Person[WAR.CurID]["经验"]=WAR.Person[WAR.CurID]["经验"]+1;
		AddPersonAttrib(pid,"体力",-2);
		if inteam(pid) then AddPersonAttrib(pid,"体力",-4) end
	end

	return 1;

end

function War_ThingMenu()            --战斗物品菜单
    WAR.ShowHead=0;
    local thing={};
    local thingnum={};

    for i = 0,CC.MyThingNum-1 do
        thing[i]=-1;
        thingnum[i]=0;
    end

    local num=0;
    for i = 0,CC.MyThingNum-1 do
        local id = JY.Base["物品" .. i+1];
        if id>=0 then
            if JY.Thing[id]["类型"]==3 or JY.Thing[id]["类型"]==4 then
                thing[num]=id;
                thingnum[num]=JY.Base["物品数量" ..i+1];
                num=num+1;
            end
        end
    end

    local r=SelectThing(thing,thingnum);
	Cls();
	local rr=0;
    if r>=0 then
        if UseThing(r)==1 then
		    rr=1;
		end
    end
	WAR.ShowHead=1;
	Cls();
    return rr;
end

function War_UseAnqi(id)          ---战斗使用暗器
    return War_ExecuteMenu(4,id);
end

function War_AnqiHurt(pid,emenyid,thingid)         --计算暗器伤害
    local num;
    if JY.Person[emenyid]["受伤程度"]==0 then
        num=JY.Thing[thingid]["加生命"]/4-Rnd(5);
    elseif JY.Person[emenyid]["受伤程度"]<=33 then
        num=JY.Thing[thingid]["加生命"]/3-Rnd(5);
    elseif JY.Person[emenyid]["受伤程度"]<=66 then
        num=JY.Thing[thingid]["加生命"]/2-Rnd(5);
    else
        num=JY.Thing[thingid]["加生命"]/2-Rnd(5);
    end

    num=math.modf((num-JY.Person[pid]["暗器技巧"]*2)/3);
    AddPersonAttrib(emenyid,"受伤程度",math.modf(-num/6));      --此处的num为负值

    local r=AddPersonAttrib(emenyid,"生命",math.modf(num/2));
	if (emenyid==129 or emenyid==65) and JY.Person[emenyid]["生命"]<=0 then
	   JY.Person[emenyid]["生命"]=1
	end
	if emenyid==553 and JY.Person[emenyid]["生命"]<=0 then WAR.YZB=1 end
	if JY.Person[emenyid]["生命"]<=0 then
	   WAR.Person[WAR.CurID]["经验"]=WAR.Person[WAR.CurID]["经验"]+JY.Person[emenyid]["等级"]*5;
	end	
    if JY.Thing[thingid]["加中毒解毒"]>0 then
        num=math.modf((JY.Thing[thingid]["加中毒解毒"]+JY.Person[pid]["暗器技巧"])/4);
        num=num-JY.Person[emenyid]["抗毒能力"];
        num=limitX(num,0,CC.PersonAttribMax["用毒能力"]);
        AddPersonAttrib(emenyid,"中毒程度",num);
    end
    return r;
end

function War_RestMenu()           --休息
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	if WAR.tmp[1000+pid]==1 then return 1 end
	--[[
	local vv=math.modf(WAR.Person[WAR.CurID]["轻功"]/20-JY.Person[pid]["受伤程度"]/40+JY.Person[pid]["体力"]/30-3)+3;
	vv=(WAR.Person[WAR.CurID]["移动步数"]+1)/vv
	vv=vv/15--]]
	local vv=math.modf(JY.Person[pid]["体力"]/100-JY.Person[pid]["受伤程度"]/50-JY.Person[pid]["中毒程度"]/50)+2;
	if WAR.Person[WAR.CurID]["移动步数"]>0 then
		vv=vv+2
	end
	if inteam(pid) then
	   vv=vv+math.random(3)
	else
	   vv=vv+6
	end
	vv=vv/120
    local v=3+Rnd(3);
    AddPersonAttrib(pid,"体力",v);
    if JY.Person[pid]["体力"]>0 then
        v=3+math.modf(JY.Person[pid]["生命最大值"]*vv);
        AddPersonAttrib(pid,"生命",v);
        v=3+math.modf(JY.Person[pid]["内力最大值"]*vv);
        AddPersonAttrib(pid,"内力",v);
    end
	if JY.Thing[202][WZ7]>1 and (not inteam(pid)) then
	   if JY.Person[pid]["生命"]>math.modf(JY.Person[pid]["生命最大值"]/2) then
	      return War_ActupMenu() ;
	   else
	      return War_DefupMenu() ;
	   end
	else
       return 1;
	end
end

function War_TgrtsMenu()
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	Cls();
	WAR.ShowHead=0;
	WarDrawMap(0);
	local yn=JYMsgBox(CC.EVB172..GRTS[pid],GRTSSAY[pid],CC.EVB173,2,pid);
    if yn==2 then return 0 end
	
    if pid==53 then 
	    if JY.Person[pid]["体力"]>20 then
		   WAR.TZ_DY=1 
		   PlayWavE(16) 
		   CurIDTXDH(WAR.CurID,1080,1085,CC.EVB174)	   
		   CurIDTXDH(WAR.CurID,1086,1093,CC.EVB175)	   	
           JY.Person[pid]["体力"]=JY.Person[pid]["体力"]-10
		else
		   DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		   return 0;
	    end
	end
	if pid==49 then
	    if JY.Person[pid]["体力"]>20 and JY.Person[pid]["内力"]>1000 then
	        
			JY.Person[pid]["体力"]=JY.Person[pid]["体力"]-5
			JY.Person[pid]["内力"]=JY.Person[pid]["内力"]-500
			local ssh={};
			local num=1;
			
			for i=0,WAR.PersonNum-1 do
			    local wid=WAR.Person[i]["人物编号"]
		        if WAR.TZ_XZ_SSH[wid]==1 and WAR.Person[i]["死亡"]==false then
				    if WAR.FXDS[wid]==nil then
					    WAR.FXDS[wid]=25
				    else
					    WAR.FXDS[wid]=WAR.FXDS[wid]+25
						if WAR.FXDS[wid]>50 then WAR.FXDS[wid]=50 end
					end
					WAR.TZ_XZ_SSH[wid]=nil;
					if WAR.Person[i]["Time"]>995 then WAR.Person[i]["Time"]=995 end
				    ssh[num]={};
					ssh[num][1]=i;
					ssh[num][2]=wid;
					num=num+1;
				end
			end
			local name={};
			for i=1,num-1 do
			     name[i]={};
			     name[i][1]=JY.Person[ssh[i][2]]["姓名"]
				 name[i][2]=nil
				 name[i][3]=1
			end
			DrawStrBox(CC.MainMenuX,CC.MainMenuY,CC.EVB177,C_GOLD,30)  		    			
			--Cls();
			ShowMenu(name,num-1,10,CC.MainMenuX,CC.MainMenuY+45,0,0,1,0,CC.DefaultFont,C_RED,C_GOLD);
		    Cls();
			PlayWavAtk(32) 
			CurIDTXDH(WAR.CurID,1325,1344,CC.EVB178)	   			
			PlayWavE(8)
			local sssid=lib.SaveSur(0,0,CC.ScreenW,CC.ScreenH);
			for DH=114,129 do
				for i=1,num-1 do
					local x0=WAR.Person[WAR.CurID]["坐标X"];
					local y0=WAR.Person[WAR.CurID]["坐标Y"];
					local dx=WAR.Person[ssh[i][1]]["坐标X"]-x0--WAR.Person[WAR.CurID]["坐标X"]
					local dy=WAR.Person[ssh[i][1]]["坐标Y"]-y0--WAR.Person[WAR.CurID]["坐标Y"]
					local rx=CC.XScale*(dx-dy)+CC.ScreenW/2;
					local ry=CC.YScale*(dx+dy)+CC.ScreenH/2;
					local hb=GetS(JY.SubScene,dx+x0,dy+y0,4)				
					if CONFIG.Zoom==1 then
						hb=hb*2;
					end
					ry=ry-hb
					lib.PicLoadCache(3,DH*2,rx,ry,2,192)	
                    if DH>124 then DrawString(rx-10,ry-15,CC.EVB179,C_GOLD,30) end					
				end
				lib.ShowSurface(0)
				lib.LoadSur(sssid,0,0)
				lib.Delay(30)
			end
			lib.FreeSur(sssid);
		else
			DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		    return 0;	
        end
    end	
    if pid==89 then
	    if JY.Person[pid]["体力"]>25 and JY.Person[pid]["内力"]>300 then
		       local px,py=WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"];
			   local mxy={
					   {WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"]+1},
					   {WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"]-1},
					   {WAR.Person[WAR.CurID]["坐标X"]+1,WAR.Person[WAR.CurID]["坐标Y"]},
					   {WAR.Person[WAR.CurID]["坐标X"]-1,WAR.Person[WAR.CurID]["坐标Y"]},			   
						  };
				local zdp={};
				local num=1;
				for i=1,4 do
					if GetWarMap(mxy[i][1],mxy[i][2],2)>=0 then
						local mid=GetWarMap(mxy[i][1],mxy[i][2],2);
						if inteam(WAR.Person[mid]["人物编号"]) then
						   zdp[num]=WAR.Person[mid]["人物编号"]
						   num=num+1
						end
					end
				end
				local zdp2={};
				for i=1,num-1 do
				     zdp2[i]={};
				     zdp2[i][1]=JY.Person[zdp[i]]["姓名"].."·"..JY.Person[zdp[i]]["体力"]
					 zdp2[i][2]=nil
					 zdp2[i][3]=1
				end				     
				DrawStrBox(CC.MainMenuX,CC.MainMenuY,CC.EVB180,C_GOLD,30)  		    			
				--Cls();
				local r=ShowMenu(zdp2,num-1,10,CC.MainMenuX,CC.MainMenuY+45,0,0,1,0,CC.DefaultFont,C_RED,C_GOLD);
				Cls();
				AddPersonAttrib(zdp[r],"体力",50);
				AddPersonAttrib(89,"体力",-25);
				AddPersonAttrib(89,"内力",-300);
				PlayWavE(28) 
				lib.Delay(10)
				CurIDTXDH(WAR.CurID,1345,1364,CC.EVB181)
				local Ocur=WAR.CurID;
				for i=0,WAR.PersonNum-1 do
				    if WAR.Person[i]["人物编号"]==zdp[r] then
					    WAR.CurID=i;
						break;
					end
				end
				WarDrawMap(0);
				PlayWavE(36)
                lib.Delay(100)				
				CurIDTXDH(WAR.CurID,1382,1398,CC.EVB182)
				--CurIDTXDH(WAR.CurID,1397,1382,"恢复体力50点")
				WAR.CurID=Ocur;
				WarDrawMap(0);
                --QZXS(JY.Person[zdp[r]]["姓名"].."恢复体力50点")				
		else
		   DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		   return 0;
		end
	end
	if pid==9 then
	    if JY.Person[pid]["体力"]>10 and JY.Person[pid]["内力"]>500 then
		    local nyp={};
			local num=1;	
			for i=0,WAR.PersonNum-1 do
	            if WAR.Person[i]["我方"]==true and WAR.Person[i]["死亡"]==false then
			        if RealJL(WAR.CurID,i,8) and i~=WAR.CurID then
					   nyp[num]={};		   
					   nyp[num][1]=JY.Person[WAR.Person[i]["人物编号"]]["姓名"]
					   nyp[num][2]=nil
					   nyp[num][3]=1
	                   nyp[num][4]=i
					   num=num+1
					end
				end
			end
	        DrawStrBox(CC.MainMenuX,CC.MainMenuY,CC.EVB183,C_GOLD,30)  		    			
				--Cls();
			local r=ShowMenu(nyp,num-1,10,CC.MainMenuX,CC.MainMenuY+45,0,0,1,0,CC.DefaultFont,C_RED,C_GOLD);
			Cls();
			local mid=WAR.Person[nyp[r][4]]["人物编号"]
			QZXS(CC.EVB184..JY.Person[mid]["姓名"]..CC.EVB185)
			War_CalMoveStep(WAR.CurID,8,1);
			local nx,ny;
			while true do
				nx,ny=War_SelectMove()
					if nx~=nil then
					    if lib.GetWarMap(nx,ny,2)>0 or lib.GetWarMap(nx,ny,5)>0 then
						   QZXS(CC.EVB186);
						elseif CC.SceneWater[lib.GetWarMap(nx,ny,0)]~=nil then
						   QZXS(CC.EVB187);
						else
						   break;
						end
					end
			end
			PlayWavE(5);
			CurIDTXDH(WAR.CurID,1382,1398,CC.EVB188)
			local Ocur=WAR.CurID;
			WAR.CurID=nyp[r][4];
			WarDrawMap(0);
			CurIDTXDH(WAR.CurID,1382,1390)
			lib.SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,-1)
			lib.SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,-1)			
			WarDrawMap(0);			
		    CurIDTXDH(WAR.CurID,1390,1398)
			WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"]=nx,ny;
			WarDrawMap(0);
			CurIDTXDH(WAR.CurID,1382,1390)			
			lib.SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],5,WAR.Person[WAR.CurID]["贴图"])
			lib.SetWarMap(WAR.Person[WAR.CurID]["坐标X"],WAR.Person[WAR.CurID]["坐标Y"],2,WAR.CurID)			
			WarDrawMap(0);	
			CurIDTXDH(WAR.CurID,1390,1398)
			WAR.CurID=Ocur;	
			AddPersonAttrib(9,"体力",-10);
		    AddPersonAttrib(9,"内力",-500);				
		else
		     DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		     return 0;
		end
	end 

	if pid==88 then
	    if JY.Person[pid]["体力"]>10 and JY.Person[pid]["内力"]>700 then
		    local dxp={};
			local num=1;	
			for i=0,WAR.PersonNum-1 do
	            if WAR.Person[i]["我方"]==true and WAR.Person[i]["死亡"]==false then
			        if RealJL(WAR.CurID,i,5) and i~=WAR.CurID then
					   dxp[num]={};		   
					   dxp[num][1]=JY.Person[WAR.Person[i]["人物编号"]]["姓名"]
					   dxp[num][2]=nil
					   dxp[num][3]=1
	                   dxp[num][4]=i
					   num=num+1
					end
				end
			end
	        DrawStrBox(CC.MainMenuX,CC.MainMenuY,CC.EVB189,C_GOLD,30)  		    			
				--Cls();
			local r=ShowMenu(dxp,num-1,10,CC.MainMenuX,CC.MainMenuY+45,0,0,1,0,CC.DefaultFont,C_RED,C_GOLD);
			Cls();
			local mid=WAR.Person[dxp[r][4]]["人物编号"]
			PlayWavE(28) 
			lib.Delay(10)
			CurIDTXDH(WAR.CurID,1305,1314,CC.EVB190)
			CurIDTXDH(WAR.CurID,1315,1324,CC.EVB195)
			local Ocur=WAR.CurID;
			WAR.CurID=dxp[r][4];
			WarDrawMap(0);
			PlayWavE(36)
            lib.Delay(100)				
		    CurIDTXDH(WAR.CurID,1365,1381,CC.EVB191)
			WAR.CurID=Ocur;
			WarDrawMap(0);
			WAR.Person[dxp[r][4]]["Time"]=WAR.Person[dxp[r][4]]["Time"]+500
			if WAR.Person[dxp[r][4]]["Time"]>999 then WAR.Person[dxp[r][4]]["Time"]=999 end
	        AddPersonAttrib(88,"体力",-10);
		    AddPersonAttrib(88,"内力",-1000);	
        else
             DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		     return 0;
		end
	end 			   
	   
	return 1;
end	

function War_DefupMenu()            --防御
	
	local p=WAR.CurID
	local id=WAR.Person[p]["人物编号"];
	local x0,y0=WAR.Person[p]["坐标X"],WAR.Person[p]["坐标Y"];
	--[[local v=math.modf(WAR.Person[p]["轻功"]/20-JY.Person[id]["受伤程度"]/40+JY.Person[id]["体力"]/30-3)+3;
	local y=WAR.Person[p]["移动步数"];
	WAR.Person[WAR.CurID]["Time"]=1000+math.modf(500*y/v)
	return 1]]
	WAR.Defup[id]=1
	Cls();
	        local hb=GetS(JY.SubScene,x0,y0,4)
			if CONFIG.Zoom==1 then
				hb=hb*2;
			end	
			local ssid=lib.SaveSur(CC.ScreenW/2-80,CC.ScreenH/2-hb-150,CC.ScreenW/2+80,CC.ScreenH/2-hb+30);
			for ii=1283,1293 do
					--Cls();
					lib.PicLoadCache(3,ii*2,CC.ScreenW/2,CC.ScreenH/2-hb,2,192)					
					ShowScreen();
					lib.Delay(30);
					lib.LoadSur(ssid,CC.ScreenW/2-80,CC.ScreenH/2-hb-150);
			end
			lib.FreeSur(ssid);
	DrawStrBox(-1,-1,CC.WARS121,C_GOLD,30)
	ShowScreen();
	lib.Delay(500);	
	--for i=0,WAR.PersonNum-1 do
	    --if WAR.Person[i]["我方"]==false then
		    -- JY.Person[WAR.Person[i]["人物编号"]]["生命"]=0
		--end
	--end
	return 1
	--[[
    for i =WAR.CurID, WAR.PersonNum-2 do
        local tmp=WAR.Person[i+1];
        WAR.Person[i+1]=WAR.Person[i];
        WAR.Person[i]=tmp;
        --调换人物
    end

    WarSetPerson();     --设置战斗人物位置

    for i=0,WAR.PersonNum-1 do
        WAR.Person[i]["贴图"]=WarCalPersonPic(i);
    end

    return 1;
]]--
end

function War_ActupMenu()            --蓄力
	local p=WAR.CurID
	local id=WAR.Person[p]["人物编号"];
	local x0,y0=WAR.Person[p]["坐标X"],WAR.Person[p]["坐标Y"];
	if PersonKF(id,103) then
	   WAR.Actup[id]=2
	else
	   if JLSD(15,85,id) then WAR.Actup[id]=2 end
	end
	
    if WAR.Actup[id]~=2 then
	    Cls()
		DrawStrBox(-1,-1,CC.WARS122,C_GOLD,30)
		ShowScreen();
		lib.Delay(500);
	else
	        local hb=GetS(JY.SubScene,x0,y0,4)
			if CONFIG.Zoom==1 then
				hb=hb*2;
			end	
			local ssid=lib.SaveSur(CC.ScreenW/2-80,CC.ScreenH/2-hb-150,CC.ScreenW/2+80,CC.ScreenH/2-hb+30);
			for ii=1272,1282 do
					--Cls();
					lib.PicLoadCache(3,ii*2,CC.ScreenW/2,CC.ScreenH/2-hb,2,192)					
					ShowScreen();
					lib.Delay(30);
					lib.LoadSur(ssid,CC.ScreenW/2-80,CC.ScreenH/2-hb-150);
			end
			lib.FreeSur(ssid);
				
	    Cls()
		DrawStrBox(-1,-1,CC.WARS123,C_GOLD,30)
		ShowScreen();
		lib.Delay(500);
	end
	
	return 1
end

function War_StatusMenu()          --战斗中显示状态
    WAR.ShowHead=0;
	Menu_Status();
	WAR.ShowHead=1;
	Cls();
end

function War_AutoMenu()           --设置自动战斗
    WAR.AutoFight=1;
	WAR.ShowHead=0;
	Cls();
    War_Auto();
    return 1;
end


function War_Auto()             --自动战斗主函数
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	WAR.ShowHead=1;
	WarDrawMap(0);
	ShowScreen();
	lib.Delay(CC.WarAutoDelay);
	WAR.ShowHead=0;

    if CC.AutoWarShowHead==1 then
	    WAR.ShowHead=1;
	end

    local autotype=War_Think();         --思考如何战斗
	if WAR.Person[WAR.CurID]["我方"] or WAR.ZDDH==238 then
	    if JY.Person[pid]["内力"]>50 and JY.Person[pid]["体力"]>10 then
	       autotype=1
		else 
		   autotype=0
		end
	end
	
	if autotype==1 then
	    if inteam(pid) and JLSD(30,60,pid) then
	       autotype=7
		end
	end
	
    if autotype==0 then  --休息
        War_AutoEscape();  --先跑开
        War_RestMenu();
    elseif autotype==1 then
        War_AutoFight();      --自动战斗
    elseif autotype==2 then    --吃药加生命
        War_AutoEscape();
        War_AutoEatDrug(2);
    elseif autotype==3 then    --吃药加内力
        War_AutoEscape();
         War_AutoEatDrug(3);
    elseif autotype==4 then    --吃药加体力
        War_AutoEscape();
        War_AutoEatDrug(4);
    elseif autotype==5 then    --自己医疗
        War_AutoEscape();
        War_AutoDoctor();
    elseif autotype==6 then    --吃药解毒
        War_AutoEscape();
        War_AutoEatDrug(6);
    elseif autotype==7 then    --我方AI
	    CurIDTXDH(WAR.CurID,1325,1344,CC.EVB171)	
		War_RestMenu();
    end

    return 0;
end

--思考如何战斗
--返回：0 休息， 1 战斗，2 使用物品增加生命， 3 使用物品增加内力 4 吃药加体力， 5 医疗
--     6 使用物品解毒

function War_Think()           --思考如何战斗
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local r=-1;         --考虑的结果

    if JY.Person[pid]["体力"] <10 then         --休息
        r=War_ThinkDrug(4);
        if r>=0 then
            return r;
        end
        return 0;
    end

    if JY.Person[pid]["生命"]<20 or JY.Person[pid]["受伤程度"]>50 then
        r=War_ThinkDrug(2);       --考虑增加生命
        if r>=0 then
            return r;
        end
    end

    local rate=-1;         --增加生命的百分比
    if JY.Person[pid]["生命"] <JY.Person[pid]["生命最大值"] /5 then
        rate=90;
    elseif JY.Person[pid]["生命"] <JY.Person[pid]["生命最大值"] /4 then
        rate=70;
    elseif JY.Person[pid]["生命"] <JY.Person[pid]["生命最大值"] /3 then
        rate=50;
    elseif JY.Person[pid]["生命"] <JY.Person[pid]["生命最大值"] /2 then
        rate=25;
    end

    if Rnd(100)<rate then
        r=War_ThinkDrug(2);       --考虑增加生命
        if r>=0 then
            return r;
        else             --没有增加生命的药，考虑是否自己医疗
		    r=War_ThinkDoctor();
		    if r>=0 then
		       return r;
		    end
        end
    end

    rate=-1;         --增加内力的百分比
    if JY.Person[pid]["内力"] <JY.Person[pid]["内力最大值"] /5 then
        rate=75;
    elseif JY.Person[pid]["内力"] <JY.Person[pid]["内力最大值"] /4 then
        rate=50;
    end

    if Rnd(100)<rate then
        r=War_ThinkDrug(3);       --考虑增加内力
        if r>=0 then
            return r;
        end
    end


    rate=-1;         --解毒的百分比
    if JY.Person[pid]["中毒程度"] > CC.PersonAttribMax["中毒程度"] *3/4 then
        rate=60;
    elseif JY.Person[pid]["中毒程度"] >CC.PersonAttribMax["中毒程度"] /2 then
        rate=30;
    end

    if Rnd(100)<rate then
        r=War_ThinkDrug(6);       --考虑解毒
        if r>=0 then
            return r;
        end
    end

    local minNeili=War_GetMinNeiLi(pid);     --所有武功的最小内力

    if JY.Person[pid]["内力"]>=minNeili then
        r=1;
    else
        r=0;
    end

    return r;
end

--能否吃药增加参数
--flag=2 生命，3内力；4体力  6 解毒
function War_ThinkDrug(flag)             --能否吃药增加参数
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local str;
    local r=-1;

    if flag==2 then
        str="加生命";
    elseif flag==3 then
        str="加内力";
    elseif flag==4 then
        str="加体力";
    elseif flag==6 then
        str="加中毒解毒";
    else
        return r;
    end

    local function Get_Add(thingid)    --定义局部函数。取得物品thingid增加的值
		if flag==6 then
			return -JY.Thing[thingid][str];   --解毒为负值
		else
			return JY.Thing[thingid][str];
		end
    end

    if inteam(pid) and WAR.Person[WAR.CurID]["我方"]==true then
        for i =1, CC.MyThingNum do
            local thingid=JY.Base["物品" ..i];
            if thingid>=0 then
                if JY.Thing[thingid]["类型"]==3 and Get_Add(thingid)>0 then
                    r=flag;                     ---有增加生命的药，则动作：使用物品加生命
                    break;
                end
            end
        end
    else
        for i =1, 4 do
            local thingid=JY.Person[pid]["携带物品" ..i];
            if thingid>=0 then--and thingid<236 then
                if JY.Thing[thingid]["类型"]==3 and Get_Add(thingid)>0  then
                    r=flag;                     ---有增加生命的药，则动作：使用物品加生命
                    break;
                end
            end
        end
    end

    return r;

end


--考虑是否自己医疗
function War_ThinkDoctor()          --考虑是否给自己医疗
    local pid=WAR.Person[WAR.CurID]["人物编号"];

	if JY.Person[pid]["体力"]<50 or JY.Person[pid]["医疗能力"]<20 then
	    return -1;
	end

	if JY.Person[pid]["受伤程度"]>JY.Person[pid]["医疗能力"]+20 then
	    return -1;
	end

	local rate = -1;
	local v=JY.Person[pid]["生命最大值"]-JY.Person[pid]["生命"];
	if JY.Person[pid]["医疗能力"] < v/4 then
        rate=30;
	elseif JY.Person[pid]["医疗能力"] < v/3 then
	    rate=50;
	elseif JY.Person[pid]["医疗能力"] < v/2 then
	    rate=70;
	else
	    rate=90;
	end

	if Rnd(100) <rate then
	    return 5;
	end

	return -1;
end

---自动战斗
function War_AutoFight()             ---执行自动战斗

	local wugongnum=War_AutoSelectWugong();    --选择武功

	if wugongnum <=0 then --没有选择到武功，休息
        War_AutoEscape();
        War_RestMenu();
		return
	end
	--[[if inteam(WAR.Person[WAR.CurID]["人物编号"]) and GetS(0,0,0,0)==1 then--WAR.Person[WAR.CurID]["我方"]
		local r=War_AutoMove(wugongnum);         -- 往敌人方向移动
		if r==1 then   --如果在攻击范围
			War_AutoExecuteFight(wugongnum);     --攻击
		else
			War_RestMenu();           --休息
		end
	else]]
		unnamed(wugongnum)
	--end
end


function War_AutoSelectWugong()           --自动选择合适的武功
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	
    local probability={};       --每种武功选择的概率

    local wugongnum=10;         --缺省10种武功
	for i =1, 10 do             --计算每种可选择武功的总攻击力
        local wugongid=JY.Person[pid]["武功" .. i];
        if wugongid>0 then
		       --选择杀生命的武功，必须消耗内力比现有内力小，起码可以发出一级的武功。
            if JY.Wugong[wugongid]["伤害类型"]==0 then
				if JY.Wugong[wugongid]["消耗内力点数"]<=JY.Person[pid]["内力"] then
					local level=math.modf(JY.Person[pid]["武功等级" .. i]/100)+1;
					--总攻击力即为概率
					probability[i]=(JY.Person[pid]["攻击力"]*3+JY.Wugong[wugongid]["攻击力" .. level ])/2;
				else
					probability[i]=0;
				end
				if inteam(pid) and WAR.Person[WAR.CurID]["我方"] then
					if wugongid>88 and wugongid<109  then
						 if pid==0 and GetS(4,5,5,5)==5 then
						
						else
						   probability[i]=0;
						end
					end
					if wugongid>84 and wugongid<89 then
					    probability[i]=0;
					end
				end
				if wugongid==43 and inteam(pid) then
				    if pid==51 or (pid==0 and GetS(4,5,5,5)==5) then
				    
					else
					   probability[i]=0;
					end
				end
				if wugongid==99 and pid==5 then probability[i]=0 end
				if pid==92 then
					if wugongid>84 and wugongid<109 then
						probability[i]=0;
					end
				end
				
			else            --杀内力的武功
                probability[i]=10;  --很小的概率选择杀内力
			end
		else
		    wugongnum=i-1;
			break;
        end
    end
	
    local maxoffense=0;       --计算最大攻击力
	for i =1, wugongnum do
        if  probability[i]>maxoffense then
            maxoffense=probability[i];
        end
    end

    local mynum=0;             --计算我方和敌人个数
	local enemynum=0;
	for i=0, WAR.PersonNum-1 do
	    if WAR.Person[i]["死亡"]==false then
		    if WAR.Person[i]["我方"]==WAR.Person[WAR.CurID]["我方"] then
			    mynum=mynum+1;
			else
			    enemynum=enemynum+1;
			end
		end
	end

    local factor=0;       --敌人人数影响因子，敌人多则对线面等攻击多人武功的选择概率增加
	if enemynum>mynum then
	    factor=2;
	else
	    factor=1;
	end

	for i =1, wugongnum do       --考虑其他概率效果
        local wugongid=JY.Person[pid]["武功" .. i];
        if probability[i]>0 then
		    if probability[i]<maxoffense-300 then       --去掉攻击力小的武功
			    probability[i]=0
			end
			local extranum=0;           --武功武器配合的攻击力
			for j,v in ipairs(CC.ExtraOffense) do
				if v[1]==JY.Person[pid]["武器"] and v[2]==wugongid then
					extranum=v[3];
					break;
				end
			end
    		local level=math.modf(JY.Person[pid]["武功等级" .. i]/100)+1;
			probability[i]=probability[i]+JY.Wugong[wugongid]["攻击范围"]*factor*JY.Wugong[wugongid]["杀伤范围" ..level]*20;
        end
    end

	local s={};           --按照概率依次累加
	local maxnum=0;
    for i=1,wugongnum do
        s[i]=maxnum;
		maxnum=maxnum+probability[i];
	end
	s[wugongnum+1]=maxnum;

	if maxnum==0 then    --没有可以选择的武功
	    return -1;
	end

    local v=Rnd(maxnum);            --产生随机数
	local selectid=0;
    for i=1,wugongnum do            --根据产生的随机数，寻找落在哪个武功区间
	    if v>=s[i] and v< s[i+1] then
		    selectid=i;
			break;
		end
	end
    
    return selectid;
end


function War_AutoSelectEnemy()             --选择战斗对手
    local enemyid=War_AutoSelectEnemy_near()
    WAR.Person[WAR.CurID]["自动选择对手"]=enemyid;
    return enemyid;
end


function War_AutoSelectEnemy_near()              --选择最近对手

    War_CalMoveStep(WAR.CurID,100,1);           --标记每个位置的步数

    local maxDest=math.huge;
    local nearid=-1;
    for i=0,WAR.PersonNum-1 do           --查找最近步数的敌人
        if WAR.Person[WAR.CurID]["我方"] ~=WAR.Person[i]["我方"] then
            if WAR.Person[i]["死亡"]==false then
			   local step=GetWarMap(WAR.Person[i]["坐标X"],WAR.Person[i]["坐标Y"],3);
                if step<maxDest then
                    nearid=i;
                    maxDest=step;
                end
            end
        end
    end
    return nearid;
end

--自动往敌人方向移动
--人物武功编号，不是武功id
--返回 1=可以攻击敌人， 0 不能攻击
function War_AutoMove(wugongnum)              --自动往敌人方向移动
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local wugongid=JY.Person[pid]["武功"  ..wugongnum];
    local level=math.modf(JY.Person[pid]["武功等级".. wugongnum]/100)+1;

    local wugongtype=JY.Wugong[wugongid]["攻击范围"];
	local movescope=JY.Wugong[wugongid]["移动范围" ..level];
	local fightscope=JY.Wugong[wugongid]["杀伤范围" ..level];
    local scope=movescope+fightscope;


    local x,y;
	local move=128;
    local maxenemy=0;

	local movestep=War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["移动步数"],0);   --计算移动步数

	War_AutoCalMaxEnemyMap(wugongid,level);  --计算该武功各个坐标可以攻击到敌人的个数

	for i=0,WAR.Person[WAR.CurID]["移动步数"] do
	    local step_num=movestep[i].num ;
		if step_num==nil or step_num==0 then
		    break;
		end
		for j=1,step_num do
		    local xx=movestep[i].x[j];
			local yy=movestep[i].y[j]

			local num=0;
			if wugongtype==0 or wugongtype==2 or wugongtype==3 then
				num=GetWarMap(xx,yy,4)      --计算这个位置可以攻击到的最多敌人个数
			elseif wugongtype==1  then
				local v=GetWarMap(xx,yy,4)      --计算这个位置可以攻击到的最多敌人个数
				if v>0 then
					num=War_AutoCalMaxEnemy(xx,yy,wugongid,level);
				end
			end
			if num>maxenemy then
				maxenemy=num
				x=xx;
				y=yy;
				move=i;
			elseif num==maxenemy and num>0 then
			    if Rnd(3)==0 then
					maxenemy=num
					x=xx;
					y=yy;
					move=i;
				end
			end
		end
	end

    if maxenemy>0 then
	    War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["移动步数"],0);   --重新计算移动步数
        War_MovePerson(x,y);    --移动到相应的位置
		return 1;
	else   --任何移动都直接攻击不到敌人，寻找一条可以移动到攻击到敌人位置的路线
		x,y=War_GetCanFightEnemyXY(scope);       --计算可以攻击到敌人的最近位置

		local minDest=math.huge;
        if x==nil then   --无法走到可以攻击敌人的地方，可能敌人被围住，或者被敌人围住。
             local enemyid=War_AutoSelectEnemy()   --选择最近敌人

			 War_CalMoveStep(WAR.CurID,100,0);   --计算移动步数 假设最大100步

			 for i=0,CC.WarWidth-1 do
                for j=0,CC.WarHeight-1 do
					local dest=GetWarMap(i,j,3);
                    if dest <128 then
                        local dx=math.abs(i-WAR.Person[enemyid]["坐标X"])
                        local dy=math.abs(j-WAR.Person[enemyid]["坐标Y"])
                        if minDest>(dx+dy) then        --此时x,y是距离敌人的最短路径，虽然可能被围住
                            minDest=dx+dy;
                            x=i;
                            y=j;
                        elseif minDest==(dx+dy) then
                            if Rnd(2)==0 then
                                x=i;
                                y=j;
                            end
                        end
                    end
                end
            end
		else
            minDest=0;        --可以走到
		end

		if minDest<math.huge then   --有路可走
		    while true do    --从目的位置反着找到可以移动的位置，作为移动的次序
				local i=GetWarMap(x,y,3);
                if i<=WAR.Person[WAR.CurID]["移动步数"] then
                    break;
                end

                if GetWarMap(x-1,y,3)==i-1 then
                    x=x-1;
                elseif GetWarMap(x+1,y,3)==i-1 then
                    x=x+1;
                elseif GetWarMap(x,y-1,3)==i-1 then
                    y=y-1;
                elseif GetWarMap(x,y+1,3)==i-1 then
                    y=y+1;
                end
            end
            War_MovePerson(x,y);    --移动到相应的位置
        end
    end

    return 0;
end


function War_AutoCalMaxEnemyMap(wugongid,level)       --计算地图上每个位置可以攻击的敌人数目

    local wugongtype=JY.Wugong[wugongid]["攻击范围"];
    local movescope=JY.Wugong[wugongid]["移动范围" ..level];
	local fightscope=JY.Wugong[wugongid]["杀伤范围" ..level];

	local x0=WAR.Person[WAR.CurID]["坐标X"];
	local y0=WAR.Person[WAR.CurID]["坐标Y"];

 	CleanWarMap(4,0);    --用level 4地图表示哪些位置可以攻击到敌人

----点攻击和面攻击, 每个坐标可以攻击的敌人个数（显然只能为0和1）
---这里面攻击和点攻击一样处理，会导致面攻击可能不能攻击到最多的敌人，但是这样速度快
	if wugongtype==0 or wugongtype==3 then
		for n=0,WAR.PersonNum-1 do
			if n~=WAR.CurID and WAR.Person[n]["死亡"]==false and
				WAR.Person[n]["我方"] ~=WAR.Person[WAR.CurID]["我方"] then   --敌人
				local xx=WAR.Person[n]["坐标X"];
				local yy=WAR.Person[n]["坐标Y"];
				local movestep=War_CalMoveStep(n,movescope,1);   --计算武功移动步数
				for i=1,movescope do
					local step_num=movestep[i].num ;
					if step_num==0 then
						break;
					end
					for j=1,step_num do
						SetWarMap(movestep[i].x[j],movestep[i].y[j],4,1);  --标记武功移动的地方，即为可攻击到敌人之处
					end
				end
		end
		end
--线攻击和十字 记录每个的点可以攻击到敌人的个数。对线攻击，数组并不准确，需要进一步核实。
	elseif wugongtype==1 or wugongtype==2  then
		for n=0,WAR.PersonNum-1 do
			if n~=WAR.CurID and WAR.Person[n]["死亡"]==false and
				WAR.Person[n]["我方"] ~=WAR.Person[WAR.CurID]["我方"] then   --敌人
				local xx=WAR.Person[n]["坐标X"];
				local yy=WAR.Person[n]["坐标Y"];
				for direct=0,3 do
					for i=1,movescope do
						local xnew=xx+CC.DirectX[direct+1]*i;
						local ynew=yy+CC.DirectY[direct+1]*i;
						if xnew>=0 and xnew<CC.WarWidth and ynew>=0 and ynew<CC.WarHeight then
							local v=GetWarMap(xnew,ynew,4);
							SetWarMap(xnew,ynew,4,v+1);
						end
					end
				end
			end
		end

	end

end


function War_AutoCalMaxEnemy(x,y,wugongid,level)       --计算从(x,y)开始攻击最多能够击中几个敌人

    local wugongtype=JY.Wugong[wugongid]["攻击范围"];
    local movescope=JY.Wugong[wugongid]["移动范围" ..level];
	local fightscope=JY.Wugong[wugongid]["杀伤范围" ..level];

	local maxnum=0;
	local xmax,ymax;

	if wugongtype==0 or wugongtype==3 then

		local movestep=War_CalMoveStep(WAR.CurID,movescope,1);   --计算武功移动步数
		for i=1,movescope do
			local step_num=movestep[i].num ;
			if step_num==0 then
				break;
			end
			for j=1,step_num do
				local xx=movestep[i].x[j];
				local yy=movestep[i].y[j];
				local enemynum=0;

				for n=0,WAR.PersonNum-1 do   --计算武功攻击范围内的敌人个数
					 if n~=WAR.CurID and WAR.Person[n]["死亡"]==false and
					    WAR.Person[n]["我方"] ~=WAR.Person[WAR.CurID]["我方"] then
						 local x=math.abs(WAR.Person[n]["坐标X"]-xx);
						 local y=math.abs(WAR.Person[n]["坐标Y"]-yy);
						 if x<=fightscope and y <=fightscope then
							  enemynum=enemynum+1;
						 end
					 end
				end

				if enemynum>maxnum then        --记录最多敌人和位置
					maxnum=enemynum;
					xmax=xx;
					ymax=yy;
				end
			end
		end

	elseif wugongtype==1 then    --线攻击
		for direct=0,3 do           -- 对每个方向循环，找出敌人最多的
			local enemynum=0;
			for i=1,movescope do
				local xnew=x+CC.DirectX[direct+1]*i;
				local ynew=y+CC.DirectY[direct+1]*i;

				if xnew>=0 and xnew<CC.WarWidth and ynew>=0 and ynew<CC.WarHeight then
					local id=GetWarMap(xnew,ynew,2);
					if id>=0 then
						if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[id]["我方"] then
							enemynum=enemynum+1;                  --武功攻击范围内的敌人个数
						end
					end
				end
			end
			if enemynum>maxnum then        --记录最多敌人和位置
				maxnum=enemynum;
				xmax=x+CC.DirectX[direct+1];       --线攻击记录一个代表方向的坐标
				ymax=y+CC.DirectY[direct+1];
			end
		end

	elseif wugongtype==2 then --十字攻击
		local enemynum=0;
		for direct=0,3 do           -- 对每个方向循环
			for i=1,movescope do
				local xnew=x+CC.DirectX[direct+1]*i;
				local ynew=y+CC.DirectY[direct+1]*i;
				if xnew>=0 and xnew<CC.WarWidth and ynew>=0 and ynew<CC.WarHeight then
					local id=GetWarMap(xnew,ynew,2);
					if id>=0 then
						if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[id]["我方"] then
							enemynum=enemynum+1;                  --武功攻击范围内的敌人个数
						end
					end
				end
			end
		end
		if enemynum>0 then
			maxnum=enemynum;
			xmax=x;
			ymax=y;
		end
	end
	return maxnum,xmax,ymax;
end

--自动执行战斗，此时的位置一定可以打到敌人
function War_AutoExecuteFight(wugongnum)            --自动执行战斗，显示攻击动画
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local x0=WAR.Person[WAR.CurID]["坐标X"];
    local y0=WAR.Person[WAR.CurID]["坐标Y"];
    local wugongid=JY.Person[pid]["武功"  ..wugongnum];
    local level=math.modf(JY.Person[pid]["武功等级".. wugongnum]/100)+1;

    local maxnum,x,y=War_AutoCalMaxEnemy(x0,y0,wugongid,level);

    if x ~= nil then
        War_Fight_Sub(WAR.CurID,wugongnum,x,y);
		WAR.Person[WAR.CurID]["Action"]={'atk',x-WAR.Person[WAR.CurID]["坐标X"],y-WAR.Person[WAR.CurID]["坐标Y"]}
	end

end

--逃跑
function War_AutoEscape()                --逃跑
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    if JY.Person[pid]["体力"]<=5  then
	    return
	end

    local x,y;

    War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["移动步数"],0);   --计算移动步数
	WarDrawMap(1)
	ShowScreen()
	local starttime=lib.GetTime();
	local array={}
	local num=0
    for i=0,CC.WarWidth-1 do
        for j=0,CC.WarHeight-1 do
			if GetWarMap(i,j,3)<128 then
                local minDest=math.huge;
                for k=0,WAR.PersonNum-1 do
                    if WAR.Person[WAR.CurID]["我方"]~=WAR.Person[k]["我方"] and WAR.Person[k]["死亡"]==false then
                        local dx=math.abs(i-WAR.Person[k]["坐标X"])
                        local dy=math.abs(j-WAR.Person[k]["坐标Y"])
                        if minDest>(dx+dy) then        --计算当前距离敌人最近的位置
                            minDest=dx+dy;
                        end
                    end
                end
				num=num+1
				array[num]={}
				array[num].x=i
				array[num].y=j
				array[num].p=minDest
--[[
                if minDest>maxDest then           --找一个最远的位置
                    maxDest=minDest;
                    x=i;
                    y=j;
                end--]]
            end
        end
    end
	for i=1,num-1 do
		for j=i,num do
			if array[i].p<array[j].p then
				array[i],array[j]=array[j],array[i]
			end
		end
	end
	for i=2,num do
		if array[i].p<array[1].p/2 then
			num=i-1
			break
		end
	end
	for i=1,num do
		array[i].p=array[i].p*5+GetMovePoint(array[i].x,array[i].y,1)
	end
	for i=1,num-1 do
		for j=i,num do
			if array[i].p<array[j].p then
				array[i],array[j]=array[j],array[i]
			end
		end
	end
	x=array[1].x
	y=array[1].y
	
	local endtime=starttime+200-lib.GetTime()
	if endtime>0 then
		lib.Delay(endtime)
	end
	War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["移动步数"],0); 
    War_MovePerson(x,y);    --移动到相应的位置

end


function WAR_CALLEVENT(num)
	local war={}
	
	
	if war[num]==nil then 
		dofile(CONFIG.ScriptPath.."war\\warevent.lua")
		return 0
	else	
		local eventfilename=string.format("warevent%d.lua",num);
		--lib.Debug(eventfilename);
		return dofile(CONFIG.ScriptPath.."war\\" .. eventfilename) or 0;
	end
end


function WE_xy(x,y,id)			
--输入id时，适用于移动
--不输入时，适用于出现
	if id~=nil then
		War_CalMoveStep(id,128,0)
		--MY_CalMoveStep(x,y,128,0)
	else
		CleanWarMap(3,0)
	end
	if GetWarMap(x,y,3)~=255 and War_CanMoveXY(x,y,0) then
		return x,y
	else
		for s=1,128 do
			for i=1,s do
				local j=s-i
				if x+i<63 and y+j<63 then
					if GetWarMap(x+i,y+j,3)~=255 and War_CanMoveXY(x+i,y+j,0) then
						return x+i,y+j
					end
				end
				if x+j<63 and y-i>0 then
					if GetWarMap(x+j,y-i,3)~=255 and War_CanMoveXY(x+j,y-i,0) then
						return x+j,y-i	
					end
				end
				if x-i>0 and y-j>0 then
					if GetWarMap(x-i,y-j,3)~=255 and War_CanMoveXY(x-i,y-j,0) then
						return x-i,y-j	
					end
				end
				if x-j>0 and y+i<63 then
					if GetWarMap(x-j,y+i,3)~=255 and War_CanMoveXY(x-j,y+i,0) then
						return x-j,y+i
					end
				end
			end
		end		
	end
	
	for s=1,128 do
		for i=1,s do
			local j=s-i
			if x+i<63 and y+j<63 then
				if War_CanMoveXY(x+i,y+j,0) then
					return x+i,y+j
				end
			end
			if x+j<63 and y-i>0 then
				if War_CanMoveXY(x+j,y-i,0) then
					return x+j,y-i	
				end
			end
			if x-i>0 and y-j>0 then
				if War_CanMoveXY(x-i,y-j,0) then
					return x-i,y-j	
				end
			end
			if x-j>0 and y+i<63 then
				if War_CanMoveXY(x-j,y+i,0) then
					return x-j,y+i
				end
			end
		end
	end	
	return x,y
end	
		
function WE_getwarid(pid)
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]["人物编号"]==pid then return i end
	end
	return -1
end

function WE_move(pid,x,y)
--pid,人物编号
--x,y,目的坐标与坐标的相对值
	local id=WE_getwarid(pid)
	if id==-1 then return end
	WAR.CurID=id
	local cx,cy=WAR.Person[id]["坐标X"],WAR.Person[id]["坐标Y"]
	local nx,ny=WE_xy(cx+x,cy+y,id)
	--lib.Debug(x..','..y..','..nx..','..ny)
	War_MovePerson(nx,ny)
	lib.Delay(100)
end

function WE_moveto(pid,x,y)
--pid,人物编号
--x,y,目的坐标
	local id=WE_getwarid(pid)
	if id==-1 then return end
	WAR.CurID=id
	local nx,ny=WE_xy(x,y,id)
	--lib.Debug(x..','..y..','..nx..','..ny)
	War_MovePerson(nx,ny)
	lib.Delay(100)
end

function WE_follow(pid,eid)
--pid,人物编号
--id,目标人物，移动到离目标人物最近的位置
	local a=WE_getwarid(pid)
	local b=WE_getwarid(eid)
	--lib.Debug(a..','..b)
	if a==-1 or b==-1 then return end
	WAR.CurID=a
	local x,y=WAR.Person[b]["坐标X"],WAR.Person[b]["坐标Y"]
	local nx,ny=WE_xy(x,y,a)
	--lib.Debug(pid..','..eid..','..a..','..b..','..x..','..y..','..nx..','..ny)
	War_MovePerson(nx,ny)
	lib.Delay(100)
end

function WE_addperson(id,x,y,faseto,flag)
--id,战场上新加的人物的人物编号
--x,y,出现位置
--flag,敌我标识
--faceto人物方向：0右上1右下2左上3左下
	faseto=faseto or 0
	flag=flag or true
	local cx,cy=WE_xy(x,y)
	WAR.Person[WAR.PersonNum]["人物编号"]=id;
	WAR.Person[WAR.PersonNum]["我方"]=true--flag;
	WAR.Person[WAR.PersonNum]["坐标X"]=cx;
	WAR.Person[WAR.PersonNum]["坐标Y"]=cy;
	WAR.Person[WAR.PersonNum]["死亡"]=false;
	WAR.Person[WAR.PersonNum]["人方向"]=faseto;
	WAR.Person[WAR.PersonNum]["贴图"]=WarCalPersonPic(WAR.PersonNum);
		--WAR.Person[i]["贴图"]=WarCalPersonPic(i);
	--WAR.Person[WAR.PersonNum]["AI"]=2;
	SetWarMap(cx,cy,2,WAR.PersonNum);
	SetWarMap(cx,cy,5,WAR.Person[WAR.PersonNum]["贴图"]);
	lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[id]["头像代号"]),string.format(CC.FightPicFile[2],JY.Person[id]["头像代号"]),4+WAR.PersonNum);
	--WAR.Person[WAR.PersonNum]["轻功"]=GetSpeed(id)
	WAR.Person[WAR.PersonNum]["移动步数"]=math.modf(WAR.Person[WAR.PersonNum]["轻功"]/20)--JY.Person[id]["受伤程度"]/40);
	WAR.PersonNum=WAR.PersonNum+1
	--WAR.CurID=WAR.PersonNum-1
end

function WE_sort()
--集中处理设置新加人物
--如设置贴图，轻功排序等
--未考虑周全	
--现在这个函数基本没用了，暂且保留吧
	WarPersonSort(1)
	for i=0,WAR.PersonNum-1 do
		local pid=WAR.Person[i]["人物编号"]
		lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[pid]["头像代号"]),string.format(CC.FightPicFile[2],JY.Person[pid]["头像代号"]),4+i);
		end
end

function WE_atk(id,cx,cy,kfid,lv,flag)
--播放武功动画
--如果lv为空，则只播放人物攻击动作
	CleanWarMap(4,0)
	local cid=WE_getwarid(id)
	local x0=WAR.Person[cid]["坐标X"];
	local y0=WAR.Person[cid]["坐标Y"];
	WAR.Person[cid]["人方向"]=War_Direct(0,0,cx,cy) or WAR.Person[cid]["人方向"]
	if lv~=nil then
		local kind,len1,len2=fenjie(JY.Wugong[kfid]["范围"..math.modf((lv+2)/3)])
		WarDrawAtt(x0+cx,y0+cy,kind,len1,len2,3,x0,y0)
	end
	local tmp=WAR.CurID
	WAR.CurID=cid
	War_ShowFight(id,kfid,JY.Wugong[kfid]["武功类型"],lv,x0+cx,y0+cy,JY.Wugong[kfid]["武功动画&音效"],0,0,0);
	WAR.CurID=tmp
	CleanWarMap(4,0)
end

function WE_JL(id1,id2,len)
--判断两个id之间的距离，如果小于等于len则反回真
--如果len为空则返回两人的距离
	len=len or 1
	local cid1=WE_getwarid(id1)
	local cid2=WE_getwarid(id2)
	local x1,y1=WAR.Person[cid1]["坐标X"],WAR.Person[cid1]["坐标Y"]
	local x2,y2=WAR.Person[cid2]["坐标X"],WAR.Person[cid2]["坐标Y"]
	local s=math.abs(x1-x2)+math.abs(y1-y2)
	if len==nil then return s
	elseif s<=len then return true
	else return false
	end
end

function WE_chuxian(id,x,y)
	local pid=WE_getwarid(id)
	local cx,cy=WE_xy(x,y)
	SetWarMap(cx,cy,2,pid);
	SetWarMap(cx,cy,5,WAR.Person[pid]["贴图"]);
	WAR.Person[pid]["坐标X"]=cx
	WAR.Person[pid]["坐标Y"]=cy
end

function WE_xiaoshi(id)
	local pid=WE_getwarid(id)
	local cx,cy=WAR.Person[pid]["坐标X"],WAR.Person[pid]["坐标Y"]
	SetWarMap(cx,cy,2,-1);
	SetWarMap(cx,cy,5,-1);
end

---吃药
----flag=2 生命，3内力；4体力  6 解毒
function War_AutoEatDrug(flag)          ---吃药加参数
    local pid=WAR.Person[WAR.CurID]["人物编号"];
    local life=JY.Person[pid]["生命"];
    local maxlife=JY.Person[pid]["生命最大值"];
    local selectid;
    local minvalue=math.huge;

    local shouldadd;
    local maxattrib;
    local str;
    if flag==2 then
        maxattrib=JY.Person[pid]["生命最大值"];
        shouldadd=maxattrib-JY.Person[pid]["生命"];
        str="加生命";
    elseif flag==3 then
        maxattrib=JY.Person[pid]["内力最大值"];
        shouldadd=maxattrib-JY.Person[pid]["内力"];
        str="加内力";
    elseif flag==4 then
        maxattrib=CC.PersonAttribMax["体力"];
        shouldadd=maxattrib-JY.Person[pid]["体力"];
        str="加体力";
    elseif flag==6 then
        maxattrib=CC.PersonAttribMax["中毒程度"];
        shouldadd=JY.Person[pid]["中毒程度"];
        str="加中毒解毒";
    else
        return ;
    end

    local function Get_Add(thingid)     --定义物品增加的值
	    if flag==6 then
		    return -JY.Thing[thingid][str]/2;   --解毒为负值
		else
            return JY.Thing[thingid][str];
		end
	end

    if inteam(pid) and WAR.Person[WAR.CurID]["我方"]==true then
        local extra=0;
        for i =1, CC.MyThingNum do
            local thingid=JY.Base["物品" ..i];
            if thingid>=0 then
                local add=Get_Add(thingid);
                if JY.Thing[thingid]["类型"]==3 and add>0 then
                    local v=shouldadd-add;
                    if v<0 then               --可以加满, 用其他方法找合适药品
                        extra=1;
                        break;
                    else
                        if v<minvalue then        --寻找加生命后生命最大的
                            minvalue=v;
                            selectid=thingid;
                        end
                    end
                end
            end
        end
        if extra==1 then
            minvalue=math.huge;
            for i =1, CC.MyThingNum do
                local thingid=JY.Base["物品" ..i];
                if thingid>=0 then
                    local add=Get_Add(thingid);
                    if JY.Thing[thingid]["类型"]==3 and add>0 then
                        local v=add-shouldadd;
                        if v>=0 then               --可以加满生命
                            if v<minvalue then
                                minvalue=v;
                                selectid=thingid;
                            end
                        end
                    end
                end
            end
        end
        if UseThingEffect(selectid,pid)==1 then       --使用有效果
            instruct_32(selectid,-1);            --物品数量减少
        end
    else
        local extra=0;
        for i =1, 4 do
            local thingid=JY.Person[pid]["携带物品" ..i];
			local tids=JY.Person[pid]["携带物品数量" ..i];
            if thingid>=0 and tids>0 then
                local add=Get_Add(thingid);
                if JY.Thing[thingid]["类型"]==3 and add>0 then
                    local v=shouldadd-add;
                    if v<0 then               --可以加满生命, 用其他方法找合适药品
                        extra=1;
                        break;
                    else
                        if v<minvalue then        --寻找加生命后生命最大的
                            minvalue=v;
                            selectid=thingid;
                        end
                    end
                end
            end
        end
        if extra==1 then
            minvalue=math.huge;
            for i =1, 4 do
                local thingid=JY.Person[pid]["携带物品" ..i];
				local tids=JY.Person[pid]["携带物品数量" ..i];
                if thingid>=0 and tids>0 then
                    local add=Get_Add(thingid);
                    if JY.Thing[thingid]["类型"]==3 and add>0 then
                        local v=add-shouldadd;
                        if v>=0 then               --可以加满生命
                            if v<minvalue then
                                minvalue=v;
                                selectid=thingid;
                            end
                        end
                    end
                end
            end
        end

        if UseThingEffect(selectid,pid)==1 then       --使用有效果
            instruct_41(pid,selectid,-1);            --物品数量减少
        end
    end

    lib.Delay(500);
end


--自动医疗
function War_AutoDoctor()            --自动医疗
    local x1=WAR.Person[WAR.CurID]["坐标X"];
    local y1=WAR.Person[WAR.CurID]["坐标Y"];

    War_ExecuteMenu_Sub(x1,y1,3,-1);
end


function setBright()
	--CC.Light
	for i=0,639 do
		Bright[i]={}
		for j=0,479 do
			local light=CC.Light-math.sqrt((i-CC.ScreenW/2)^2+(j-CC.ScreenH/2)^2)*(CC.Light)/CC.Sight
			if light>255 then
				light=255
			elseif light<0 then
				light=0
			end
			Bright[i][j]=light
		end
	end
end

function WarDrawAtt(x,y,fanwei,flag,cx,cy,atk)
	local x0,y0
	if cx==nil or cy==nil then
		x0=WAR.Person[WAR.CurID]["坐标X"];
		y0=WAR.Person[WAR.CurID]["坐标Y"];
	else
		x0,y0=cx,cy
	end
	local kind=fanwei[1]
	local len1=fanwei[2]-- or 0
	--if len1<0 then len1=0 end
	local len2=fanwei[3]-- or 0
	--if len2<0 then len2=0 end
	local len3=fanwei[4]-- or 0
	--if len3<0 then len3=0 end
	local len4=fanwei[5]-- or 0
	--if len4<0 then len4=0 end
	local xy={}
	local num=0
	
	if kind==0 then		--单点
		num=1
		xy[1]={x,y}				
	elseif kind==1 then					--定点米
		len1=len1 or 0
		len2=len2 or 0
		num=num+1
		xy[num]={x,y}
		for i=1,len1 do
			xy[num+1]={x+i,y}
			xy[num+2]={x-i,y}
			xy[num+3]={x,y+i}
			xy[num+4]={x,y-i}
			num=num+4
		end
		for i=1,len2 do
			xy[num+1]={x+i,y+i}
			xy[num+2]={x-i,y-i}
			xy[num+3]={x-i,y+i}
			xy[num+4]={x+i,y-i}
			num=num+4		
		end			
	elseif kind==2 then					--定点菱形
		for tx=x-len1,x+len1 do			--这个方法感觉有点浪费，1/2的点都是不符合要求的
			for ty=y-len1,y+len1 do
				if math.abs(tx-x)+math.abs(ty-y)>len1 then
				
				else
					num=num+1
					xy[num]={tx,ty}
				end
			end
		end			
	elseif kind==3 then					--定点方块
		len2=len2 or len1
		local dx,dy=math.abs(x-x0),math.abs(y-y0)
		if dx>dy then len1,len2=len2,len1 end
		for tx=x-len1,x+len1 do
			for ty=y-len2,y+len2 do
				num=num+1
				xy[num]={tx,ty}
			end
		end	
	elseif kind==5 then					--粗十字
		len1=len1 or 0
		len2=len2 or 0
		num=num+1
		xy[num]={x,y}
		for i=1,len1 do
			xy[num+1]={x+i,y}
			xy[num+2]={x-i,y}
			xy[num+3]={x,y+i}
			xy[num+4]={x,y-i}
			num=num+4
		end
		if len2>0 then
			xy[num+1]={x+1,y+1}
			xy[num+2]={x+1,y-1}
			xy[num+3]={x-1,y+1}
			xy[num+4]={x-1,y-1}
			num=num+4
		end
		for i=2,len2 do
			xy[num+1]={x+i,y+1}
			xy[num+2]={x-i,y-1}
			xy[num+3]={x-i,y+1}
			xy[num+4]={x+i,y-1}
			xy[num+5]={x+1,y+i}
			xy[num+6]={x-1,y-i}
			xy[num+7]={x-1,y+i}
			xy[num+8]={x+1,y-i}
			num=num+8		
		end	
	elseif kind==6 then					--定点井
		len2=len2 or len1
		xy[1]={x+1,y}
		xy[2]={x-1,y}
		xy[3]={x,y+1}
		xy[4]={x,y-1}
		num=num+4
		if len1>0 or len2>0 then
			xy[5]={x+1,y+1}
			xy[6]={x+1,y-1}
			xy[7]={x-1,y+1}
			xy[8]={x-1,y-1}
			num=num+4
			for i=2,len1 do
				xy[num+1]={x+i,y+1}
				xy[num+2]={x-i,y+1}
				xy[num+3]={x+i,y-1}
				xy[num+4]={x-i,y-1}
				num=num+4
			end
			for i=2,len2 do
				xy[num+1]={x+1,y+i}
				xy[num+2]={x+1,y-i}
				xy[num+3]={x-1,y+i}
				xy[num+4]={x-1,y-i}
				num=num+4
			end
		end
	elseif kind==7 then					--定点田
		len2=len2 or len1
		if len1==0 then
			for i=y-len2,y+len2 do
				num=num+1
				xy[num]={x,i}
			end
		elseif len2==0 then
			for i=x-len1,x+len1 do
				num=num+1
				xy[num]={i,y}
			end
		else
			for i=x-len1,x+len1 do
				num=num+1
				xy[num]={i,y}
				num=num+1
				xy[num]={i,y+len2}
				num=num+1
				xy[num]={i,y-len2}
			end
			for i=1,len2-1 do
				xy[num+1]={x,y+i}
				xy[num+2]={x,y-i}
				xy[num+3]={x-len1,y+i}
				xy[num+4]={x-len1,y-i}
				xy[num+5]={x+len1,y+i}
				xy[num+6]={x+len1,y-i}
				num=num+6
			end
		end
	elseif kind==8 then					--定点卍
		xy[1]={x,y}
		num=1
		for i=1,len1 do
			xy[num+1]={x+i,y}
			xy[num+2]={x-i,y}
			xy[num+3]={x,y+i}
			xy[num+4]={x,y-i}
			xy[num+5]={x+i,y+len1}
			xy[num+6]={x-i,y-len1}
			xy[num+7]={x+len1,y-i}
			xy[num+8]={x-len1,y+i}
			num=num+8
		end
	elseif kind==9 then					--定点卐
		xy[1]={x,y}
		num=1
		for i=1,len1 do
			xy[num+1]={x+i,y}
			xy[num+2]={x-i,y}
			xy[num+3]={x,y+i}
			xy[num+4]={x,y-i}
			xy[num+5]={x-i,y+len1}
			xy[num+6]={x+i,y-len1}
			xy[num+7]={x+len1,y+i}
			xy[num+8]={x-len1,y-i}
			num=num+8
		end
	elseif x==x0 and y==y0 then
		return 0
	elseif kind==10 then				--方向线
		len2=len2 or 0
		len3=len3 or 0
		len4=len4 or 0
		local fx,fy=x-x0,y-y0
		if fx>0 then fx=1
		elseif fx<0 then fx=-1 end
		if fy>0 then fy=1
		elseif fy<0 then fy=-1 end
		local dx1,dy1,dx2,dy2=-fy,fx,fy,-fx
	--	if fx~=0 and fy~=0 then
			dx1=-(dx1+fx)/2
			dx2=-(dx2+fx)/2
			dy1=-(dy1+fy)/2
			dy2=-(dy2+fy)/2
		if dx1>0 then dx1=1
		elseif dx1<0 then dx1=-1 end
		if dx2>0 then dx2=1
		elseif dx2<0 then dx2=-1 end
		if dy1>0 then dy1=1
		elseif dy1<0 then dy1=-1 end
		if dy2>0 then dy2=1
		elseif dy2<0 then dy2=-1 end
		--end
		--首先绘制中间一条
		for i=0,len1-1 do
			num=num+1
			xy[num]={x+i*fx,y+i*fy}
		end
			--然后是两边
		for i=0,len2-1 do
			num=num+1
			xy[num]={x+dx1+i*fx,y+dy1+i*fy}
			num=num+1
			xy[num]={x+dx2+i*fx,y+dy2+i*fy}
		end	
		for i=0,len3-1 do
			num=num+1
			xy[num]={x+2*dx1+i*fx,y+2*dy1+i*fy}
			num=num+1
			xy[num]={x+2*dx2+i*fx,y+2*dy2+i*fy}
		end	
		for i=0,len4-1 do
			num=num+1
			xy[num]={x+3*dx1+i*fx,y+3*dy1+i*fy}
			num=num+1
			xy[num]={x+3*dx2+i*fx,y+3*dy2+i*fy}
		end	
	elseif kind==11 then				--正三角
		local fx,fy=x-x0,y-y0
		if fx>1 then fx=1
		elseif fx<-1 then fx=-1 end
		if fy>1 then fy=1
		elseif fy<-1 then fy=-1 end
		local dx1,dy1,dx2,dy2=-fy,fx,fy,-fx
		if fx~=0 and fy~=0 then
			dx1=-(dx1+fx)/2
			dx2=-(dx2+fx)/2
			dy1=-(dy1+fy)/2
			dy2=-(dy2+fy)/2
			len1=math.modf(len1*0.7071)
			for i=0,len1 do
				num=num+1
				xy[num]={x+i*fx,y+i*fy}
				for j=1,2*i+1 do
					num=num+1
					xy[num]={x+i*fx+j*dx1,y+i*fy+j*dy1}
					num=num+1
					xy[num]={x+i*fx+j*dx2,y+i*fy+j*dy2}
				end
			end
		else
			for i=0,len1 do
				num=num+1
				xy[num]={x+i*fx,y+i*fy}
				for j=1,len1-i do
					num=num+1
					xy[num]={x+i*fx+j*dx1,y+i*fy+j*dy1}
					num=num+1
					xy[num]={x+i*fx+j*dx2,y+i*fy+j*dy2}
				end
			end
		end
	elseif kind==12 then				--倒三角
		local fx,fy=x-x0,y-y0
		if fx>1 then fx=1
		elseif fx<-1 then fx=-1 end
		if fy>1 then fy=1
		elseif fy<-1 then fy=-1 end
		local dx1,dy1,dx2,dy2=-fy,fx,fy,-fx
		if fx~=0 and fy~=0 then
			dx1=(dx1+fx)/2
			dx2=(dx2+fx)/2
			dy1=(dy1+fy)/2
			dy2=(dy2+fy)/2
			len1=math.modf(len1*1.41421)
			for i=0,len1 do
				if i<=len1/2 then
					num=num+1
					xy[num]={x+i*fx,y+i*fy}
				end
				for j=1,len1-i*2 do
					num=num+1
					xy[num]={x+i*fx+j*dx1,y+i*fy+j*dy1}
					num=num+1
					xy[num]={x+i*fx+j*dx2,y+i*fy+j*dy2}
				end
			end
		else
			for i=0,len1 do
				num=num+1
				xy[num]={x+i*fx,y+i*fy}
				for j=1,i do
					num=num+1
					xy[num]={x+i*fx+j*dx1,y+i*fy+j*dy1}
					num=num+1
					xy[num]={x+i*fx+j*dx2,y+i*fy+j*dy2}
				end
			end
		end
	elseif kind==13 then			--方向菱形
		local fx,fy=x-x0,y-y0;
		if fx>1 then fx=1
		elseif fx<-1 then fx=-1 end
		if fy>1 then fy=1
		elseif fy<-1 then fy=-1 end
		local xx=x+fx*len1;
		local yy=y+fy*len1;
		for tx=xx-len1,xx+len1 do			--这个方法感觉有点浪费，1/2的点都是不符合要求的
			for ty=yy-len1,yy+len1 do
				if math.abs(tx-xx)+math.abs(ty-yy)>len1 then
				
				else
					num=num+1
					xy[num]={tx,ty}
				end
			end
		end	
	else
		return 0
	end	
		
		
		
	if flag==1 then									--绘制攻击范围

		local function thexy(nx,ny,x,y)
			local dx,dy=nx-x,ny-y;
			local hb=lib.GetS(JY.SubScene,nx,ny,4)
			if CONFIG.Zoom==1 then
				hb=hb*2;
			end
			return CC.ScreenW/2+CC.XScale*(dx-dy),CC.ScreenH/2+CC.YScale*(dx+dy)-hb
		end
		
		for i=1,num do
			local tx,ty=thexy(xy[i][1],xy[i][2],x0,y0)
			lib.PicLoadCache(0,0,tx,ty,2,128)		
		end
	elseif flag==2 then													--返回攻击数目
		local diwo=WAR.Person[WAR.CurID]["我方"]
		local atknum=0
		for i=1,num do
			if xy[i][1]>=0 and xy[i][1]<CC.WarWidth and xy[i][2]>=0 and xy[i][2]<CC.WarHeight then
				local id=GetWarMap(xy[i][1],xy[i][2],2);
				if id~=-1 and id~=WAR.CurID then 
					--lib.Debug(xy[i][1]..','..xy[i][2]..'|'..id)
					local xa,xb,xc
					if diwo~=WAR.Person[id]["我方"] then 
						xa=2
					elseif GetS(0,0,0,0)==1 then
						xa=-0.5
					else
						xa=0
					end
					local hp=JY.Person[WAR.Person[id]["人物编号"]]["生命"]
					if hp<atk/6 then
						xb=2
					elseif hp<atk/3 then
						xb=1
					else
						xb=0
					end
					local danger=JY.Person[WAR.Person[id]["人物编号"]]["内力最大值"]
					xc=danger/500
					atknum=atknum+xa*math.modf(xb*xc+5)
					
--					if id<0 then--==WAR.Person[WAR.CurID]["自动选择对手"] then
	--					atknum=atknum+60	--这个地方暂时不使用
		--			else
			--			local hp=JY.Person[WAR.Person[id]["人物编号"]]["生命"]
				--		if hp<atk/6 then
					--		atknum=atknum+20
--						elseif hp<atk/3 then
	--						atknum=atknum+15
		--				else
			--				atknum=atknum+10
				--		end		
--					end
				end;
			end
		end
		return atknum;
	elseif flag==3 then							--设置武功效果作用层，第四层
		--CleanWarMap(4,0)
		for i=1,num do
			SetWarMap(xy[i][1],xy[i][2],4,1);
		end
	
	end
		
		
end

function War_FightSelectType(movefanwei,atkfanwei,x,y)		--
    local x0=WAR.Person[WAR.CurID]["坐标X"];
    local y0=WAR.Person[WAR.CurID]["坐标Y"];
    if x==nil and y==nil then
        x,y=War_KfMove(movefanwei,atkfanwei);              --未指定攻击地点，选择攻击对象
		if x ==nil then
			lib.GetKey();
			Cls();
			return;
		end
	else																	--自动战斗时，以指定攻击地点，针对斗转的情况对坐标修正
		--[[
		if movefanwei[1]<2 and movefanwei[2]==0 then
			x=x0
			y=y0
		elseif movefanwei[1]==2 then
			local dx=x-x0
			local dy=y-y0
			if math.abs(dx)>math.abs(dy) then
				if dx>0 then
					x=x0+1
				else
					x=x0-1
				end
			else
				if dy>0 then
					y=y0+1
				else
					y=y0-1
				end
			end
		elseif movefanwei[1]==3 then
		    local dx=math.abs(x-x0);
			local dy=math.abs(y-y0);
			local dxy=math.abs(dx-dy)
			if dx+dy~=1 then 			--坐标正确就不修正了
				if dxy==0 or dxy==1 or dxy==2 then						--这里按理来说应该是 ==1，可为啥实际1反而有问题？嗯，其实就是针对斗转罢了，其他的都是正确的坐标,修好了
					if x>x0 then
						dx=1
					else
						dx=-1
					end
					if y>y0 then
						dy=1
					else
						dy=-1
					end			
				--lib.Debug(x0..','..y0..'|'..x..','..y..'|'..dx..','..dy)
				else 			
					if dy>dx then
						if y>y0 then
							dx,dy=0,1;
						else
							dx,dy=0,-1;
						end
					else
						if x>x0 then
							dx,dy=1,0;
						else
							dx,dy=-1,0;
						end
					end
				end
				x,y=x0+dx,y0+dy
			end
		end
		if kind==0 then
			x,y=x0,y0
		elseif kind==8 then
			x,y=x0,y0
		elseif kind==9 then
		    local dx=math.abs(x-x0);
			local dy=math.abs(y-y0);
			local dxy=math.abs(dx-dy)
			if dx+dy~=1 then 			--坐标正确就不修正了
				if dxy==0 or dxy==1 then						--这里按理来说应该是 ==1，可为啥实际1反而有问题？嗯，其实就是针对斗转罢了，其他的都是正确的坐标,修好了
					if x>x0 then
						dx=1
					else
						dx=-1
					end
					if y>y0 then
						dy=1
					else
						dy=-1
					end			
				--lib.Debug(x0..','..y0..'|'..x..','..y..'|'..dx..','..dy)
				else 			
					if dy>dx then
						if y>y0 then
							dx,dy=0,1;
						else
							dx,dy=0,-1;
						end
					else
						if x>x0 then
							dx,dy=1,0;
						else
							dx,dy=-1,0;
						end
					end
				end
				x,y=x0+dx,y0+dy
			end
		elseif kind==10 then
			local dx=x-x0;
			local dy=y-y0;
			--if math.abs(dx+dy)~=1 then
				if math.abs(dy)>math.abs(dx) then
					if y>y0 then
						dx,dy=0,1;
					else
						dx,dy=0,-1;
					end
				else
					if x>x0 then
						dx,dy=1,0;
					else
						dx,dy=-1,0;
					end
				end
				x,y=x0+dx,y0+dy
			--end
		end
		--]]
		--WarSetPerson()		
		WarDrawAtt(x,y,atkfanwei,1)								--显示攻击范围，斗转时显示不正确，应该是人物没有移动到场景中心-修复了
		ShowScreen();
		lib.Delay(500);
    end

    WAR.Person[WAR.CurID]["人方向"]=War_Direct(x0,y0,x,y) or WAR.Person[WAR.CurID]["人方向"]

	SetWarMap(x,y,4,1);

    WAR.EffectXY={};
	--WarDrawAtt(x,y,atkfanwei,3)
	return x,y

end

function War_KfMove(movefanwei,atkfanwei)              ---选择移动位置
--kind 0菱形1方块 2四向 3八向
	local kind=movefanwei[1] or 0
	local len=movefanwei[2] or 0
    local x0=WAR.Person[WAR.CurID]["坐标X"];
    local y0=WAR.Person[WAR.CurID]["坐标Y"];
    local x=x0;
    local y=y0;
	if kind~=nil then
		if kind==0 then
			War_CalMoveStep(WAR.CurID,len,1);
		elseif kind==1 then
			War_CalMoveStep(WAR.CurID,len*2,1);
			for r=1,len*2 do
				for i=0,r do
					local j=r-i
					if i>len or j>len then
						SetWarMap(x0+i,y0+j,3,255)
						SetWarMap(x0+i,y0-j,3,255)
						SetWarMap(x0-i,y0+j,3,255)
						SetWarMap(x0-i,y0-j,3,255)
					end
				end
			end
			--[[
			CleanWarMap(3,255); 
			for i=x0-len,x0+len do
				for j=y0-len,y0+len do
					SetWarMap(i,j,3,0)
				end
			end
			]]--
		elseif kind==2 then
			War_CalMoveStep(WAR.CurID,len,1);
			for i=1,len-1 do
				for j=1,len-1 do
					SetWarMap(x0+i,y0+j,3,255)
					SetWarMap(x0-i,y0+j,3,255)
					SetWarMap(x0+i,y0-j,3,255)
					SetWarMap(x0-i,y0-j,3,255)
				end
			end
			--[[
			CleanWarMap(3,255); 
			SetWarMap(x,y,3,0)
			for i=1,len do
				SetWarMap(x+i,y,3,0)
				SetWarMap(x-i,y,3,0)
				SetWarMap(x,y+i,3,0)
				SetWarMap(x,y-i,3,0)
			end
			]]--
		elseif kind==3 then
			War_CalMoveStep(WAR.CurID,2,1);
			SetWarMap(x0+2,y0,3,255)
			SetWarMap(x0-2,y0,3,255)
			SetWarMap(x0,y0+2,3,255)
			SetWarMap(x0,y0-2,3,255)
			--[[
			CleanWarMap(3,255); 
			SetWarMap(x,y,3,0)
			SetWarMap(x+1,y,3,0)
			SetWarMap(x-1,y,3,0)
			SetWarMap(x,y+1,3,0)
			SetWarMap(x,y-1,3,0)
			SetWarMap(x+1,y+1,3,0)
			SetWarMap(x-1,y+1,3,0)
			SetWarMap(x+1,y-1,3,0)
			SetWarMap(x-1,y-1,3,0)
			]]--
		else
			War_CalMoveStep(WAR.CurID,0,1);
		end
	end
    while true do
        local x2=x;
        local y2=y;

        WarDrawMap(1,x,y);
		WarDrawAtt(x,y,atkfanwei,1)
		WarShowHead(GetWarMap(x,y,2))
        ShowScreen();
        local key=WaitKey(1);
        if key==VK_UP then
            y2=y-1;
        elseif key==VK_DOWN then
            y2=y+1;
        elseif key==VK_LEFT then
            x2=x-1;
        elseif key==VK_RIGHT then
            x2=x+1;
        elseif key==VK_SPACE or key==VK_RETURN then
			if kind<2 or x~=x0 or y~=y0 then
				return x,y;
			end
        elseif key==VK_ESCAPE then
            return nil;
		elseif key>999999 then
			local kk,mx,my
			if key>1999999 then
				kk=1
				key=key-2000000
			else
				kk=0
				key=key-1000000
			end
			mx=math.modf(key/1000)
			my=math.fmod(key,1000)
			mx=mx-CC.ScreenW/2
			my=my-CC.ScreenH/2
			mx=mx/CC.XScale
			my=my/CC.YScale
			mx,my=(mx+my)/2,(my-mx)/2
			if mx>0 then mx=mx+0.99 else mx=mx-0.01 end
			if my>0 then my=my+0.99 else mx=mx-0.01 end
			mx=math.modf(mx)
			my=math.modf(my)
			for i=1,20 do
				if mx+i >63 or my+i>63 then
					break
				end
				local hb=GetS(JY.SubScene,x0+mx+i,y0+my+i,4);
				if CONFIG.Zoom==1 then
					hb=hb*2
				end
				if math.abs(hb-CC.YScale*i*2)<8 then
					mx=mx+i
					my=my+i
					break
				end
			end
			x2,y2=mx+x0,my+y0
			if kk==1 and (kind<2 or x~=x0 or y~=y0) then
				return x,y;
			end
		end
		if GetWarMap(x2,y2,3)<128 then
            x=x2;
            y=y2;
        end
    end

end

function refw(wugong,level)
	local m1,m2,a1,a2,a3,a4,a5
    local fightscope=JY.Wugong[wugong]["攻击范围"];
	local kfkind=JY.Wugong[wugong]["武功类型"];
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	if fightscope==0 then 
		if level>10 then
			m1=1
			m2=JY.Wugong[wugong]["移动范围"..10];
			a1=1
			a2=3
			a3=3
		else
			m1=0
			m2=JY.Wugong[wugong]["移动范围"..level];
			a1=1
			a2=math.modf(level/5)
			a3=math.modf(level/8)
		end
	elseif fightscope==1 then
		if kfkind==1 then
			a1=12
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["移动范围"..10];
				a2=JY.Wugong[wugong]["移动范围"..10]-1;
			else
				m1=2
				m2=1--JY.Wugong[wugong]["移动范围"..level];
				a2=JY.Wugong[wugong]["移动范围"..level]-1;
			end		
		elseif kfkind==2 then
			a1=10
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["移动范围"..10];
				a2=JY.Wugong[wugong]["移动范围"..10];
				a3=a2-1
				a4=a3-1
			else
				m1=2
				m2=1--JY.Wugong[wugong]["移动范围"..level];
				a2=JY.Wugong[wugong]["移动范围"..level];
				if level>7 then
					a3=a2-1
				end
			end
		elseif kfkind==3 then
			a1=11
			if level>10 then
				m1=3
				m2=1
				a2=JY.Wugong[wugong]["移动范围"..10]-1;
			else
				m1=2
				m2=1
				a2=JY.Wugong[wugong]["移动范围"..level]-1;
			end
		elseif kfkind==4 then
			m1=2
			if level>10 then
				m2=JY.Wugong[wugong]["移动范围"..10]-1;
				a1=7
				a2=1+math.modf(level/3)
				a3=a2
			else
				m2=JY.Wugong[wugong]["移动范围"..level]-1;
				a1=1
				a2=1+math.modf(level/3)
			end				
		end
	elseif fightscope==2 then
		m1=0
		m2=0
		if kfkind==3 then
			if level>10 then
				a1=6
				a2=JY.Wugong[wugong]["移动范围"..10];
			else
				a1=8--+math.random(2)
				a2=JY.Wugong[wugong]["移动范围"..level];
			end
		else
			if level>10 then
				if kfkind==1 then
					a1=5
					a2=JY.Wugong[wugong]["移动范围"..10]-1
					a3=a2-3;
				elseif kfkind==2 then
					a1=1
					a2=JY.Wugong[wugong]["移动范围"..10]-1
					a3=a2
				else
					a1=2
					a2=1+math.modf(JY.Wugong[wugong]["移动范围"..10]/2)
				end
			else
				a1=1
				a2=JY.Wugong[wugong]["移动范围"..level];
				a3=0
			end	
		end
	elseif fightscope==3 then
		m1=0
		a1=3
		if level>10 then
			m2=JY.Wugong[wugong]["移动范围"..10]+1;
			a2=JY.Wugong[wugong]["杀伤范围"..10]
			a3=a2
		else
			m2=JY.Wugong[wugong]["移动范围"..level];
			a2=JY.Wugong[wugong]["杀伤范围"..level];
		end
	end
	
	--return 2,1,10,a2,a3,a4,a5
	--return Rnd(4),Rnd(8),Rnd(13),Rnd(8),Rnd(8),Rnd(8),Rnd(8)
	return m1,m2,a1,a2,a3,a4,a5
end

function refw(wugong,level)
	local m1,m2,a1,a2,a3,a4,a5
	if JY.Wugong[wugong]["攻击范围"]==-1 then
		return JY.Wugong[wugong]["加内力1"],JY.Wugong[wugong]["加内力2"],
			JY.Wugong[wugong]["未知1"],JY.Wugong[wugong]["未知2"],
			JY.Wugong[wugong]["未知3"],JY.Wugong[wugong]["未知4"],JY.Wugong[wugong]["未知5"];
	end
    local fightscope=JY.Wugong[wugong]["攻击范围"];
	local kfkind=JY.Wugong[wugong]["武功类型"];
    local pid=WAR.Person[WAR.CurID]["人物编号"];
	if fightscope==0 then 
		if level>10 then
			m1=1
			m2=JY.Wugong[wugong]["移动范围"..10];
			a1=1
			a2=3
			a3=3
		else
			m1=0
			m2=JY.Wugong[wugong]["移动范围"..level];
			a1=1
			a2=math.modf(level/5)
			a3=math.modf(level/8)
		end
	elseif fightscope==1 then
		if kfkind==1 then
			a1=12
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["移动范围"..10];
				a2=JY.Wugong[wugong]["移动范围"..10]-1;
			else
				m1=2
				m2=1--JY.Wugong[wugong]["移动范围"..level];
				a2=JY.Wugong[wugong]["移动范围"..level]-1;
			end		
		elseif kfkind==2 then
			a1=10
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["移动范围"..10];
				a2=JY.Wugong[wugong]["移动范围"..10];
				a3=a2-1
				a4=a3-1
			else
				m1=2
				m2=1--JY.Wugong[wugong]["移动范围"..level];
				a2=JY.Wugong[wugong]["移动范围"..level];
				if level>7 then
					a3=a2-1
				end
			end
		elseif kfkind==3 then
			a1=11
			if level>10 then
				m1=3
				m2=1
				a2=JY.Wugong[wugong]["移动范围"..10]-1;
			else
				m1=2
				m2=1
				a2=JY.Wugong[wugong]["移动范围"..level]-1;
			end
		elseif kfkind==4 then
			m1=2
			if level>10 then
				m2=JY.Wugong[wugong]["移动范围"..10]-1;
				a1=7
				a2=1+math.modf(level/3)
				a3=a2
			else
				m2=JY.Wugong[wugong]["移动范围"..level]-1;
				a1=1
				a2=1+math.modf(level/3)
			end				
		end
	elseif fightscope==2 then
		m1=0
		m2=0
		if kfkind==3 then
			if level>10 then
				a1=6
				a2=JY.Wugong[wugong]["移动范围"..10];
			else
				a1=8--+math.random(2)
				a2=JY.Wugong[wugong]["移动范围"..level];
			end
		else
			if level>10 then
				if kfkind==1 then
					a1=5
					a2=JY.Wugong[wugong]["移动范围"..10]-1
					a3=a2-3;
				elseif kfkind==2 then
					a1=1
					a2=JY.Wugong[wugong]["移动范围"..10]-1
					a3=a2
				else
					a1=2
					a2=1+math.modf(JY.Wugong[wugong]["移动范围"..10]/2)
				end
			else
				a1=1
				a2=JY.Wugong[wugong]["移动范围"..level];
				a3=0
			end	
		end
	elseif fightscope==3 then
		m1=0
		a1=3
		if level>10 then
			m2=JY.Wugong[wugong]["移动范围"..10]+1;
			a2=JY.Wugong[wugong]["杀伤范围"..10]
			a3=a2
		else
			m2=JY.Wugong[wugong]["移动范围"..level];
			a2=JY.Wugong[wugong]["杀伤范围"..level];
		end
	end
	
	--return 2,1,10,a2,a3,a4,a5
	--return Rnd(4),Rnd(8),Rnd(13),Rnd(8),Rnd(8),Rnd(8),Rnd(8)
	return m1,m2,a1,a2,a3,a4,a5
end










      

