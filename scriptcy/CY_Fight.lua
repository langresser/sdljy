 
function WarSetGlobal()            --����ս��ȫ�̱���
    WAR={};

    WAR.Data={};              --ս����Ϣ��war.sta�ļ�

    WAR.SelectPerson={}            --����ѡ���ս��  0 δѡ��1 ѡ������ȡ����2 ѡ����ȡ����ѡ���չ�˲˵�����ʹ��

    WAR.Person={};                 --ս��������Ϣ
    for i=0,100-1 do
        WAR.Person[i]={};
        WAR.Person[i]["������"]=-1;
        WAR.Person[i]["�ҷ�"]=true;            --true �ҷ���false����
        WAR.Person[i]["����X"]=-1;
        WAR.Person[i]["����Y"]=-1;
        WAR.Person[i]["����"]=true;
        WAR.Person[i]["�˷���"]=-1;
        WAR.Person[i]["��ͼ"]=-1;
        WAR.Person[i]["��ͼ����"]=0;        --0 wmap����ͼ��1 fight***����ͼ
        WAR.Person[i]["�Ṧ"]=0;
        WAR.Person[i]["�ƶ�����"]=0;
        WAR.Person[i]["����"]=0;
        WAR.Person[i]["����"]=0;
        WAR.Person[i]["�Զ�ѡ�����"]=-1;     --�Զ�ս����ÿ����ѡ���ս������
		WAR.Person[i]["Status"]=0;
		WAR.Person[i]["Move"]={};
		WAR.Person[i]["Action"]={};
		WAR.Person[i]["Time"]=0;
		WAR.Person[i]["TimeAdd"]=0;
		WAR.Person[i]["SpdAdd"]=0;
		WAR.Person[i]["Point"]=0;
		WAR.Person[i][CC.TXDH]=-1;
		WAR.Person[i]["�����书"]=-1;
		WAR.Person[i][CC.TXWZ1]=nil;
		WAR.Person[i][CC.TXWZ2]=nil;
		WAR.Person[i][CC.TXWZ3]=nil;
   end

    WAR.PersonNum=0;               --ս���������

    WAR.AutoFight=0;               --�ҷ��Զ�ս������ 0 �ֶ���1 �Զ���

    WAR.CurID=-1; 	--��ǰ����ս����id

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

	WAR.ShowHead=0;                --�Ƿ���ʾͷ��

    WAR.Effect=0;              --Ч��������ȷ������ͷ�����ֵ���ɫ
	                           --2 ɱ���� , 3 ɱ����, 4 ҽ�� �� 5 �ö� �� 6 �ⶾ

    WAR.EffectColor={};      ---��������ͷ�����ֵ���ɫ
    WAR.EffectColor[2]=RGB(236, 200, 40);
    WAR.EffectColor[3]=RGB(112, 12, 112);
    WAR.EffectColor[4]=RGB(236, 200, 40);
    WAR.EffectColor[5]=RGB(96, 176, 64)
    WAR.EffectColor[6]=RGB(104, 192, 232);
	WAR.Delay=0;
	WAR.LifeNum=0;
	WAR.EffectXY=nil            --�����书Ч������������
	WAR.EffectXYNum=0;          --�������
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

function WarLoad(warid)              --����ս������
    WarSetGlobal();         --��ʼ��ս������
    local data=Byte.create(CC.WarDataSize);      --��ȡս������
    Byte.loadfile(data,CC.WarFile,warid*CC.WarDataSize,CC.WarDataSize);
    LoadData(WAR.Data,CC.WarData_S,data);
	WAR.ZDDH=warid
end

function WarMain(warid,isexp)           --ս��������
--ս��������
--warid  ս�����
--isexp  ����Ƿ��о��� 0 û���飬1 �о���
--����  true ս��ʤ����false ʧ��
    lib.Debug(string.format("war start. warid=%d",warid));		
    WarLoad(warid);
    WarSelectTeam();          --ѡ���ҷ�
    WarSelectEnemy();         --ѡ�����

    CleanMemory()
    lib.PicInit();
 	lib.ShowSlow(50,1) ;      --�����䰵

    WarLoadMap(WAR.Data["��ͼ"]);       --����ս����ͼ
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

	--������ͼ�ļ�
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
       WAR.Data["����"]=6
	end
	
	local mu=math.random(5)+49
	PlayMIDI(mu)--(WAR.Data["����"]);
	if WAR.ZDDH==238 then PlayMIDI(27) end
	if WAR.ZDDH==217 then PlayMIDI(55) end
	
    local first=0;            --��һ����ʾս�����
    local warStatus;          --ս��״̬
	
	
			  
	WarPersonSort();    --ս���˰��Ṧ����
	CleanWarMap(2,-1);
	for i=0,WAR.PersonNum-1 do
		if i==0 then
			WAR.Person[i]["����X"],WAR.Person[i]["����Y"]=WE_xy(WAR.Person[i]["����X"],WAR.Person[i]["����Y"])
		else
			WAR.Person[i]["����X"],WAR.Person[i]["����Y"]=WE_xy(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],0)
		end
        SetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],2,i);
        local pid=WAR.Person[i]["������"];
		lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[pid]["ͷ�����"]),
		                string.format(CC.FightPicFile[2],JY.Person[pid]["ͷ�����"]),
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
		if x>100 then return math.modf((x-100)/10+10+WAR.Person[0]["�Ṧ"]/10)
		else return math.modf(x/5+WAR.Person[0]["�Ṧ"]/10)
		end
	]]--
		return math.modf(1.5*(x/y+y-3))
	end
	
	--ս����ѭ�����ĳɰ뼴ʱ�ƣ���д
	--��������������˵ĳ�ʼ����ֵ
        for i=0,WAR.PersonNum-1 do
            WAR.Person[i]["��ͼ"]=WarCalPersonPic(i);
        end
		--WarPersonSort()

		WarSetPerson();     --����ս������λ��
	WAR.CurID=0
                    WarDrawMap(0);
					--DrawSMap(0)
	                lib.ShowSlow(50,0)
	for i=0,WAR.PersonNum-1 do
		WAR.Person[i]["Time"]=800-i*1000/WAR.PersonNum 
                if WAR.Person[i]["������"]==35 then --�����ж�
                   WAR.Person[i]["Time"]=999
                end 
                if WAR.Person[i]["������"]==79 then
				   local JF=0;
				   for i=1,10 do
						 if JY.Person[79]["�书"..i]<50 and JY.Person[79]["�书"..i]>26 then
							if JY.Person[79]["�书�ȼ�"..i]==999 then
							   JF=JF+1
							end
						 end
				   end
				   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+JF*50
				   if WAR.Person[i]["Time"]>990 then WAR.Person[i]["Time"]=990 end
				end				
				if WAR.Person[i]["������"]==97 then WAR.Person[i]["Time"]=900 end
                if JY.Person[WAR.Person[i]["������"]]["�Ա�"]==2 then WAR.Person[i]["Time"]=-200 end
				if WAR.Person[i]["������"]==36 then WAR.Person[i]["Time"]=700 end
				if WAR.Person[i]["������"]==445 and WAR.ZDDH==226 then WAR.Person[i]["Time"]=999 end
				if WAR.Person[i]["������"]==446 and WAR.ZDDH==226 then WAR.Person[i]["Time"]=900 end
				local id=WAR.Person[i]["������"];
				if PersonKF(id,93) then 
				   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+200+math.random(100)
		           if WAR.Person[i]["Time"]>990 then WAR.Person[i]["Time"]=990 end
				end
		WAR.Person[i]["�ƶ�����"]=math.modf(getnewmove(WAR.Person[i]["�Ṧ"])-JY.Person[id]["�ж��̶�"]/30-JY.Person[id]["���˳̶�"]/30+JY.Person[id]["����"]/30-3);
		if WAR.Person[i]["�ƶ�����"]<1 then WAR.Person[i]["�ƶ�����"]=1 end
	end
	JY.Person[445]["����"]=CC.WARS1
	JY.Person[446]["����"]=CC.WARS1
	if WAR.ZDDH==226 then
	   JY.Person[445]["����"]=CC.WARS2
	   JY.Person[446]["����"]=CC.WARS3
	end
   
	for a=0,WAR.PersonNum-1 do 
	    for s=1,4 do
		        if JY.Person[WAR.Person[a]["������"]]["Я����Ʒ����" .. s]<1 then
			       JY.Person[WAR.Person[a]["������"]]["Я����Ʒ" .. s]=-1
				end
		end
	end
	
	
    if WAR.ZDDH==14 then 
	   say(CC.s42,173,0) 
	   say(CC.s43,174,1) 
	   say(CC.s44,175,5)	   
	end 
	
	for a=0,WAR.PersonNum-1 do 
	    if WAR.Person[a]["������"]==92 and WAR.Person[a]["�ҷ�"]==true then 
		    WAR.LRZ=1 
			break;
		end
	end
	
	for i=1,10 do    
		JY.Wugong[80]["�ƶ���Χ"..i]=3
		JY.Wugong[80]["ɱ�˷�Χ"..i]=2
		JY.Wugong[113]["�ƶ���Χ"..i]=4
		JY.Wugong[113]["ɱ�˷�Χ"..i]=0
	end	
	JY.Wugong[80]["������Χ"]=0	 
	JY.Wugong[113]["������Χ"]=3
	
	if WAR.ZDDH==237 then  
	   for a=0,WAR.PersonNum-1 do 
			if WAR.Person[a]["�ҷ�"]==true then 
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
		--���ȸ���������Ŀ������ʱ��۵���ʾ�̶ȣ��Լ���ʱ���ȣ������ݲ����
		--Ȼ�����������ԣ���ȡÿ��ѭ�����ӵ�ʱ��ֵ������������Ϊ10
		--wardelay=getdelay(least)--+10
		--lib.Delay(wardelay)
		WarDrawMap(0);
		--DrawSMap(0)
		--��ʼ���ƽ����������
		WAR.ShowHead=0;
		DrawTimeBar();
		--warStatus=WAR_CALLEVENT(warid);
		--if warStatus~=0 then break end					--ս���¼����
		lib.GetKey()
		ShowScreen()
		
		if WAR.ZYHB==1 then 
		   WAR.ZYHB=2
		end
		if WAR.ZDDH==83 then JY.Person[50]["�书1"]=13 end	
		local reget=false
		for p=0,WAR.PersonNum-1 do
			if WAR.Person[p]["����"]==false then
				if WAR.Person[p]["Time"]>1000 then 
					WarDrawMap(0);
					ShowScreen();
					local surid=lib.SaveSur(CC.ScreenW-80,0,CC.ScreenW,200);
					
					lib.Delay(10)
					local keypress=lib.GetKey();
					if WAR.AutoFight==1 then                 --�ҷ��Զ�ս��ʱ��ȡ���̣����Ƿ�ȡ��
						if keypress==VK_SPACE or keypress==VK_RETURN then
							WAR.AutoFight=0;
						end
					end
					
					lib.FreeSur(surid)
					reget=true
					local id=WAR.Person[p]["������"];
                                     if WAR.ZYHB==2 then 
                                        WAR.Person[p]["�ƶ�����"]=0
                                     else
					WAR.Person[p]["�ƶ�����"]=math.modf(getnewmove(WAR.Person[p]["�Ṧ"])-JY.Person[id]["�ж��̶�"]/50-JY.Person[id]["���˳̶�"]/60+JY.Person[id]["����"]/70-1);
					
					for j=0,WAR.PersonNum-1 do
				        if WAR.Person[j]["������"]==66 then
						    if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[p]["�ҷ�"] then                            			   			                   
				                WAR.Person[p]["�ƶ�����"]=WAR.Person[p]["�ƶ�����"]-3
								break
						    end
						end
					end
					
					if WAR.Person[p]["�ƶ�����"]<1 then WAR.Person[p]["�ƶ�����"]=1 end					
					if id==35 or id==6 or id==97 then WAR.Person[p]["�ƶ�����"]=WAR.Person[p]["�ƶ�����"]+3 end
					if id==5 and WAR.Person[p]["�ƶ�����"]<8 then WAR.Person[p]["�ƶ�����"]=8 end
					if WAR.Person[p]["�ƶ�����"]>10 then WAR.Person[p]["�ƶ�����"]=10 end
                            
									 end
					WAR.ShowHead=0
					WarDrawMap(0);		
					WAR.Effect=0;
					WAR.CurID=p;
					WAR.Person[p]["TimeAdd"]=0;
					local r;
                                       
					local pid=WAR.Person[WAR.CurID]["������"]
					WAR.Defup[pid]=nil
					if pid==53 then WAR.TZ_DY=0 end
					--if WAR.Person[p]["�ҷ�"]==true then
					if instruct_16(pid) and WAR.Person[p]["�ҷ�"] and WAR.tmp[1000+pid]~=1 then
						if WAR.AutoFight==0 then
							r=War_Manual();                  --�ֶ�ս��
						else
							r=War_Auto();                  --�Զ�ս��
						end
					else
						r=War_Auto(); 						--�Զ�ս��
						
					end		
					
         if WAR.ZYHB==1 then
              for j=0,WAR.PersonNum-1 do	     
			      WAR.Person[j]["Time"]=WAR.Person[j]["Time"]-15
				  if WAR.Person[j]["Time"]>990 then WAR.Person[j]["Time"]=990 end
		      end
            WAR.Person[p]["Time"]=1005
			WAR.ZYYD=WAR.Person[p]["�ƶ�����"]
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
			
			if JY.Person[129]["����"]<=0 and WAR.WCY<1 then JY.Person[129]["����"]=1 end
			if JY.Person[65]["����"]<=0 and WAR.WCY<1 then JY.Person[65]["����"]=1 end
			   			
			if WAR.ZDDH==128 then
			    for i=0,WAR.PersonNum-1 do
			        if WAR.Person[i]["������"]==553 and JY.Person[553]["����"]<=0 then 
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
										   JY.Person[553]["�������ֵ"]=JY.Person[553]["�������ֵ"]+100
										   JY.Person[553]["�������ֵ"]=JY.Person[553]["�������ֵ"]+1000
										   JY.Person[553]["����"]=JY.Person[553]["�������ֵ"]
										   JY.Person[553]["����"]=JY.Person[553]["�������ֵ"]
										   JY.Person[553]["�ж��̶�"]=0
										   JY.Person[553]["���˳̶�"]=0
										   JY.Person[553]["����"]=100
	                                       JY.Person[553]["������"]=JY.Person[553]["������"]+100
										   JY.Person[553]["������"]=JY.Person[553]["������"]+100
										   JY.Person[553]["�Ṧ"]=JY.Person[553]["�Ṧ"]+80
										   JY.Person[553]["�书1"]=66
										   JY.Person[553]["�书�ȼ�1"]=999
										   for j=0,WAR.PersonNum-1 do
	                                            if WAR.Person[j]["������"]==553 then
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
	        WAR.Person[p]["Time"]=WAR.Person[p]["Time"]-1000;  --����
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
             if JY.Person[pid]["�书"..i]==96 and JY.Person[pid]["����"]>0 then
				 local LK             
				 LK=math.modf((JY.Person[pid]["�������ֵ"]-JY.Person[pid]["����"])*JY.Person[pid]["�书�ȼ�"..i]/100*0.015)
				 JY.Person[pid]["����"]=JY.Person[pid]["����"]+LK
				 DrawStrBox(-1,-1,CC.WARS9..LK,C_ORANGE,CC.DefaultFont)
				 ShowScreen();
				 lib.Delay(400);
				 Cls();
				 ShowScreen();
				 break
             end
         end   
        
          for i=1,10 do  
             if JY.Person[pid]["�书"..i]==89 then
             local NK            
             NK=math.modf((JY.Person[pid]["�������ֵ"]-JY.Person[pid]["����"])*JY.Person[pid]["�书�ȼ�"..i]/100*0.015)
			 JY.Person[pid]["����"]=JY.Person[pid]["����"]+NK
             DrawStrBox(-1,-1,CC.WARS10..NK,C_ORANGE,CC.DefaultFont)
             ShowScreen();
             lib.Delay(400);
             Cls();
             ShowScreen();
			 break
             end
          end 

		  for i=1,10 do  
             if JY.Person[pid]["�书"..i]==90 then
				 local TK;
				 local ZD=0;
				 TK=6
				 JY.Person[pid]["����"]=JY.Person[pid]["����"]+TK
					if JY.Person[pid]["����"]>100 then
					   JY.Person[pid]["����"]=100
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
                                            if JY.Person[id]["�书"..i]==47 then --�ж��Ž�
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
									
									if JY.Person[129]["����"]<=0 and WAR.WCY<1 then JY.Person[129]["����"]=1 end
			                        if JY.Person[65]["����"]<=0 and WAR.WCY<1 then JY.Person[65]["����"]=1 end
			   
									if WAR.ZDDH==128 then
										for i=0,WAR.PersonNum-1 do
											if WAR.Person[i]["������"]==553 and JY.Person[553]["����"]<=0 then 
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
										   JY.Person[553]["�������ֵ"]=JY.Person[553]["�������ֵ"]+100
										   JY.Person[553]["�������ֵ"]=JY.Person[553]["�������ֵ"]+1000
										   
										   JY.Person[553]["����"]=JY.Person[553]["�������ֵ"]
										   JY.Person[553]["����"]=JY.Person[553]["�������ֵ"]
										   JY.Person[553]["�ж��̶�"]=0
										   JY.Person[553]["���˳̶�"]=0
										   JY.Person[553]["����"]=100
	                                       JY.Person[553]["������"]=JY.Person[553]["������"]+100
										   JY.Person[553]["������"]=JY.Person[553]["������"]+100
										   JY.Person[553]["�Ṧ"]=JY.Person[553]["�Ṧ"]+80
										   JY.Person[553]["�书1"]=66
										   JY.Person[553]["�书�ȼ�1"]=999
                                            for j=0,WAR.PersonNum-1 do
	                                            if WAR.Person[j]["������"]==553 then
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
									
										if id==54 then JY.Person[id]["���˳̶�"]=0 end
										
										 JY.Wugong[13]["����"]=CC.WARS13 	
										
										if id==64 then WAR.ZBT=WAR.ZBT+1 end
									
										if WAR.TGN==1 then
										   say(CC.WARS14,72)
										    JY.Person[72]["������"]=JY.Person[72]["������"]+20
											JY.Person[72]["������"]=JY.Person[72]["������"]+20
											JY.Person[72]["�Ṧ"]=JY.Person[72]["�Ṧ"]+20
											JY.Person[72]["�书1"]=44
											JY.Person[72]["�书�ȼ�1"]=50
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
												   if WAR.Person[j]["������"]==58 and JY.Person[WAR.Person[j]["������"]]["����"]>0 and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then
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
												  if WAR.Person[j]["������"]==0 and JY.Person[0]["����"]>0 then													 
													 WAR.FLHS5=0
													 WAR.CurID=j
													 break
												  end
											end
											
											if WAR.FLHS5==0 and WAR.AutoFight==0 and WAR.tmp[1000+0]~=1 then
												WAR.Person[WAR.CurID]["�ƶ�����"]=6
												War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["�ƶ�����"],0);
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
				
				                        if (WAR.Person[p]["�ƶ�����"]>0 or WAR.ZYYD>0)  and WAR.Person[p]["�ҷ�"]==true and inteam(WAR.Person[p]["������"]) and WAR.AutoFight==0 and WAR.tmp[1000+id]~=1 then
										    if PersonKF(WAR.Person[p]["������"],93) and JY.Person[WAR.Person[p]["������"]]["����"]>0 then
				                              if WAR.ZYYD>0 then
											   WAR.Person[p]["�ƶ�����"]=WAR.ZYYD
											   War_CalMoveStep(p,WAR.ZYYD,0);
											   WAR.ZYYD=0
											  else
											   War_CalMoveStep(p,WAR.Person[p]["�ƶ�����"],0);
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
										        if WAR.Person[x]["������"]==97 and JY.Person[97]["����"]<=0 then
												    for xx=0,WAR.PersonNum-1 do
												        if WAR.Person[xx]["������"]~=97 then
														   WAR.Person[xx]["�ҷ�"]=true
														end
													end
													break
											    end
											end
										end
										
										if WAR.ZDDH==176 and JY.Person[0]["Ʒ��"]>80 and WAR.EVENT1==0 and WAR.SXTJ>300 then
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
										        if WAR.Person[i]["������"]==73 and WAR.Person[i]["�ҷ�"]==true then
												    if JY.Person[WAR.Person[i]["������"]]["����"]<=0 then
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
										
										local pz=math.modf(JY.Person[0]["����"]/5)
										if id==0 and GetS(4,5,5,5)==7 and JY.Person[0]["����"]>50 then
										    if WAR.HTSS==0 and GetS(10,0,7,0)==1 and JLSD(25,50+pz,0) and JY.Person[0]["�书10"]>0  then											       
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
												JY.Person[0]["����"]=JY.Person[0]["����"]-10
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
												if WAR.Person[i]["�ҷ�"]==false then
													WAR.Person[i]["����"]=true
												end
										    end
											say(CC.s48,18)
										end
										
										if WAR.ZDDH==238 then
										    local life=0;
										    for i=0,WAR.PersonNum-1 do
												if WAR.Person[i]["����"]==false then
												    if JY.Person[WAR.Person[i]["������"]]["����"]>0 then
													   life=life+1
													   WAR.NO1=WAR.Person[i]["������"]
													end
												end
										    end
											
										    if life>1 then
											    local m,n=0,0;
											    while m<1 or n<1 do
												    m=0;
													n=0;
												    for i=0,WAR.PersonNum-1 do
														if WAR.Person[i]["����"]==false and JY.Person[WAR.Person[i]["������"]]["����"]>0 then
															if WAR.Person[i]["������"]==0 then
																WAR.Person[i]["�ҷ�"]=true
																m=m+1
															else
																if math.random(2)==1 then
																   WAR.Person[i]["�ҷ�"]=true
																   m=m+1
																else
																   WAR.Person[i]["�ҷ�"]=false
																   n=n+1
																end
															end
														end
												    end
												end
											end
										end
														 
										
										
				
				end
				
				
					warStatus=War_isEnd();        --ս���Ƿ������   0������1Ӯ��2��	
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
		DrawStrBoxWaitKey(CC.EVB103..JY.Person[WAR.NO1]["����"],C_RED,CC.DefaultFont);
	    if WAR.NO1==0 then
		   r=true; 
        else
           r=false;
        end		   
	elseif warStatus==1 then--[[
		local str="ս��ʤ��"
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
		   AddPersonAttrib(0,"ȭ�ƹ���",10);
		   AddPersonAttrib(0,"��������",10);
		   AddPersonAttrib(0,"ˣ������",10);
		   AddPersonAttrib(0,"�������",10);
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
		   AddPersonAttrib(0,"ȭ�ƹ���",10);     
		elseif WAR.ZDDH==211 then
		   DrawStrBoxWaitKey(CC.EVB90,C_GOLD,CC.DefaultFont);
		   AddPersonAttrib(0,"������",10); 
		   AddPersonAttrib(0,"�Ṧ",10); 
		elseif WAR.ZDDH==86 then
		    instruct_2(66,1)
        end		   
		
        r=true;
    elseif warStatus==2 then--[[
		local str="ս��ʧ��"
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

    War_EndPersonData(isexp,warStatus);    --ս���������������

    lib.ShowSlow(50,1);

    if JY.Scene[JY.SubScene]["��������"]>=0 then
        PlayMIDI(JY.Scene[JY.SubScene]["��������"]);
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


function War_MoveMenu()           --ִ���ƶ��˵� ����1���Ѿ��ƶ�    0 û���ƶ�
  if WAR.Person[WAR.CurID]["������"]~=-1 then
    WAR.ShowHead=0;   --����ʾͷ��
    if WAR.Person[WAR.CurID]["�ƶ�����"]<=0 then
        return 0;
    end

    War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["�ƶ�����"],0);   --�����ƶ�����

    local r;
    local x,y=War_SelectMove()             --ѡ���ƶ�λ��
    if x ~=nil then            --��ֵ��ʾû��ѡ��esc�����ˣ��ǿ����ʾѡ����λ��
        War_MovePerson(x,y,1);    --�ƶ�����Ӧ��λ��
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
	     if WAR.Person[i]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and WAR.Person[i]["����"]==false then
            ydd[n]=i
			n=n+1
		 end
	end
	while true do --DFSY
	    local dx=ydd[math.random(n-1)];
		local DX=WAR.Person[dx]["����X"]
		local DY=WAR.Person[dx]["����Y"]
		local YDX={DX+1,DX-1,DX};
		local YDY={DY+1,DY-1,DY};
		local ZX=YDX[math.random(3)]
		local ZY=YDY[math.random(3)]
        if SceneCanPass(ZX,ZY) and GetWarMap(ZX,ZY,2)<0 then
		    SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1);
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1);
			WAR.Person[WAR.CurID]["����X"]=ZX
			WAR.Person[WAR.CurID]["����Y"]=ZY						
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID);
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,WAR.Person[WAR.CurID]["��ͼ"]);
            break;
		end
	end
	return 1;
  end	 		 
end

function War_CanMoveXY(x,y,flag)  --�����Ƿ����ͨ�����ж��ƶ�ʱʹ��
	if GetWarMap(x,y,1)>0 then    --��1��������
		return false
	end
	if flag==0 then
		if CC.WarWater[GetWarMap(x,y,0)]~=nil then          --ˮ�棬������
			return false
		end
		if GetWarMap(x,y,2)>=0 then    --����
			return false
		end
	end
	return true;
end

function War_SelectMove()              ---ѡ���ƶ�λ��
    local x0=WAR.Person[WAR.CurID]["����X"];
    local y0=WAR.Person[WAR.CurID]["����Y"];
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

function War_MovePerson(x,y,flag)            --�ƶ����ﵽλ��x,y
    local x1=x
    local y1=y
	flag=flag or 0;
    local movenum=GetWarMap(x,y,3);

    local movetable={};  --   ��¼ÿ���ƶ�
    for i=movenum,1,-1 do    --��Ŀ��λ�÷����ҵ���ʼλ�ã���Ϊ�ƶ��Ĵ���
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
	if movenum>WAR.Person[WAR.CurID]["�ƶ�����"] then
		movenum=WAR.Person[WAR.CurID]["�ƶ�����"]
		WAR.Person[WAR.CurID]["�ƶ�����"]=0
	else
		WAR.Person[WAR.CurID]["�ƶ�����"]=WAR.Person[WAR.CurID]["�ƶ�����"]-movenum;    --���ƶ�������С
	end
	
	--[[if flag==1 then
		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1);
		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1);

        WAR.Person[WAR.CurID]["����X"]=movetable[movenum].x;
        WAR.Person[WAR.CurID]["����Y"]=movetable[movenum].y;
        WAR.Person[WAR.CurID]["�˷���"]=movetable[movenum].direct;
        WAR.Person[WAR.CurID]["��ͼ"]=WarCalPersonPic(WAR.CurID);

		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID);
		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,WAR.Person[WAR.CurID]["��ͼ"]);
	end]]--
	
    for i=1,movenum do
        local t1=lib.GetTime();

		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1);
		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1);

        WAR.Person[WAR.CurID]["����X"]=movetable[i].x;
        WAR.Person[WAR.CurID]["����Y"]=movetable[i].y;
        WAR.Person[WAR.CurID]["�˷���"]=movetable[i].direct;
        WAR.Person[WAR.CurID]["��ͼ"]=WarCalPersonPic(WAR.CurID);

		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID);
		SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,WAR.Person[WAR.CurID]["��ͼ"]);

		WarDrawMap(0);
		ShowScreen();
        local t2=lib.GetTime();
		if i<movenum then
			if (t2-t1)< 2*CC.Frame then
				lib.Delay(2*CC.Frame-(t2-t1));
			end
		end
    end
	
	--[[SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1);
	SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1);
	WAR.Person[WAR.CurID]["����X"]=x1
    WAR.Person[WAR.CurID]["����Y"]=y1
	SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID);
	SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,WAR.Person[WAR.CurID]["��ͼ"]);
    ]]--
	
end

function War_CalMoveStep(id,stepmax,flag) --��ʾ�ƶ���Χ
--��д�ƶ���������Ҫ�Ǽ���zoc�����������е���ʱ���ƶ��������1	
--������ƶ�����
--id ս����id��
--stepmax �������
--flag=0  �ƶ�����Ʒ�����ƹ���1 �书���ö�ҽ�Ƶȣ������ǵ�·�� 	
	
	CleanWarMap(3,255);           --�������������������ƶ����ȶ���Ϊ255��

    local x=WAR.Person[id]["����X"];
    local y=WAR.Person[id]["����Y"];

	local steparray={};     --�����鱣���n�������ꡣ
	for i=0,stepmax do
	    steparray[i]={};
		steparray[i].bushu={};
        steparray[i].x={};
        steparray[i].y={};
	end

	SetWarMap(x,y,3,0);
    steparray[0].num=1;
	steparray[0].bushu[1]=stepmax;					--�����ƶ��Ĳ���
	steparray[0].x[1]=x;
	steparray[0].y[1]=y;
	War_FindNextStep(steparray,0,flag,id);

	return steparray;

end

function War_FindNextStep(steparray,step,flag,id)      --������һ�����ƶ�������
 --������ĺ�������   
	local num=0;
	local step1=step+1;
	local function fujinnum(tx,ty)
		if flag~=0 or id==nil then return 0 end
		local tnum=0
		local wofang=WAR.Person[id]["�ҷ�"]
		local tv;
		tv=GetWarMap(tx+1,ty,2);
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=9999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['������']]['�ȼ�']/10)
			end
		end
		tv=GetWarMap(tx-1,ty,2);
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['������']]['�ȼ�']/10)
			end
		end
		tv=GetWarMap(tx,ty+1,2);
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['������']]['�ȼ�']/10)
			end
		end
		tv=GetWarMap(tx,ty-1,2);
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=999--tnum+1+math.modf(JY.Person[WAR.Person[tv]['������']]['�ȼ�']/10)
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
	    if x+1<CC.WarWidth-1 then                        --��ǰ���������ڸ�
		    local v=GetWarMap(x+1,y,3);
			if v ==255 and War_CanMoveXY(x+1,y,flag)==true then
                num= num+1;
                steparray[step1].x[num]=x+1;
                steparray[step1].y[num]=y;
				SetWarMap(x+1,y,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x+1,y);
			end
		end

	    if x-1>0 then                        --��ǰ���������ڸ�
		    local v=GetWarMap(x-1,y,3);
			if v ==255 and War_CanMoveXY(x-1,y,flag)==true then
                 num=num+1;
                steparray[step1].x[num]=x-1;
                steparray[step1].y[num]=y;
				SetWarMap(x-1,y,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x-1,y);
			end
		end

	    if y+1<CC.WarHeight-1 then                        --��ǰ���������ڸ�
		    local v=GetWarMap(x,y+1,3);
			if v ==255 and War_CanMoveXY(x,y+1,flag)==true then
                 num= num+1;
                steparray[step1].x[num]=x;
                steparray[step1].y[num]=y+1;
				SetWarMap(x,y+1,3,step1);
				steparray[step1].bushu[num]=steparray[step].bushu[i]-fujinnum(x,y+1);
			end
		end

	    if y-1>0 then                        --��ǰ���������ڸ�
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
	--���Լ���һ�����򣬰Ѳ����͵ķź���
	--��������������Ļ���zoc��Ч���ͺܼ���������...
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

function War_realjl(ida,idb) --�������˾���
--��������֮���ʵ�ʾ���	
	if ida==nil then
		ida=WAR.CurID
	end
	
  	CleanWarMap(3,255);           --�������������������ƶ����ȶ���Ϊ255��

    local x=WAR.Person[ida]["����X"];
    local y=WAR.Person[ida]["����Y"];

	local steparray={};     --�����鱣���n�������ꡣ
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
	steparray[0].bushu[1]=0;					--�����ƶ��Ĳ���
	steparray[0].x[1]=x;
	steparray[0].y[1]=y;
	return War_FindNextStep1(steparray,0,ida,idb);
	--return steparray;

end

function War_FindNextStep1(steparray,step,id,idb)      --������һ�����ƶ�������
 --������ĺ�������   
	local num=0;
	local step1=step+1;
	
	    steparray[step1]={};
		steparray[step1].bushu={};
        steparray[step1].x={};
        steparray[step1].y={};
	
	local function fujinnum(tx,ty)
		local tnum=0
		local wofang=WAR.Person[id]["�ҷ�"]
		local tv;
		tv=GetWarMap(tx+1,ty,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["�ҷ�"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=tnum+1
			end
		end
		tv=GetWarMap(tx-1,ty,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["�ҷ�"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=tnum+1
			end
		end
		tv=GetWarMap(tx,ty+1,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["�ҷ�"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
				tnum=tnum+1
			end
		end
		tv=GetWarMap(tx,ty-1,2);
		if idb==nil then
			if tv~=-1 then
				if WAR.Person[tv]["�ҷ�"]~=wofang then
					return -1
				end
			end
		elseif tv==idb then
			return -1
		end
		if tv~=-1 then
			if WAR.Person[tv]["�ҷ�"]~=wofang then
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
	    if x+1<CC.WarWidth-1 then                        --��ǰ���������ڸ�
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

	    if x-1>0 then                        --��ǰ���������ڸ�
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

	    if y+1<CC.WarHeight-1 then                        --��ǰ���������ڸ�
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

	    if y-1>0 then                        --��ǰ���������ڸ�
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
--�õ������ߵ����������˵����λ�á�
--scope���Թ����ķ�Χ
--���� x,y������޷��ߵ�����λ�ã����ؿ�
	local num,x,y
	num,x,y=War_realjl(WAR.CurID)
	--lib.Debug(num..'|'..x..','..y)
	if num==-1 then 
		return --WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"]
	else
		return x,y
	end
end


function NewWARPersonZJ(id,dw,x,y,life,fx)
    WAR.Person[WAR.PersonNum]["������"]=id
	WAR.Person[WAR.PersonNum]["�ҷ�"]=dw;
    WAR.Person[WAR.PersonNum]["����X"]=x
    WAR.Person[WAR.PersonNum]["����Y"]=y
	WAR.Person[WAR.PersonNum]["����"]=life;
	WAR.Person[WAR.PersonNum]["�˷���"]=fx;
    WAR.Person[WAR.PersonNum]["��ͼ"]=WarCalPersonPic(WAR.PersonNum);
	lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[id]["ͷ�����"]),
						string.format(CC.FightPicFile[2],JY.Person[id]["ͷ�����"]),
						4+WAR.PersonNum)																									
    SetWarMap(x,y,2,WAR.PersonNum)
	SetWarMap(x,y,5,WAR.Person[WAR.PersonNum]["��ͼ"])
    WAR.PersonNum=WAR.PersonNum+1;
end	

function RealJL(id1,id2,len)
--�ж�����id֮��ľ��룬���С�ڵ���len�򷴻���
--���lenΪ���򷵻����˵ľ���
	len=len or 1	
	local x1,y1=WAR.Person[id1]["����X"],WAR.Person[id1]["����Y"]
	local x2,y2=WAR.Person[id2]["����X"],WAR.Person[id2]["����Y"]
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
		if WAR.Person[i]["����"]==false then
			WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]/xscal;
		end
	end]]
	while xunhuan do
		lib.LoadSur(surid,x1-(10+(x2-x1)/2),0)
		--lib.LoadSur(surid2,25,545)
		for i=0,WAR.PersonNum-1 do
		    local jqid=WAR.Person[i]["������"]	
			if WAR.Person[i]["����"]==false then			   
			   if WAR.FXDS[WAR.Person[i]["������"]]==nil then
				   if PersonKF(jqid,104)==false then--WAR.tmp[1000+WAR.Person[i]["������"]]~=1 then
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
							--if WAR.Person[i]["������"]~=60 then
							   --JY.Person[WAR.Person[i]["������"]]["����"]=JY.Person[WAR.Person[i]["������"]]["����"]-2-math.random(2)
							--else
							if jqid==60 then
								if JY.Thing[202][WZ7]==1 then
								   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+50
								else
								   WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+80
								end
							   --JY.Person[WAR.Person[i]["������"]]["����"]=JY.Person[WAR.Person[i]["������"]]["����"]
							else 
							    WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+30
							end
							if JY.Person[WAR.Person[i]["������"]]["����"]<20 then WAR.tmp[1000+jqid]=nil end					    
						 end
					   else
					      WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+WAR.Person[i]["TimeAdd"] 
			              if WAR.LQZ[jqid]==100 then WAR.Person[i]["Time"]=WAR.Person[i]["Time"]+WAR.Person[i]["TimeAdd"] end				   				   
				       end
				  end			   
			   else
			       WAR.FXDS[WAR.Person[i]["������"]]=WAR.FXDS[WAR.Person[i]["������"]]-1
				   if PersonKF(jqid,108) then WAR.FXDS[jqid]=WAR.FXDS[jqid]-1 end
				   if WAR.LQZ[jqid]==100 then WAR.FXDS[jqid]=WAR.FXDS[jqid]-1 end
				   if WAR.FXDS[WAR.Person[i]["������"]]<1 then WAR.FXDS[WAR.Person[i]["������"]]=nil end
			   end   
				
			   if PersonKF(jqid,106) and (JY.Person[jqid]["��������"]==1 or (jqid==0 and GetS(4,5,5,5)==5)) then
				  JY.Person[jqid]["����"]=JY.Person[jqid]["����"]+3+math.random(2)
				  if JY.Person[jqid]["����"]>JY.Person[jqid]["�������ֵ"] then
				    JY.Person[jqid]["����"]=JY.Person[jqid]["�������ֵ"]
				  end
			   end
				
			   if PersonKF(jqid,107) and (JY.Person[jqid]["��������"]==0 or (jqid==0 and GetS(4,5,5,5)==5)) then
				  JY.Person[jqid]["����"]=JY.Person[jqid]["����"]+2
				  if JY.Person[jqid]["����"]>JY.Person[jqid]["�������ֵ"] then
				    JY.Person[jqid]["����"]=JY.Person[jqid]["�������ֵ"]
				  end
			   end
			   
			   if jqid==0 and GetS(4,5,5,5)==7 then
			      AddPersonAttrib(jqid,"����",1);
				  if JLSD(25,75,jqid) then AddPersonAttrib(jqid,"���˳̶�",-1) end
				  AddPersonAttrib(jqid,"�ж��̶�",-1);
			   end
				
			   if WAR.LXZT[jqid]~=nil then
			      if inteam(jqid) then
			         JY.Person[jqid]["����"]=JY.Person[jqid]["����"]-math.random(3)-math.modf(JY.Person[jqid]["���˳̶�"]/15)
				  else
				     JY.Person[jqid]["����"]=JY.Person[jqid]["����"]-1-math.modf(JY.Person[jqid]["���˳̶�"]/51)
				  end
				  if JY.Person[jqid]["����"]<1 then JY.Person[jqid]["����"]=1 end
				  WAR.LXZT[jqid]=WAR.LXZT[jqid]-1
				  if PersonKF(jqid,100) then WAR.LXZT[jqid]=WAR.LXZT[jqid]-1 end
				  if WAR.LXZT[jqid]<1 then WAR.LXZT[jqid]=nil end
			   end
				
				if JY.Person[jqid]["���˳̶�"]>0 then
				   if PersonKF(jqid,92) then
				      if JY.Person[jqid]["���˳̶�"]>70 then
					     if JLSD(30,70,jqid) then
						    JY.Person[jqid]["���˳̶�"]=JY.Person[jqid]["���˳̶�"]-1
					     end
					  elseif JY.Person[jqid]["���˳̶�"]>40 then
				         if JLSD(15,85,jqid) then
						    JY.Person[jqid]["���˳̶�"]=JY.Person[jqid]["���˳̶�"]-1
					     end
				      else				         
						    JY.Person[jqid]["���˳̶�"]=JY.Person[jqid]["���˳̶�"]-1					     
					  end				      
				   end
				end
				
				if JY.Person[jqid]["�ж��̶�"]>0 then
				   if PersonKF(jqid,99) then
				       if JY.Person[jqid]["�ж��̶�"]>70 then
					     if JLSD(30,70,jqid) then
						    JY.Person[jqid]["�ж��̶�"]=JY.Person[jqid]["�ж��̶�"]-1
					     end
					   elseif JY.Person[jqid]["�ж��̶�"]>40 then
				         if JLSD(15,85,jqid) then
						    JY.Person[jqid]["�ж��̶�"]=JY.Person[jqid]["�ж��̶�"]-1
					     end
				       else				         
						    JY.Person[jqid]["�ж��̶�"]=JY.Person[jqid]["�ж��̶�"]-1					     
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
				        if WAR.Person[d]["�ҷ�"]==false then
						    --WAR.Person[d]["����"]=true
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
		if WAR.Person[i]["����"]==false then
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
			if WAR.Person[i]["����"]==false then			   
				if WAR.Person[i]["TimeAdd"]<0 then
				    draw=true;				    
    	            --DrawStrBoxWaitKey(JY.Person[WAR.Person[i]["������"]]["���˳̶�"],C_GOLD,30)
					WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+10;
					if WAR.Person[i]["Time"]>-500 then
						WAR.Person[i]["Time"]=WAR.Person[i]["Time"]-10;						
				    else
					    if JY.Person[WAR.Person[i]["������"]]["���˳̶�"]<100 then
						   if inteam(WAR.Person[i]["������"]) then
						      JY.Person[WAR.Person[i]["������"]]["���˳̶�"]=JY.Person[WAR.Person[i]["������"]]["���˳̶�"]+Rnd(2)+1	
						   else
						      JY.Person[WAR.Person[i]["������"]]["���˳̶�"]=JY.Person[WAR.Person[i]["������"]]["���˳̶�"]+Rnd(2)
						   end
						end 
						if JY.Person[WAR.Person[i]["������"]]["���˳̶�"]>100 then JY.Person[WAR.Person[i]["������"]]["���˳̶�"]=100 end
						if PersonKF(WAR.Person[i]["������"],100) then JY.Person[WAR.Person[i]["������"]]["���˳̶�"]=0 end					
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
		if not WAR.Person[i]["����"] then
			--if WAR.Person[i]["Time"]>least then
				--local cx=x1+math.modf((WAR.Person[i]["Time"]-least)*(x2-x1)/(1000-least));
				local cx=x1+math.modf(WAR.Person[i]["Time"]/4);
				
				local color=C_WHITE;
				if WAR.Person[i]["TimeAdd"]<5 then
					color=C_ORANGE;
				end				
				if WAR.Person[i]["�ҷ�"] then
					--lib.FillColor(cx-1,CC.FontSmall*4,cx+1,CC.FontSmall*5-2,C_WHITE);
					--if WAR.FXDS[WAR.Person[i]["������"]]==nil then
					   drawname(cx,0,JY.Person[WAR.Person[i]["������"]]["����"],CC.FontSmall,color)
					   --drawname(cx,0,WAR.Person[i]["Time"],CC.FontSmall,color)
					--else
					   --drawname(cx,0,"��",CC.FontSmall,color)
					--end
					local w,h=lib.PicGetXY(99,JY.Person[WAR.Person[i]["������"]]["ͷ�����"]*2);
					if WAR.Person[i]["������"]==0 then
					   if GetS(4,5,5,5)<8 then
					      lib.PicLoadCache(99,(280+GetS(4,5,5,5))*2,cx-w/2,y-h-4,1,0);
					   else  
						  lib.PicLoadCache(99,(287+GetS(4,5,5,4))*2,cx-w/2,y-h-4,1,0);
					   end
					else   
					   lib.PicLoadCache(99,JY.Person[WAR.Person[i]["������"]]["ͷ�����"]*2,cx-w/2,y-h-4,1,0);
				    end
					if WAR.JQSDXS[WAR.Person[i]["������"]]~=nil then
					    if WAR.JQSD_WMM==1 then
					       DrawString(cx-w/2+2,y-h-4+18,WAR.JQSDXS[WAR.Person[i]["������"]],C_GOLD,15)
					    end
					end
				else
					--lib.FillColor(cx-1,CC.FontSmall*5+2,cx+1,CC.FontSmall*6,C_WHITE);
					local w,h=lib.PicGetXY(99,JY.Person[WAR.Person[i]["������"]]["ͷ�����"]*2);
					if WAR.Person[i]["������"]==0 then
					   if GetS(4,5,5,5)<8 then
					      lib.PicLoadCache(99,(280+GetS(4,5,5,5))*2,cx-w/2,y+6,1,0);
					   else  
						  lib.PicLoadCache(99,(287+GetS(4,5,5,4))*2,cx-w/2,y+6,1,0);
					   end
					else   
					   lib.PicLoadCache(99,JY.Person[WAR.Person[i]["������"]]["ͷ�����"]*2,cx-w/2,y+6,1,0);
				    end
					if WAR.JQSDXS[WAR.Person[i]["������"]]~=nil then
					    if WAR.JQSD_WMM==1 then
					       DrawString(cx-w/2+2,y+6+18,WAR.JQSDXS[WAR.Person[i]["������"]],C_GOLD,15)
					    end
					end
					--lib.PicLoadCache(99,JY.Person[WAR.Person[i]["������"]]["ͷ�����"]*2,cx-w/2,y+6,1,0);
					--if WAR.FXDS[WAR.Person[i]["������"]]==nil then					   
					   --if WAR.LQZ[WAR.Person[i]["������"]]~=nil then
					   --drawname(cx,y+32,WAR.LQZ[WAR.Person[i]["������"]],CC.FontSmall,color)							       
					   --else
					   drawname(cx,y+32,JY.Person[WAR.Person[i]["������"]]["����"],CC.FontSmall,color)
                       --drawname(cx,y+32,WAR.Person[i]["Time"],CC.FontSmall,color) 					   
					   --end
					--else
					   --drawname(cx,y+32,"��",CC.FontSmall,color)
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
				DrawString(x1-(10+(x2-x1)/2),y*2+15,string.format("��:%3d ��:%4d ��:%2d ��:%2d ��:%2d",w["����"],w["����"],w["���˳̶�"],wfx,wlx),C_WHITE,24)
				]]
				DrawString(x2+10,y-23,CC.s39,C_WHITE,15)
				DrawString(x2+10,y-3,WAR.SXTJ,C_GOLD,20)
				--local pid=WAR.Person[i]["������"]
				local hp=math.modf(JY.Person[0]["����"]*320/JY.Person[0]["�������ֵ"])
                local mp=math.modf(JY.Person[0]["����"]*320/JY.Person[0]["�������ֵ"])
				local zt1=math.modf(JY.Person[0]["���˳̶�"]*100/100)
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
				     if WAR.Person[t]["������"]==0 and WAR.Person[t]["����"]==false then
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
					DrawString(A+2,B+1,"����",C_GOLD,8)
					DrawBox_1(A,B+10,A+320,B+20,C_ORANGE) 
					lib.Background(A,B+10,A+mp-1,B+20,50,C_ORANGE)
					DrawString(A+2,B+11,"����",C_GOLD,8)
					DrawBox_1(A,B+20,A+100,B+30,C_RED) 
					lib.Background(A,B+20,A+zt1-1,B+30,50,C_RED)
					DrawString(A+2,B+21,"����",C_GOLD,8)
					DrawBox_1(A+110,B+20,A+210,B+30,C_ORANGE) 
					lib.Background(A+110,B+20,A+110+zt2-1,B+30,50,C_ORANGE)
					DrawString(A+2+110,B+21,"��Ѩ",C_GOLD,8)
					DrawBox_1(A+220,B+20,A+320,B+30,C_RED) 
					lib.Background(A+220,B+20,A+220+zt3-1,B+30,50,C_RED)
					DrawString(A+2+220,B+21,"��Ѫ",C_GOLD,8)
				end
				if my~=nil and JY.WGLVXS==1 then
				   --DrawString(10,CC.ScreenH-20,WAR.Person[my]["����X"].."  "..WAR.Person[my]["����Y"],C_WHITE,20)
				end
				--DrawBox_1(A,B,A+160,B+20,C_RED) 
				--lib.FillColor(A,B,A+hp,B+20,C_RED)
				--lib.Background(A,B,A+hp,B+20,100,C_RED)
				--DrawString(A+10,B+2,"����",C_GOLD,15)
				--lib.PicLoadCache(99,0,A+160,B-5,1,0);
				--DrawBox_1(A+185,B,A+345,B+20,C_ORANGE) 
				--lib.FillColor(A+185+(160-mp),B,A+160+185,B+20,C_ORANGE)
				--lib.Background(A+185+(160-mp),B,A+160+185,B+20,100,C_ORANGE)
				--DrawString(A+305,B+2,"����",C_GOLD,15)
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
		local kfid=JY.Person[id]["�书"..i]
		if kfid~=nil and kfid>0 then
				menu[i][1]=JY.Wugong[kfid]["����"].."��"..JY.Person[id]["�书�ȼ�"..i]
				menu[i][3]=1;
		end
	end
    return ShowMenu(menu,CC.Kungfunum,0,x,y,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);	
end

function WarDrawMap(flag,v1,v2,v3,v4)
--��ս����ͼ
--flag==0 ����
--      1 ��ʾ�ƶ�·�� (v1,v2) ��ǰ�ƶ�λ��
--      2 ��������书��ҽ�Ƶȣ���һ����ɫ��ʾ
--      4 ս������, v1 ս������pic, v2ս��������ͼ����(0 ʹ��ս��������ͼ��4��fight***��ͼ��� v3 �书Ч����ͼ -1û��Ч��

    local x=WAR.Person[WAR.CurID]["����X"];
    local y=WAR.Person[WAR.CurID]["����Y"];
	v4=v4 or JY.SubScene
    if flag==0 then
	    lib.DrawWarMap(0,x,y,0,0,-1,v4);
    elseif flag==1 then
		if JY.SubScene==0 or JY.SubScene==2 or JY.SubScene==3 or JY.SubScene==4 or JY.SubScene==39 then     --ѩ�ص�ͼ�ú�ɫ����
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

function WarShowHead(id)               --��ʾս����ͷ��
	id=id or WAR.CurID
	if id<0 then return end
    local pid=WAR.Person[id]["������"];
	local p=JY.Person[pid];

	local h=16+2;
    local width=160+2*CC.MenuBorderPixel;
	local height=160+2*CC.MenuBorderPixel+4*h;
	local x1,y1;
	local i=1;
    if WAR.Person[id]["�ҷ�"]==true then
	    x1=CC.ScreenW-width-10;
        y1=CC.ScreenH-height-10;
    else
	    x1=10;
        y1=10;
    end

    DrawBox(x1,y1,x1+width,y1+height,C_WHITE);
	local headw,headh=lib.PicGetXY(1,p["ͷ�����"]*2);
    local headx=(160-headw)/2;
	local heady=(100-headh)/2;
	if pid==0 then
	    if GetS(4,5,5,5)<8 then
	      lib.PicLoadCache(1,(280+GetS(4,5,5,5))*2,x1+5+headx,y1+5+heady,1);
	    else
		  lib.PicLoadCache(1,(287+GetS(4,5,5,4))*2,x1+5+headx,y1+5+heady,1);
	    end
	else	
	    lib.PicLoadCache(1,p["ͷ�����"]*2,x1+5+headx,y1+5+heady,1);
	end
	x1=x1+5
	y1=y1+5+100;
	local color;
	if p["���˳̶�"]<p["�ж��̶�"] then
		if p["�ж��̶�"]==0 then
			color =RGB(252,148,16);
		elseif p["�ж��̶�"]<50 then
			color=RGB(120,208,88);
		else
			color=RGB(56,136,36);
		end
	else
		if p["���˳̶�"]<33 then
			color =RGB(236,200,40);
		elseif p["���˳̶�"]<66 then
			color=RGB(244,128,32);
		else
			color=RGB(232,32,44);
		end	
	end
    MyDrawString(x1,x1+160,y1+5,p["����"],color,32);
	y1=y1+42
	
local hp=math.modf(JY.Person[pid]["����"]*160/JY.Person[pid]["�������ֵ"])
local mp=math.modf(JY.Person[pid]["����"]*160/JY.Person[pid]["�������ֵ"])
local tp=math.modf(JY.Person[pid]["����"]*160/100)
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

    DrawString(x1+10,y1+5,"��",C_WHITE,16);
    DrawString(x1+10,y1+35,"��",C_WHITE,16);
    DrawString(x1+10,y1+65,"��",C_WHITE,16);

    local lifexs=0;
	local nlxs=JY.Person[WAR.Person[id]["������"]]["����"]
	local tlxs=JY.Person[WAR.Person[id]["������"]]["����"]
	
	if inteam(WAR.Person[id]["������"]) or pid==0 then
	    lifexs=JY.Person[WAR.Person[id]["������"]]["����"]
	else    
		lifexs=JY.Person[WAR.Person[id]["������"]]["����"]*2
	end
	DrawString(x1+10+18,y1+5,lifexs,C_WHITE,16);
	DrawString(x1+10+18,y1+35,nlxs,C_WHITE,16);
	DrawString(x1+10+18,y1+65,tlxs,C_WHITE,16);
	
	if WAR.Person[id]["�ҷ�"]==false then--and JY.WGLVXS==1 then
	   DrawBox(x1-5,y1+95,x1+width-5,y1+220,C_WHITE);
	   local hl=1;
	   for i=1,4 do
	        local wp=JY.Person[WAR.Person[id]["������"]]["Я����Ʒ"..i]
	        local wps=JY.Person[WAR.Person[id]["������"]]["Я����Ʒ����"..i]        
			if wp>=0 then
			    local wpm=JY.Thing[wp]["����"]
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
		if not WAR.Person[i]['����'] then
			local id=WAR.Person[i]['������']
			local nsyxjq=0;--JY.Person[id]["���˳̶�"]
			if inteam(id) then
			    nsyxjq=math.modf(JY.Person[id]["���˳̶�"]/10);
			else
                nsyxjq=math.modf(JY.Person[id]["���˳̶�"]/25);
            end				
			WAR.Person[i]["TimeAdd"]=math.modf(getnewmove(WAR.Person[i]["�Ṧ"],inteam(id))+getnewmove1(JY.Person[id]["����"],JY.Person[id]["�������ֵ"],inteam(id))-JY.Person[id]["�ж��̶�"]/25-nsyxjq+JY.Person[id]["����"]/30+5)
			for ii=1,10 do
			    if JY.Person[id]["�书"..ii]==105 then
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
	                if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[i]["�ҷ�"] then                            			   			                   
		               WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]-4
					end
			   end
			end
			if GetS(4,5,5,5)==2 and id==0 then
			   local jsyx=0;
				for i=1,10 do
					if JY.Person[0]["�书"..i]==110 or (JY.Person[0]["�书"..i]<50 and JY.Person[0]["�书"..i]>26) then
						if JY.Person[0]["�书�ȼ�"..i]==999 then
						   jsyx=jsyx+1
						end
					end
				end
				WAR.Person[i]["TimeAdd"]=math.modf(WAR.Person[i]["TimeAdd"]*(1+0.05*jsyx)) 
			end
			if id==55 then
			   local xz=0;
			   for j=0,WAR.PersonNum-1 do
	                if WAR.Person[j]["����"]==true and WAR.Person[j]["�ҷ�"]==WAR.Person[i]["�ҷ�"] then                            			   			                   
		               WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+3
					end
			   end
			end
			if WAR.ZDDH==14 then
			    if id==173 or id==174 or id==175 then
			      local shz=0;
				    for j=0,WAR.PersonNum-1 do
	                   if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[i]["�ҷ�"] then                            			   			                   
		                  shz=shz+1
					   end
				    end
					if shz==3 then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]+20 end
				end  				
			end	
			if id==0 and WAR.LRZ==1 then
			    for j=0,WAR.PersonNum-1 do
	                    if WAR.Person[j]["������"]==92 and WAR.Person[j]["����"]==false then                        			   			                   
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
			--if inteam(id) then WAR.Person[i]["TimeAdd"]=WAR.Person[i]["TimeAdd"]-math.modf(JY.Person[id]["���˳̶�"]/20) end
			if WAR.Person[i]["TimeAdd"]<5 then WAR.Person[i]["TimeAdd"]=5 end
            if (id==445 or id==446) and WAR.ZDDH==226 then WAR.Person[i]["TimeAdd"]=0 end 			
			if JY.ZJSL==1 and (not inteam(id)) and WAR.Person[i]["�ҷ�"]==false then WAR.Person[i]["TimeAdd"]=0 end --DJQ0			
			if WAR.Person[i]["TimeAdd"]>60 then WAR.Person[i]["TimeAdd"]=60 end	
			WAR.JQSDXS[id]=WAR.Person[i]["TimeAdd"]
			if WAR.LQZ[id]==100 then WAR.JQSDXS[id]=WAR.Person[i]["TimeAdd"]*2 end
			num=num+1
			total=total+WAR.Person[i]["TimeAdd"]			
		end
	end
	WAR.JQSD_WMM=0;
	for i=0,WAR.PersonNum-1 do
	    local p=WAR.Person[i]["������"]
	    if p==76 and inteam(p) and WAR.Person[i]["����"]==false then
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
	say('�Ҫ����������',56)
	if not DrawStrBoxYesNo(-1,-1,'Ҫ����������',C_WHITE,CC.DefaultFont) then
		return
	end
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]['�ҷ�'] then
			WAR.CurID=i
			WAR.ShowHead=1
			War_CalMoveStep(WAR.CurID,math.modf(JY.Person[56]['�ȼ�']/3-4),0);
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

function War_PersonLostLife(i)             --����ս����ÿ�غ������ж������˶���Ѫ
    
        local pid=WAR.Person[i]["������"]
        if WAR.Person[i]["����"]==false then
            if JY.Person[pid]["���˳̶�"]>0 then
                local dec=math.modf(JY.Person[pid]["���˳̶�"]/20);
                AddPersonAttrib(pid,"����",-dec);
            end
            if JY.Person[pid]["�ж��̶�"]>0 then
                --local dec=math.modf(JY.Person[pid]["�ж��̶�"]/10);
                local dec=math.modf(JY.Person[pid]["�ж��̶�"]/3);          --�˴��޸�
                AddPersonAttrib(pid,"����",-dec);
            end
            if JY.Person[pid]["����"]<=0 then
                JY.Person[pid]["����"]=1;
            end
        end
    
end

function War_EndPersonData(isexp,warStatus)            --ս���Ժ������������
--�з���Ա�����ָ�
    for i=0,WAR.PersonNum-1 do
        local pid=WAR.Person[i]["������"]
        if not instruct_16(pid) then
            JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"];
            JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"];
            JY.Person[pid]["����"]=CC.PersonAttribMax["����"];
            JY.Person[pid]["���˳̶�"]=0;
            JY.Person[pid]["�ж��̶�"]=0;
        end
    end

    --�ҷ���Ա�����ָ�����Ӯ����
    for i=0,WAR.PersonNum-1 do
        local pid=WAR.Person[i]["������"]
        if instruct_16(pid) then
			if warStatus==1 then
				JY.Person[pid]["����"]=JY.Person[pid]["����"]+math.modf((JY.Person[pid]["�������ֵ"]-JY.Person[pid]["����"])*0.3)
				JY.Person[pid]["����"]=JY.Person[pid]["����"]+math.modf((JY.Person[pid]["�������ֵ"]-JY.Person[pid]["����"])*0.3)
				JY.Person[pid]["����"]=JY.Person[pid]["����"]+math.modf((100-JY.Person[pid]["����"])*0.3)
				JY.Person[pid]["���˳̶�"]=math.modf(JY.Person[pid]["���˳̶�"]/2)
				JY.Person[pid]["�ж��̶�"]=math.modf(JY.Person[pid]["�ж��̶�"]/2)
			else
				if JY.Person[pid]["����"]<JY.Person[pid]["�������ֵ"]/4 then
					JY.Person[pid]["����"]=math.modf(JY.Person[pid]["�������ֵ"]/4);
				end
				if JY.Person[pid]["����"]<10 then
					JY.Person[pid]["����"]=10 ;
				end				
			end
        end
    end
    
	JY.Person[50]["�书1"]=26 
	JY.Wugong[13]["����"]="����" 
	 
	if WAR.ZDDH==82 then SetS(10,0,18,0,1) end	   
	if WAR.ZDDH==217 and warStatus==1 then SetS(10,0,16,0,1) end
	if WAR.ZDDH==44 then
       	instruct_3(55,6,1,0,0,0,0,-2,-2,-2,0,-2,-2)
		instruct_3(55,7,1,0,0,0,0,-2,-2,-2,0,-2,-2)
	end
	if WAR.ZDDH==45 then instruct_3(55,9,1,0,0,0,0,-2,-2,-2,0,-2,-2) end
	if WAR.ZDDH==46 then instruct_3(55,13,0,0,0,0,0,-2,-2,-2,0,-2,-2) end  
	
	--[[for i=0,190 do
	      if JY.Person[i]["����"]~=i then
		     say(CC.EXITSAY)
			 JY.Status=GANE_END
		  end
	end]]
	
    if warStatus==2 and isexp==0 then  --�䣬û�о��飬�˳�
        return ;
    end

    local liveNum=0;          --�����ҷ����ŵ�����
    for i=0,WAR.PersonNum-1 do
        if WAR.Person[i]["�ҷ�"]==true and JY.Person[WAR.Person[i]["������"]]["����"]>0  then
            liveNum=liveNum+1;
        end
    end
    local canyu=false;
    --����ս������---�������飬ս�������е�
    if warStatus==1 then     --Ӯ�˲���
	  if WAR.Data["����"]<1000 then WAR.Data["����"]=1000 end
	  --if WAR.Data["����"]==226 then WAR.Data["����"]=10000 end
        for i=0,WAR.PersonNum-1 do
            local pid=WAR.Person[i]["������"]
            if WAR.Person[i]["�ҷ�"]==true and inteam(pid) then
                if JY.Person[pid]["����"]>0 then
					if pid==0 then
						canyu=true;
					end
					for ii=1,10 do
					   if JY.Person[pid]["�书"..ii]==98 then
                          WAR.Person[i]["����"]=WAR.Person[i]["����"] + math.modf(WAR.Data["����"]*1.5/liveNum);
					   end
					end     
					      WAR.Person[i]["����"]=WAR.Person[i]["����"] + math.modf(WAR.Data["����"]/liveNum)
					
                end
            end
        end
    end


    --ÿ���˾������ӣ��Լ����� XLDS
    for i=0,WAR.PersonNum-1 do
        local pid=WAR.Person[i]["������"];
        AddPersonAttrib(pid,"��Ʒ��������",math.modf(WAR.Person[i]["����"]*8/10));
        AddPersonAttrib(pid,"��������",math.modf(WAR.Person[i]["����"]*8/10));
        if JY.Person[pid]["��������"]<0 then JY.Person[pid]["��������"]=0 end
	  
        if WAR.Person[i]["�ҷ�"]==true and inteam(pid) then

            DrawStrBoxWaitKey( string.format(CC.WARS124,JY.Person[pid]["����"],WAR.Person[i]["����"]),C_WHITE,CC.DefaultFont);
			AddPersonAttrib(pid,"����",math.modf(WAR.Person[i]["����"]/2));

			local r=War_AddPersonLVUP(pid);     --��������

			if r==true then
				DrawStrBoxWaitKey( string.format(CC.WARS125,JY.Person[pid]["����"]),C_WHITE,CC.DefaultFont);
			end
		else			
			AddPersonAttrib(pid,"����",WAR.Person[i]["����"]);
        end

        War_PersonTrainBook(pid);            --�����ؼ�
        War_PersonTrainDrug(pid);            --����ҩƷ
    end
	--[[if warStatus==1 and canyu and JY.Person[0]["����"]==60000 and JY.Person[0]["�书1"]<109 and JY.Person[0]["�书7"]>0 then
		CreatKf(WAR.Data["����"]/100);
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

function War_AddPersonLVUP(pid)      --�����Ƿ����� Level
--�����Ƿ�����
--pid ��id
--���� true ������false������
    local tmplevel=JY.Person[pid]["�ȼ�"];
    if tmplevel>=CC.Level then     --���𵽶�
        return false;
    end

    if JY.Person[pid]["����"]<CC.Exp[tmplevel] then     --���鲻������
        return false
    end

    while true do          --�жϿ���������
        if tmplevel >= CC.Level then
            break;
        end
        if JY.Person[pid]["����"]>=CC.Exp[tmplevel] then
			--JY.Person[pid]["����"]=JY.Person[pid]["����"]-CC.Exp[tmplevel]
            tmplevel=tmplevel+1;
        else
            break;
        end
    end
    local leveladd=tmplevel-JY.Person[pid]["�ȼ�"];   --��������
    JY.Person[pid]["�ȼ�"]=JY.Person[pid]["�ȼ�"]+leveladd;
    AddPersonAttrib(pid,"�������ֵ", (JY.Person[pid]["��������"]+Rnd(3))*leveladd*3);
    JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"];
    JY.Person[pid]["����"]=CC.PersonAttribMax["����"];
    JY.Person[pid]["���˳̶�"]=0;
    JY.Person[pid]["�ж��̶�"]=0;

    local function cleveradd()
		local ca
		local rndnum;
		if CC.Debug then
			rndnum=math.random(1);
		else
			rndnum=math.random(1);
		end
		--if JY.Person[pid]["����"]>100 then JY.Person[pid]["����"]=100 end
		--ca=JY.Person[pid]["����"]+Rnd(120-JY.Person[pid]["����"]);
		ca=JY.Person[pid]["����"]/(rndnum+4);
		--ca=ca/7
		return ca
	end
	
	local function mymodf(x)
		local x1=math.modf(x)
		if math.random()<x-x1 then return x1
		else return x1 end
	end
	--[[
    if JY.Person[pid]["����"]<30 then
        cleveradd=1+Rnd(15);
    elseif JY.Person[pid]["����"]<50 then
        cleveradd=2+Rnd(6);
    elseif JY.Person[pid]["����"]<70 then
        cleveradd=3+Rnd(5);
    elseif JY.Person[pid]["����"]<90 then
        cleveradd=4+Rnd(4);
    else
        cleveradd=5+Rnd(3);
    end
	]]--
    --cleveradd=Rnd(cleveradd)+1;        --�������ʼ���������㣬Խ����������Խ�࣬����������Խ�١�
	local theadd=cleveradd()
    AddPersonAttrib(pid,"�������ֵ",  math.modf(leveladd*((10-JY.Person[pid]["��������"])*7+210/(theadd+1))));   --�����˲�������
    if pid==0 and GetS(4,5,5,5)==5 then
	   AddPersonAttrib(pid,"�������ֵ",50*leveladd)
	end
	JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"];

	--local totaladd=3*leveladd;
        
	for i=1,leveladd do	
		local ups=math.modf((JY.Person[pid]["����"]-1)/15)+1;

			if pid==35 and GetD(82,1,0)==1 then  --TLV
			   ups=3
			end
		
			if pid==55 and JY.Person[pid]["�ȼ�"]>20 then
			   ups=6
			end
			
			if T1LEQ(pid) then ups=8 end
			
		if JY.Thing[202][WZ7]==2 then ups=ups+1 end
		if JY.Thing[202][WZ7]==3 then ups=ups+2 end
		
        AddPersonAttrib(pid,"������",ups);
        AddPersonAttrib(pid,"������",ups);
        AddPersonAttrib(pid,"�Ṧ",ups);
		
		local a1=JY.Person[pid]['������'];
		local a2=JY.Person[pid]['������'];
		local a3=JY.Person[pid]['�Ṧ'];
		local a4='������'
		
		if a2>=a1 and a2>=a3 then a4='������' end
		if a3>=a2 and a3>=a1 then a4='�Ṧ' end
		
		AddPersonAttrib(pid,a4,1);
		
		if JY.Thing[202][WZ7]>1 then
			local ran=math.random(3);
			if ran==1 then
			   AddPersonAttrib(pid,"������",1);
			elseif ran==2 then
			   AddPersonAttrib(pid,"������",1);
			else
			   AddPersonAttrib(pid,"�Ṧ",1);
			end
		end
		if JY.Thing[202][WZ7]>2 then
		    local ran=math.random(3);
			if ran==1 then
			   AddPersonAttrib(pid,"������",1);
			elseif ran==2 then
			   AddPersonAttrib(pid,"������",1);
			else
			   AddPersonAttrib(pid,"�Ṧ",1);
			end
		end		
	end	
		
	--[[
	if add_a>=CC.PersonAttribMax['������'] then
		add_a=0
	end
	if add_b>=CC.PersonAttribMax['������'] then
		add_b=0
	end
	if add_c>=CC.PersonAttribMax['�Ṧ'] then
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
       AddPersonAttrib(pid,"������",add_b)
       AddPersonAttrib(pid,"������",add_c)
       AddPersonAttrib(pid,"�Ṧ",add_a)
       end
      else           
    AddPersonAttrib(pid,"������",add_a);
    AddPersonAttrib(pid,"������",add_b);
    AddPersonAttrib(pid,"�Ṧ",add_c);
      end]]
	--[[
    AddPersonAttrib(pid,"������",  mymodf(cleveradd()*leveladd));
    AddPersonAttrib(pid,"������",  mymodf(cleveradd()*leveladd));
    AddPersonAttrib(pid,"�Ṧ",  mymodf(cleveradd()*leveladd*0.6));
	]]--
    if JY.Person[pid]["ҽ������"]>=20 then
        AddPersonAttrib(pid,"ҽ������",  math.random(2));
    end
    if JY.Person[pid]["�ö�����"]>=20 then
        AddPersonAttrib(pid,"�ö�����",  math.random(2));
    end
    if JY.Person[pid]["�ⶾ����"]>=20 then
        AddPersonAttrib(pid,"�ⶾ����",  math.random(2));
    end
    
   if pid==75 then	
    if JY.Person[pid]["ȭ�ƹ���"]>=0 then
        AddPersonAttrib(pid,"ȭ�ƹ���",  math.random(3)*leveladd);
    end
    if JY.Person[pid]["��������"]>=0 then
        AddPersonAttrib(pid,"��������",  (5+math.random(3))*leveladd);
    end
    if JY.Person[pid]["ˣ������"]>=0 then
        AddPersonAttrib(pid,"ˣ������",  (5+math.random(3))*leveladd);
    end
    if JY.Person[pid]["�������"]>=0 then
        AddPersonAttrib(pid,"�������",  (5+math.random(3))*leveladd);
    end
   end
	
    if JY.Person[pid]["��������"]>=20 then
        AddPersonAttrib(pid,"��������",  math.random(2));
    end
  

    return true;

end

function War_PersonTrainBook(pid)           --ս���������ؼ��Ƿ�ɹ�
    local p=JY.Person[pid];

    local thingid=p["������Ʒ"];
    if thingid<0 then
        return ;
    end

	local wugongid=JY.Thing[thingid]["�����书"];
	local wg=0;
	
	if JY.Person[pid]["�书10"]>0 and wugongid>=0 then
	   for i=1,10 do
	        if JY.Thing[thingid]["�����书"]==JY.Person[pid]["�书"..i] then
			   wg=1
			   break;
			end
		end
		if wg==0 then return end
	end   

	local yes1,yes2,kfnum=false,false
	while true do
    local needpoint=TrainNeedExp(pid);      --���������ɹ���Ҫ����

    if p["��������"]>=needpoint then   --�����ɹ�
		yes1=true

        AddPersonAttrib(pid,"�������ֵ",JY.Thing[thingid]["���������ֵ"]);
		if thingid==139 then 
		   AddPersonAttrib(pid,"�������ֵ",-15) 
		   AddPersonAttrib(pid,"����",-15) 
		   if JY.Person[pid]["�������ֵ"]<1 then JY.Person[pid]["�������ֵ"]=1 end
		   if JY.Person[pid]["����"]<1 then JY.Person[pid]["����"]=1 end	   
		end
        if JY.Thing[thingid]["�ı���������"]==2 then
            p["��������"]=2;
        end
        AddPersonAttrib(pid,"�������ֵ",JY.Thing[thingid]["���������ֵ"]);
        AddPersonAttrib(pid,"������",JY.Thing[thingid]["�ӹ�����"]);
        AddPersonAttrib(pid,"�Ṧ",JY.Thing[thingid]["���Ṧ"]);
        AddPersonAttrib(pid,"������",JY.Thing[thingid]["�ӷ�����"]);
        AddPersonAttrib(pid,"ҽ������",JY.Thing[thingid]["��ҽ������"]);
        AddPersonAttrib(pid,"�ö�����",JY.Thing[thingid]["���ö�����"]);
        AddPersonAttrib(pid,"�ⶾ����",JY.Thing[thingid]["�ӽⶾ����"]);
        AddPersonAttrib(pid,"��������",JY.Thing[thingid]["�ӿ�������"]);

        if pid==56 then
        AddPersonAttrib(pid,"ȭ�ƹ���",JY.Thing[thingid]["��ȭ�ƹ���"]*2);
        AddPersonAttrib(pid,"��������",JY.Thing[thingid]["����������"]*2);
        AddPersonAttrib(pid,"ˣ������",JY.Thing[thingid]["��ˣ������"]*2);
        AddPersonAttrib(pid,"�������",JY.Thing[thingid]["���������"]*2);
        else
        AddPersonAttrib(pid,"ȭ�ƹ���",JY.Thing[thingid]["��ȭ�ƹ���"]);
        AddPersonAttrib(pid,"��������",JY.Thing[thingid]["����������"]);
        AddPersonAttrib(pid,"ˣ������",JY.Thing[thingid]["��ˣ������"]);
        AddPersonAttrib(pid,"�������",JY.Thing[thingid]["���������"]);
        end
      

        AddPersonAttrib(pid,"��������",JY.Thing[thingid]["�Ӱ�������"]);
        AddPersonAttrib(pid,"��ѧ��ʶ",JY.Thing[thingid]["����ѧ��ʶ"]);
        AddPersonAttrib(pid,"Ʒ��",JY.Thing[thingid]["��Ʒ��"]);
        AddPersonAttrib(pid,"��������",JY.Thing[thingid]["�ӹ�������"]);
        if JY.Thing[thingid]["�ӹ�������"]==1 then
            p["���һ���"]=1;
        end
        
		if thingid>186 then
		   p["��������"]=p["��������"]-needpoint;
		end

		if thingid<187 then
		   p["��������"]=p["��������"]-needpoint;
		end

        if wugongid>=0 then
			yes2=true
            local oldwugong=0;
            for i =1,10 do
                if p["�书" .. i]==wugongid then
                    oldwugong=1;
                    p["�书�ȼ�" .. i]=math.modf((p["�书�ȼ�" .. i]+100)/100)*100;
					kfnum=i

                    break;
                end
            end
            if oldwugong==0 then  --�µ��书
                for i=1,10 do
                    if p["�书" .. i]==0 then
                        p["�书" .. i]=wugongid;
						kfnum=i
                        break;
                    end
                end
                ---���ﲻ����10���书������ʱ����������µ��书
            end
        end
	else 
		break
    end
	end
	
	if yes1 then
        DrawStrBoxWaitKey( string.format(CC.WARS126,p["����"],JY.Thing[thingid]["����"]),C_WHITE,CC.DefaultFont);
	end
	if yes2 then 
        DrawStrBoxWaitKey(string.format(CC.WARS127,JY.Wugong[wugongid]["����"],math.modf(p["�书�ȼ�" ..kfnum]/100)+1),C_WHITE,CC.DefaultFont);
	end
end

function War_PersonTrainDrug(pid)         --ս�����Ƿ���������ƷҩƷ
    local p=JY.Person[pid];

    local thingid=p["������Ʒ"];
    if thingid<0 then
        return ;
    end

    if JY.Thing[thingid]["������Ʒ�辭��"] <=0 then          --��������������Ʒ
        return ;
    end

    local needpoint=(7-math.modf(p["����"]/15))*JY.Thing[thingid]["������Ʒ�辭��"];
    if p["��Ʒ��������"]< needpoint then
        return ;
    end

    local haveMaterial=0;       --�Ƿ�����Ҫ�Ĳ���
    local MaterialNum=-1;
    for i=1,CC.MyThingNum do
        if JY.Base["��Ʒ" .. i]==JY.Thing[thingid]["�����"] then
            haveMaterial=1;
            MaterialNum=JY.Base["��Ʒ����" .. i]
            break;
        end
    end

    if haveMaterial==1 then   --�в���
        local enough={};
        local canMake=0;
        for i=1,5 do       --������Ҫ���ϵ���������ǿ���������Щ��Ʒ
            if JY.Thing[thingid]["������Ʒ" .. i] >=0 and MaterialNum >= JY.Thing[thingid]["��Ҫ��Ʒ����" .. i] then
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

        if canMake ==1 then    --��������Ʒ
            local makeID;
            while true do      --���ѡ����������Ʒ��������ǰ��enough�����б�ǿ���������
                makeID=Rnd(5)+1;
				if thingid==221 and pid==88 and enough[4]==1 then makeID=4 end
				if thingid==220 and pid==89 and enough[4]==1 then makeID=4 end
                if enough[makeID]==1 then
                    break;
                end
            end
            local newThingID=JY.Thing[thingid]["������Ʒ" .. makeID];

            DrawStrBoxWaitKey(string.format("%s ����� %s",p["����"],JY.Thing[newThingID]["����"]),C_WHITE,CC.DefaultFont);

            if instruct_18(newThingID)==true then       --�Ѿ�����Ʒ
                instruct_32(newThingID,1);
            else
                instruct_32(newThingID,1);
            end

            instruct_32(JY.Thing[thingid]["�����"],-JY.Thing[thingid]["��Ҫ��Ʒ����" .. makeID]);
            p["��Ʒ��������"]=0;
        end
    end
end

function War_isEnd()           --ս���Ƿ�������أ�0 ����   1 Ӯ    2 ��

    for i=0,WAR.PersonNum-1 do
        if JY.Person[WAR.Person[i]["������"]]["����"]<=0 then
            WAR.Person[i]["����"]=true;
        end
    end
    WarSetPerson();     --����ս������λ��

    Cls();
    ShowScreen();

    local myNum=0;
    local EmenyNum=0;
    for i=0,WAR.PersonNum-1 do
        if WAR.Person[i]["����"]==false then
            if WAR.Person[i]["�ҷ�"]==true then
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

function WarSelectTeam()            --ѡ���ҷ���ս��
    WAR.PersonNum=0;

	--local Size=WARFHS();
	--if Size~=CC.WFSIZE then JY.Status=x end
	
	--[[if WAR.ZDDH<=225 then
	    for i=1,6 do
	        if WAR.Data["�Զ�ѡ���ս��" .. i]~=ZDCZR[WAR.ZDDH+1][i]-33 then
			   --say("�Զ�ѡ���ս��")
			   JY.Status=x
			   ZBXS();
			end
			if WAR.Data["�ҷ�X" .. i]~=MYCZRX[WAR.ZDDH+1][i]-33 then
			   --say("�ҷ�X"..i)
			   JY.Status=x
			   ZBXS();
			end
			if WAR.Data["�ҷ�Y" .. i]~=MYCZRY[WAR.ZDDH+1][i]-33 then
			   --say("�ҷ�Y"..i)
			   JY.Status=x
			   ZBXS();
			end
		end
	end]]
    for i=1,6 do	
	    local id=WAR.Data["�Զ�ѡ���ս��" .. i];
		if id>=0 then
            WAR.Person[WAR.PersonNum]["������"]=id;
            WAR.Person[WAR.PersonNum]["�ҷ�"]=true;
            WAR.Person[WAR.PersonNum]["����X"]=WAR.Data["�ҷ�X"  .. i];
            WAR.Person[WAR.PersonNum]["����Y"]=WAR.Data["�ҷ�Y"  .. i];
            WAR.Person[WAR.PersonNum]["����"]=false;
            WAR.Person[WAR.PersonNum]["�˷���"]=2;
            WAR.PersonNum=WAR.PersonNum+1;
		end
    end
	if WAR.PersonNum>0 and WAR.ZDDH~=235 then
	    return ;
    end

    for i=1,CC.TeamNum do                 --��������ȷ���Ĳ�ս��
        WAR.SelectPerson[i]=0;
        local id=JY.Base["����" .. i];
        if id>=0 then
            for j=1,6 do
                if WAR.Data["�ֶ�ѡ���ս��" .. j]==id then
                    WAR.SelectPerson[i]=1;
                end
            end
        end
    end

    local menu={};
    for i=1, CC.TeamNum do
        menu[i]={"",WarSelectMenu,0};
        local id=JY.Base["����" .. i];
        if id>=0 then
            menu[i][3]=1;
            local s=JY.Person[id]["����"];
            if WAR.SelectPerson[i]==1 then
                menu[i][1]="*" .. s;
            else
                menu[i][1]=" " .. s;
            end
        end
    end

    menu[CC.TeamNum+1]={" ����",nil,1}

	while true do
		Cls();
		local x=(CC.ScreenW-7*CC.DefaultFont-2*CC.MenuBorderPixel)/2;
		DrawStrBox(x,10,"��ѡ���ս����",C_WHITE,CC.DefaultFont);
		local r=ShowMenu(menu,CC.TeamNum+1,0,x,10+CC.SingleLineHeight,0,0,1,0,CC.DefaultFont,C_ORANGE,C_WHITE);
		Cls();

		for i=1,6 do
			if WAR.SelectPerson[i]>0 then
				WAR.Person[WAR.PersonNum]["������"]=JY.Base["����" ..i];
				WAR.Person[WAR.PersonNum]["�ҷ�"]=true;
				WAR.Person[WAR.PersonNum]["����X"]=WAR.Data["�ҷ�X"  .. i];
				WAR.Person[WAR.PersonNum]["����Y"]=WAR.Data["�ҷ�Y"  .. i];
				WAR.Person[WAR.PersonNum]["����"]=false;
				WAR.Person[WAR.PersonNum]["�˷���"]=2;
				WAR.PersonNum=WAR.PersonNum+1;
			end
		end
		if WAR.PersonNum>0 then   --ѡ�����ҷ���ս��
		   break;
		end
    end
end

function WarSelectMenu(newmenu,newid)            --ѡ��ս���˲˵����ú���
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

function WarSelectEnemy()            --ѡ��з���ս��
  
   --if PNLBD[WAR.ZDDH]~=nil then PNLBD[WAR.ZDDH]() end
   
	for i=1,20 do
        if WAR.Data["����"  .. i]>0 then
            WAR.Person[WAR.PersonNum]["������"]=WAR.Data["����"  .. i];
            WAR.Person[WAR.PersonNum]["�ҷ�"]=false;
            WAR.Person[WAR.PersonNum]["����X"]=WAR.Data["�з�X"  .. i];
            WAR.Person[WAR.PersonNum]["����Y"]=WAR.Data["�з�Y"  .. i];
            WAR.Person[WAR.PersonNum]["����"]=false;
            WAR.Person[WAR.PersonNum]["�˷���"]=1;
            WAR.PersonNum=WAR.PersonNum+1;
        end
    end	
end

function WarLoadMap(mapid)      --����ս����ͼ
--����ս����ͼ
--��6�㣬�����˹����õ�ͼ
--        0�� ��������
--        1�� ����
--����Ϊս����ͼ���ݣ���ս���ļ������롣����Ϊ�����õĵ�ͼ�ṹ
--        2�� ս����ս����ţ���WAR.Person�ı��
--        3�� �ƶ�ʱ��ʾ���ƶ���λ��
--        4�� ����Ч��
--        5�� ս���˶�Ӧ����ͼ
   lib.Debug(string.format("load war map %d",mapid));
   lib.LoadWarMap(CC.WarMapFile[1],CC.WarMapFile[2],mapid,6,CC.WarWidth,CC.WarHeight);
end

function GetWarMap(x,y,level)   --ȡս����ͼ����
	if x>63 or x<0 or y>63 or y<0 then
		return;
	end
     return lib.GetWarMap(x,y,level);
end

function SetWarMap(x,y,level,v)  --��ս����ͼ����
	if x>63 or x<0 or y>63 or y<0 then
		return;
	end
 	lib.SetWarMap(x,y,level,v);
end

function CleanWarMap(level,v)  --����ĳ��Ϊ����ֵ
	lib.CleanWarMap(level,v);
end

function WarPersonSort(flag)  --ս�����ﰴ�Ṧ����
    for i=0,WAR.PersonNum-1 do                ---������˵��Ṧ������װ���ӳ�
        local id=WAR.Person[i]["������"];
        local add=0;
        if JY.Person[id]["����"]>-1 then
            add=add+JY.Thing[JY.Person[id]["����"]]["���Ṧ"];
        end
        if JY.Person[id]["����"]>-1 then
            add=add+JY.Thing[JY.Person[id]["����"]]["���Ṧ"];
        end
        WAR.Person[i]["�Ṧ"]=JY.Person[id]["�Ṧ"]+add;
		if WAR.Person[i]["�ҷ�"] then
		
		else
			if GetS(0,0,0,0)==1 then
				WAR.Person[i]["�Ṧ"]=WAR.Person[i]["�Ṧ"]+math.modf(JY.Person[id]["�������ֵ"]/50)+JY.Person[id]["�ȼ�"]
			else
				WAR.Person[i]["�Ṧ"]=WAR.Person[i]["�Ṧ"]+math.modf(JY.Person[id]["�������ֵ"]/100)
			end
		end
		--[[
        local move=math.modf(WAR.Person[i]["�Ṧ"]/15)-math.modf(JY.Person[id]["���˳̶�"]/40);
        if move<0 then
            move=0;
        end
        WAR.Person[i]["�ƶ�����"]=move;
		]]--
	--if JY.Status==GAME_WMAP then
		for ii,v in pairs(CC.AddSpd) do
			if v[1]==id then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["������"]==v[2] and  WAR.Person[wid]["����"]==false then
						WAR.Person[i]["�Ṧ"]=WAR.Person[i]["�Ṧ"]+v[3];
					end
				end
			end
		end
	--end
    end
	
	
	if flag~=nil then
		return
	end

    --���Ṧ�����ñȽϱ��ķ���
    for i=0,WAR.PersonNum-2 do
        local maxid=i;
        for j=i,WAR.PersonNum-1 do
            if WAR.Person[j]["�Ṧ"]>WAR.Person[maxid]["�Ṧ"] then
                maxid=j;
            end
        end
        WAR.Person[maxid],WAR.Person[i]=WAR.Person[i],WAR.Person[maxid];
    end
	
end

function WarSetPerson()            --����ս������λ�ú���ͼ
 	CleanWarMap(2,-1);
 	CleanWarMap(5,-1);

	for i=0,WAR.PersonNum-1 do
        if WAR.Person[i]["����"]==false then
            SetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],2,i);
            SetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],5,WAR.Person[i]["��ͼ"]);
        end
    end
end

function WarCalPersonPic(id)       --����ս��������ͼ
    local n=5106;            --ս��������ͼ��ʼλ��
    n=n+JY.Person[WAR.Person[id]["������"]]["ͷ�����"]*8+WAR.Person[id]["�˷���"]*2;
    return n;
end

--------------------------�ֶ�ս��---------------------------------

function War_Manual()        --�ֶ�ս��
--�ֶ�ս��
--id ս��������
--���أ�ѡ�в˵���ţ�ѡ��"�ȴ�"ʱ��Ч��
    local r;
	local x,y,move,pic=WAR.Person[WAR.CurID]['����X'],WAR.Person[WAR.CurID]['����Y'],WAR.Person[WAR.CurID]["�ƶ�����"],WAR.Person[WAR.CurID]["��ͼ"]
	while true do
	    WAR.ShowHead=1;          --��ʾͷ��
	    r=War_Manual_Sub();  --�ֶ�ս���˵�
		if r==1 or r==-1 then
			WAR.Person[WAR.CurID]["�ƶ�����"]=0
		elseif r==0 then
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1);
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1);
			WAR.Person[WAR.CurID]['����X'],WAR.Person[WAR.CurID]['����Y'],WAR.Person[WAR.CurID]["�ƶ�����"]=x,y,move
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID);
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,pic);
        else        --�ƶ���Ϻ��������ɲ˵�
		    break;
		end
	end
	WAR.ShowHead=0;--[[
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1);
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1);
			WAR.Person[WAR.CurID]['����X'],WAR.Person[WAR.CurID]['����Y'],WAR.Person[WAR.CurID]["�ƶ�����"]=x,y,move
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID);
			SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,pic);]]--
	WarDrawMap(0);
	return r;
end

function War_Manual_Sub()                --�ֶ�ս���˵�
    local pid=WAR.Person[WAR.CurID]["������"];
	local isEsc=0
     
    local warmenu={ {"�ƶ�",War_MoveMenu,1},
                 {"����",War_FightMenu,1},
                 {"�ö�",War_PoisonMenu,1},
                 {"�ⶾ",War_DecPoisonMenu,1},
                 {"ҽ��",War_DoctorMenu,1},
                 {"��Ʒ",War_ThingMenu,1},
				 {"����",War_ActupMenu,1},
                 {"����",War_DefupMenu,1},
                 {"״̬",War_StatusMenu,1},
                 {"��Ϣ",War_RestMenu,1},
				 {"��ɫ",War_TgrtsMenu,1},
                 {"�Զ�",War_AutoMenu,1},   };
    
	--if pid==0 then menu[7][1]=" " end	
	
	if GRTS[pid]~=nil then 
	   warmenu[11][1]=GRTS[pid] 
	else
	   warmenu[11][3]=0	   
	end

	if pid==49 then
	    local t=0;
	    for i=0,WAR.PersonNum-1 do
	        local wid=WAR.Person[i]["������"]	
			if WAR.TZ_XZ_SSH[wid]==1 and WAR.Person[i]["����"]==false then
			   t=1;
			   break
			end
		end
		if t==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["����"]<20 or JY.Person[pid]["����"]<1000 then warmenu[11][3]=0 end
	end
	
	if pid==88 then
	    local yes=0;
	    for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["�ҷ�"]==true and WAR.Person[i]["����"]==false then
			    if RealJL(WAR.CurID,i,5) and i~=WAR.CurID then
				     yes=1;
					 break;
				end
			end
		end
		if yes==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["����"]<10 or JY.Person[pid]["����"]<700 then warmenu[11][3]=0 end		
	end	   
	
	if pid==89 then
	   local px,py=WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"];
	   local mxy={
	           {WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"]+1},
			   {WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"]-1},
			   {WAR.Person[WAR.CurID]["����X"]+1,WAR.Person[WAR.CurID]["����Y"]},
			   {WAR.Person[WAR.CurID]["����X"]-1,WAR.Person[WAR.CurID]["����Y"]},			   
			      };
        local yes=0;
		for i=1,4 do
		    if GetWarMap(mxy[i][1],mxy[i][2],2)>=0 then
			    local mid=GetWarMap(mxy[i][1],mxy[i][2],2);
				if inteam(WAR.Person[mid]["������"]) then
				   yes=1
				   break;
				end
			end
		end
		if yes==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["����"]<25 or JY.Person[pid]["����"]<300 then warmenu[11][3]=0 end	
	end
	
	if pid==9 then
	    local yes=0;
	    for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["�ҷ�"]==true and WAR.Person[i]["����"]==false then
			    if RealJL(WAR.CurID,i,8) and i~=WAR.CurID then
				     yes=1;
					 break;
				end
			end
		end
		if yes==0 then warmenu[11][3]=0 end
		if JY.Person[pid]["����"]<10 or JY.Person[pid]["����"]<500 then warmenu[11][3]=0 end		
	end

	if pid==9 and JY.Person[pid]["����"]<20 then warmenu[11][3]=0 end
	
	if JY.Thing[202][WZ7]<2 then warmenu[11][3]=0 end
	
    if WAR.ZYHB==2 then
       for i=1,12 do
           if i==2 or i==10 then
              i=i+1
           end
           warmenu[i][3]=0;
       end
    end


    if JY.Person[pid]["����"]<=5 or WAR.Person[WAR.CurID]["�ƶ�����"]<=0 then  --�����ƶ�
        warmenu[1][3]=0;
		isEsc=1
    end

    local minv=War_GetMinNeiLi(pid);

    if JY.Person[pid]["����"] < minv or JY.Person[pid]["����"] <10 then  --����ս��
        warmenu[2][3]=0;
    end

    if JY.Person[pid]["����"]<10 or JY.Person[pid]["�ö�����"]<20 then  --�����ö�
        warmenu[3][3]=0;
    end

    if JY.Person[pid]["����"]<10 or JY.Person[pid]["�ⶾ����"]<20 then  --���ܽⶾ
        warmenu[4][3]=0;
    end

    if JY.Person[pid]["����"]<50 or JY.Person[pid]["ҽ������"]<20 then  --����ҽ��
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

function War_GetMinNeiLi(pid)       --���������书����Ҫ�������ٵ�
    local minv=math.huge;
    for i=1,10 do
        local tmpid=JY.Person[pid]["�书" .. i];
        if tmpid >0 then
            if JY.Wugong[tmpid]["������������"]< minv then
                minv=JY.Wugong[tmpid]["������������"];
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

function War_FightMenu()              --ִ�й����˵�
    local pid=WAR.Person[WAR.CurID]["������"];

    local numwugong=0;
    local menu={};
    for i=1,10 do
        local tmp=JY.Person[pid]["�书" .. i];
        if tmp>0 then
		    if JY.WGLVXS==1 then
               --menu[i]={JY.Wugong[tmp]["����"].."��"..JY.Person[pid]["�书�ȼ�" .. i],nil,1};
            else
			   menu[i]={JY.Wugong[tmp]["����"],nil,1};
			end
			if JY.Wugong[tmp]["������������"] > JY.Person[pid]["����"] then
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
			if JY.Wugong[tmp]["������������"] > JY.Person[pid]["����"] then
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
	local wugong=JY.Person[pid]["�书" .. r];
    local level=JY.Person[pid]["�书�ȼ�" .. r];
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
	WAR.Person[WAR.CurID]["Action"]={"atk",r,x-WAR.Person[WAR.CurID]["����X"],y-WAR.Person[WAR.CurID]["����Y"]};
	return 1;
	]]--
end

function War_Fight_Sub(id,wugongnum,x,y)          --ִ��ս��
   
    local pid=WAR.Person[id]["������"];
    local wugong=0--JY.Person[pid]["�书" .. wugongnum];
	--WAR.Person[id]["�����书"]=9999	
	if wugongnum<100 then 
		wugong=JY.Person[pid]["�书" .. wugongnum];
	else
		wugong=wugongnum-100; --dzxy
		wugongnum=1--JY.Person[pid]["����8"]
		for i=1,10 do
			if JY.Person[pid]["�书"..i]==43 then
				wugongnum=i
				break
			end
		end
		x=WAR.Person[WAR.CurID]["����X"]-x
		y=WAR.Person[WAR.CurID]["����Y"]-y
		WarDrawMap(0);
		local fj;
		if WAR.DZXYLV[pid]==110 then
		   --DrawStrBox(-1,24,string.format("%s������ϲ��̷���",JY.Person[pid]["����"]),C_GOLD,26)
		   fj=string.format(CC.WARS18,JY.Person[pid]["����"])
		elseif WAR.DZXYLV[pid]==85 then
		   --DrawStrBox(-1,24,string.format("%s������ת���Ʒ���",JY.Person[pid]["����"]),C_GOLD,26)
		   fj=string.format(CC.WARS19,JY.Person[pid]["����"])
		elseif WAR.DZXYLV[pid]==60 then
		   --DrawStrBox(-1,24,string.format("%s���������Ƴ�����",JY.Person[pid]["����"]),C_GOLD,26)
		   fj=string.format(CC.WARS20,JY.Person[pid]["����"])
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
	WAR.WGWL=JY.Wugong[wugong]["������10"]
    local fightscope=JY.Wugong[wugong]["������Χ"];
	local kfkind=JY.Wugong[wugong]["�书����"];
    local level=JY.Person[pid]["�书�ȼ�" .. wugongnum];
	if level==999 then 
		level=11
	else
		level=math.modf(level/100)+1
	end
	WAR.ShowHead=0
	--��map4��ע�书����Ч��
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
	--������
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
	local x0,y0=WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"];
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[WAR.CurID]["�ҷ�"]==WAR.Person[i]["�ҷ�"] and i~=WAR.CurID and WAR.Person[i]["����"]==false and WAR.SQFJ~=1 then
			local nx=WAR.Person[i]["����X"];
			local ny=WAR.Person[i]["����Y"];
			local fid=WAR.Person[i]["������"];
			for j=1,10 do
				if JY.Person[fid]["�书"..j]==wugong then
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
						WAR.Person[i]["�˷���"]=3-War_Direct(x0,y0,x,y);
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
					if WAR.Person[WAR.CurID]["�ҷ�"]==WAR.Person[v]["�ҷ�"] then
						local fid=WAR.Person[v]["������"];
						for j=1,10 do
							if JY.Person[fid]["�书"..j]==wugong then
								ZHEN_ID=v;
								WAR.Person[v]["�˷���"]=4-d;
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
   --[[ if JY.Person[pid]["���һ���"]==1 then
		if WAR.Person[id]["�ҷ�"] then
			if math.random(70)>JY.Person[pid]["����"] then
				fightnum=2;
			end
		else
			fightnum=2;
		end 
    end]]--
	        local zyjl=75-JY.Person[pid]["����"];
			if zyjl<0 then zyjl=0 end
			if pid==64 then zyjl=100 end
			if pid==59 then zyjl=70 end
			if T2SQ(pid) then zyjl=40 end
			if T2SQ(pid) and GetS(10,0,7,0)==1 then zyjl=70 end
                                             
          if JY.Person[pid]["���һ���"]==1 and WAR.ZYHB==0 and JLSD(0,zyjl,pid) and WAR.DZXY==0 and WAR.SQFJ~=1 then                                           
               WAR.ZYHB=1  
			    --for i=0,WAR.PersonNum-1 do
			        --WAR.Person[i]["Time"]=1005
				--end
			   
                for i=1,10 do
					DrawStrBox(-1,24,"���һ���",C_ORANGE,20+i)
					ShowScreen();
						if i==10 then
							lib.Delay(40);
						else
							lib.Delay(1);
						end
		        end 	 
          end 		                                       
    local LJ1=math.modf(JY.Person[pid]["�Ṧ"]/18);
    local LJ2=math.modf((JY.Person[pid]["�������ֵ"]+JY.Person[pid]["����"])/1000);
    local LJ3=math.modf(JY.Person[pid]["����"]/10);
    local LJ=0;
	 
             LJ=LJ1+LJ2+LJ3
             if WAR.Person[id]["�ҷ�"] then
                LJ=LJ
             else
                LJ=LJ+20
             end
             
             for i=1,10 do
                 if JY.Person[pid]["�书"..i]==47 then --�ж��Ž�
                    LJ=LJ+10
                    break;
                 end
             end
			 
			 local ljup={10,15,42,31,54,60,68,76,79}
			 local up=0;
			  for i=1,10 do
			        if JY.Person[pid]["�书"..i]>0 then
					    for ii=1,9 do
					         if JY.Person[pid]["�书"..i]==ljup[ii] then
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
			   JY.Wugong[13]["����"]=CC.WARS22
               if JLSD(40,70,pid) then                           
                fightnum=2
			   end
			   if JY.Person[pid]['�书'..wugongnum]==26 and (JLSD(45,55,pid) or WAR.LQZ[pid]==100) then
			       fightnum=3
				   WAR.FS=1
				    for i=1,10 do
				        DrawStrBox(-1,24,CC.WARS23,C_ORANGE,20+i)
                        ShowScreen()
                        lib.Delay(1)   
					end
			   end
                if JY.Person[pid]["����"]<math.modf(JY.Person[pid]["�������ֵ"]/3) then
                   JY.Person[pid]["����"]=math.modf(JY.Person[pid]["�������ֵ"]/3)                 
                end              
             end
             if pid==27 then fightnum=3 end          
             if pid==35 and GetS(10,1,1,0)==1 and JLSD(15,85,pid) then fightnum=2 end
			 if pid==59 and JY.Person[pid]['�书'..wugongnum]==42 then fightnum=2 end
             if pid==60 and WAR.tmp[1060]==1 and (WAR.ZDDH==176 or WAR.ZDDH==133) then fightnum=2 end
			 if WAR.ZDDH==237 and pid==18 and JLSD(30,70,pid) then fightnum=1 end
			
			 local glj={7,2,34,37,55,57,70,77};
			 for i=1,8 do
			      if JY.Person[pid]['�书'..wugongnum]==glj[i] and JLSD(25,75,pid) then
				      fightnum=2 
					  break;
				  end
			 end
			
			 if WAR.ZDDH==54 and pid==26 then fightnum=1 end
			
			 WAR.ACT=1
			 WAR.FLHS6=0
			 if WAR.DZXY==1 or WAR.SQFJ==1 then fightnum=1 end
while WAR.ACT<=fightnum  do         --������һ������򹥻�����

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
		WarDrawAtt(WAR.Person[ZHEN_ID]["����X"]+x0-x,WAR.Person[ZHEN_ID]["����Y"]+y0-y,atkfanwei,3);
		WAR.CurID=tmp_id;
	end
	if WAR.SQFJ==1 then
	   CleanWarMap(4,0)
	   for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and WAR.Person[i]["����"]==false then
	           SetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],4,1)
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
		--DrawStrBox(CC.ScreenW/2-42,24,"����",C_ORANGE,30)
		--ShowScreen()
		--lib.Delay(600)
	end
    local BJ1=math.modf(JY.Person[pid]["������"]/18);
    local BJ2=math.modf((JY.Person[pid]["�������ֵ"]+JY.Person[pid]["����"])/1000);
    local BJ3=math.modf(JY.Person[pid]["����"]/10);
    local BJ=0;
	     BJ=BJ1+BJ2+BJ3
             if WAR.Person[id]["�ҷ�"] then
                BJ=BJ
             else
                BJ=BJ+20
             end
             if pid==58 and JY.Person[pid]["����"]<JY.Person[pid]["�������ֵ"]/4 and JLSD(10,80,pid) then
                WAR.BJ=1
             elseif pid==58 and JY.Person[pid]["����"]<JY.Person[pid]["�������ֵ"]/2 and JLSD(25,75,pid) then
                WAR.BJ=1
             end
             if pid==54 then
                BJ=BJ+15
             end
			 
			 local bjup={18,22,39,40,56,65,71,78,74}
			 local up=0;
			  for i=1,10 do
			        if JY.Person[pid]["�书"..i]>0 then
					    for ii=1,9 do
					         if JY.Person[pid]["�书"..i]==bjup[ii] then
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
		             if WAR.Person[j]["������"]==47 then
	                    if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then			    
		                   WAR.BJ=1
						end
					 end
			    end
			 end
			 
			 if pid==77 and JY.Person[pid]['�书'..wugongnum]==62 then WAR.BJ=1 end
             if pid==60 and WAR.tmp[1060]==1 then WAR.BJ=1 end
			 
			 local gbj={11,13,28,33,58,59,72,75};
			 for i=1,8 do
			      if JY.Person[pid]['�书'..wugongnum]==gbj[i] and JLSD(20,75,pid) then
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
           --DrawStrBox(-1,-1,"����",C_ORANGE,30)
           --ShowScreen()
           --lib.Delay(600)
        end
	--[[if fightnum==2 then
		level=level
	end]]--
	local ng=0
	for i=1,10 do
		local kfid=JY.Person[pid]["�书"..i]
		if kfid>88 and kfid<109 then
			if kfid==95 then
				if WAR.tmp[200+pid]==nil then
					WAR.tmp[200+pid]=0;
				else
				if WAR.tmp[200+pid]>100 then
					ng=WAR.tmp[200+pid]*10+1500;
					WAR.tmp[200+pid]=0;
					WAR.Person[id][CC.TXDH]=math.fmod(kfid,10)+85
					WAR.Person[id][CC.TXWZ2]=JY.Wugong[kfid]['����']..'��������'
					break;
				end
				end
			end
			if myrandom(10,pid) or (pid==9 and myrandom(10+i*4,pid)) or (pid==0 and i==2 and kfid==91 and (JLSD(35,60,pid) or (GetS(4,5,5,5)==6 and JLSD(30,35+math.modf(JY.Person[0]["Ʒ��"]/3),pid)))) or (PersonKF(104,pid) and JLSD(35,60,pid)) then  
				local lv=math.modf(JY.Person[pid]['�书�ȼ�'..i]/100)+1
				local wl=JY.Wugong[kfid]['������'..lv]			
				if wl>ng then
					ng=wl
					WAR.Person[id][CC.TXDH]=math.fmod(kfid,10)+85
					WAR.Person[id][CC.TXWZ2]=JY.Wugong[kfid]['����']..'����'
					WAR.NGJL=kfid					
				end
			end
		end
	end
	
	if WAR.NGJL==92 and (WAR.Person[WAR.CurID]["�ҷ�"]==false or math.random(10)<6 or pid==13) then
					ng=1;
					WAR.Person[id][CC.TXDH]=math.fmod(92,10)+85;
					if pid==13 then
					   WAR.Person[id][CC.TXWZ2]=JY.Wugong[92]['����']..CC.WARS130;
					else
					   WAR.Person[id][CC.TXWZ2]=JY.Wugong[92]['����']..CC.WARS31;
					end
					for j=0,WAR.PersonNum-1 do
						if WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and WAR.Person[j]["����"]==false then
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
	   local mc=JY.Wugong[91]["����"]
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
	        if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
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
		    if JY.Person[pid]["�书"..w]==85 then
			    JY.Person[pid]["�书�ȼ�"..w]=JY.Person[pid]["�书�ȼ�"..w]+10
				if JY.Person[pid]["�书�ȼ�"..w]>999 then JY.Person[pid]["�书�ȼ�"..w]=999 end
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
		    if JY.Person[pid]["�书"..w]==88 then
			    JY.Person[pid]["�书�ȼ�"..w]=JY.Person[pid]["�书�ȼ�"..w]+10
				if JY.Person[pid]["�书�ȼ�"..w]>999 then JY.Person[pid]["�书�ȼ�"..w]=999 end
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
		    if JY.Person[pid]["�书"..w]==87 then
			    JY.Person[pid]["�书�ȼ�"..w]=JY.Person[pid]["�书�ȼ�"..w]+10
				if JY.Person[pid]["�书�ȼ�"..w]>999 then JY.Person[pid]["�书�ȼ�"..w]=999 end
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
	   if JY.Person[pid]['�书'..wugongnum]>88 and JY.Person[pid]['�书'..wugongnum]<109 then
	      if JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and JLSD(25,75,pid) then
		     WAR.Person[id][CC.TXWZ3]=CC.WARS39..JY.Wugong[JY.Person[pid]['�书'..wugongnum]]["����"]	      
		     ng=ng+JY.Wugong[JY.Person[pid]['�书'..wugongnum]]["������10"]
	      end
		  if JY.Person[pid]['�书�ȼ�'..wugongnum]==999 then WAR.WS=1 end
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
	
	if JY.Person[pid]['�书'..wugongnum]==26 then
           if pid==50 or (pid==55 and math.random(10)<4) or (pid==69 and math.random(10)<6) or (pid==0 and GetS(4,5,5,5)==1 and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and JLSD(30,70,pid)) then		
			WAR.Person[id][CC.TXWZ3]=XL18JY[math.random(8)]
			--JY.Person[pid]['������']=JY.Person[pid]['������']*3
			ng=ng+2500
			WAR.WS=1
			--[[
			for i=1,level do
				for d=1,4 do
					SetWarMap(WAR.Person[WAR.CurID]['����X']+CC.DirectX[d]*i,WAR.Person[WAR.CurID]['����Y']+CC.DirectY[d]*i,4,1)
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
			--JY.Person[pid]['������']=JY.Person[pid]['������']*3
			ng=ng+2000
			for i=1,(1+level)/2 do
				for j=1,(1+level)/2 do
		SetWarMap(WAR.Person[WAR.CurID]['����X']+i*2-1,WAR.Person[WAR.CurID]['����Y']+j*2-1,4,1)
		SetWarMap(WAR.Person[WAR.CurID]['����X']-i*2+1,WAR.Person[WAR.CurID]['����Y']+j*2-1,4,1)
		SetWarMap(WAR.Person[WAR.CurID]['����X']+i*2-1,WAR.Person[WAR.CurID]['����Y']-j*2+1,4,1)
		SetWarMap(WAR.Person[WAR.CurID]['����X']-i*2+1,WAR.Person[WAR.CurID]['����Y']-j*2+1,4,1)
				end
			end
                        end
             end
                    
        end		
	   
	if JY.Person[pid]['�书'..wugongnum]==49 then
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
	
	if JY.Person[pid]['�书'..wugongnum]==1 and PersonKF(pid,108) then	    
		if inteam(pid) then
		    if JLSD(20,80,pid) then WAR.LHQ_BNZ=1 end
		else
		    WAR.LHQ_BNZ=1
		end
	end
	
	if JY.Person[pid]['�书'..wugongnum]==22 and PersonKF(pid,108) then	    
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
	   if JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and JLSD(25,75,pid) then
	      WAR.Person[id][CC.TXWZ3]=XKXSJ[math.random(4)]
		  ng=ng+1200
		end
	end
	
	if pid==37 and wugong==94 then
	   if JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and JLSD(25,75,pid) then
	      WAR.Person[id][CC.TXWZ3]=CC.WARS43
		  ng=ng+1000
		end
	end
	
	if JY.Person[pid]['�书'..wugongnum]==44 and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and math.random(10)<6 then
	   for i=1,10 do
	       if JY.Person[pid]['�书'..i]==67 and JY.Person[pid]['�书�ȼ�'..i]==999 then
		      WAR.Person[id][CC.TXWZ1]=CC.WARS44
			  WAR.Person[id][CC.TXDH]=6
			  WAR.DJGZ=1
			  ng=ng+2000
			  break		   		  
		   end
	   end
	end
	
	if JY.Person[pid]['�书'..wugongnum]==67 and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and math.random(10)<6 then
	   for i=1,10 do
	       if JY.Person[pid]['�书'..i]==44 and JY.Person[pid]['�书�ȼ�'..i]==999 then
		      WAR.Person[id][CC.TXWZ1]=CC.WARS44
			  WAR.Person[id][CC.TXDH]=6
			  WAR.DJGZ=1
			  ng=ng+2000
			  break		   		  
		   end
	   end
	end
	
	if pid==90 and JY.Person[pid]['�书'..wugongnum]==113 then WAR.TD=-2 end
	
    if pid==57 and WAR.ACT==1 then
       	for j=0,WAR.PersonNum-1 do		    
	            if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then	
				   if JY.Person[WAR.Person[j]["������"]]["����"]>1000 then
		              JY.Person[WAR.Person[j]["������"]]["����"]=JY.Person[WAR.Person[j]["������"]]["����"]-1000
	               else
				      JY.Person[WAR.Person[j]["������"]]["����"]=0
					  JY.Person[WAR.Person[j]["������"]]["����"]=JY.Person[WAR.Person[j]["������"]]["����"]-100
				   end
                end
        end
		 WAR.Person[id][CC.TXWZ3]=CC.WARS45
	     WAR.Person[id][CC.TXDH]=39
    end		
	
	if pid==60 then WAR.WS=1 end
	if pid==27 then WAR.WS=1 end
	if (pid==50 or pid==55 or pid==69) and JY.Person[pid]['�书'..wugongnum]==26 then WAR.WS=1 end
	if pid==35 and GetS(10,1,1,0)==1 and JY.Person[pid]['�书'..wugongnum]==47 then WAR.WS=1 end
	
	if pid==62 then ng=ng+2000 end 
	
	if pid==84 then ng=ng+1000 end 
	
	if pid==78 and JY.Person[pid]['�书'..wugongnum]==11 then 
	   WAR.MCF=1 
	   WAR.Person[id][CC.TXWZ3]=CC.WARS46
	end
	
	if pid==52 and JY.Person[pid]['�书'..wugongnum]==70 then 
	   WAR.Person[id][CC.TXWZ3]=CC.WARS47
	   ng=ng+1000
	end
	
	if pid==25 or pid==83 then WAR.TFH=1 end
	
	if pid==91 and JY.Person[pid]['�书'..wugongnum]==28 then WAR.WQQ=1 end
	
	if pid==74 and JY.Person[pid]['�书'..wugongnum]==29 then WAR.HQT=1 end

	if pid==63 and JY.Person[pid]['�书'..wugongnum]==38 then WAR.CY=1 end
	
	if pid==58 and WAR.XK~=2 then           
          for j=0,WAR.PersonNum-1 do
	        if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
		        WAR.Person[j]["TimeAdd"]=WAR.Person[j]["TimeAdd"]-100             			               
            end
          end
		  if WAR.Person[id][CC.TXDH]==nil then WAR.Person[id][CC.TXDH]=89 end
		      WAR.Person[id][CC.TXWZ1]=CC.WARS48
    end
	
	
	if WAR.XK==2 and pid==58 and WAR.Person[WAR.CurID]["�ҷ�"]==WAR.XK2 then
                   for e=0,WAR.PersonNum-1 do
					     if WAR.Person[e]["����"]==false and WAR.Person[e]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then     
			                WAR.Person[e]["TimeAdd"]=WAR.Person[e]["TimeAdd"]-math.modf(JY.Person[WAR.Person[WAR.CurID]["������"]]["����"]/5)
							if WAR.Person[e]["Time"]<-450 then WAR.Person[e]["Time"]=-450 end
	                        JY.Person[WAR.Person[e]["������"]]["����"]=JY.Person[WAR.Person[e]["������"]]["����"]-math.modf(JY.Person[WAR.Person[WAR.CurID]["������"]]["����"]/5)
                            if JY.Person[WAR.Person[e]["������"]]["����"]<0 then JY.Person[WAR.Person[e]["������"]]["����"]=0 end						
		                    JY.Person[WAR.Person[e]["������"]]["����"]=JY.Person[WAR.Person[e]["������"]]["����"]-math.modf(JY.Person[WAR.Person[WAR.CurID]["������"]]["����"]/25)
							if JY.Person[WAR.Person[e]["������"]]["����"]<0 then JY.Person[WAR.Person[e]["������"]]["����"]=0 end							
						  end
					end
					if inteam(pid) then
                       JY.Person[58]["����"]=0
					   JY.Person[58]["�������ֵ"]=JY.Person[58]["�������ֵ"]-100
					   JY.Person[300]["����"]=JY.Person[300]["����"]+1
					else
					   AddPersonAttrib(pid,"����",-1000);
					end
					if JY.Person[58]["�������ֵ"]<500 then JY.Person[58]["�������ֵ"]=500 end
					WAR.Person[id][CC.TXWZ1]=CC.WARS49
	                WAR.Person[id][CC.TXDH]=6
				    WAR.XK=3
	end
   
	if pid==73 and JY.Person[pid]['�书'..wugongnum]==73  then
	   if math.random(10)<7 then
	    WAR.Person[id][CC.TXWZ3]=CC.WARS50
	    WAR.Person[id][CC.TXDH]=89
	     for j=0,WAR.PersonNum-1 do
	          if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
		        JY.Person[WAR.Person[j]["������"]]["����"]=JY.Person[WAR.Person[j]["������"]]["����"]-70
			  end
	   end
	  else
	   if math.random(10)<7 then
	    for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["������"]==35 then
	            if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then			    
		            JY.Person[WAR.Person[j]["������"]]["����"]=100
					JY.Person[WAR.Person[WAR.CurID]["������"]]["����"]=100
					JY.Person[WAR.Person[j]["������"]]["���˳̶�"]=0
					JY.Person[WAR.Person[WAR.CurID]["������"]]["���˳̶�"]=0
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
	        if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
		        JY.Person[WAR.Person[j]["������"]]["�ж��̶�"]=JY.Person[WAR.Person[j]["������"]]["�ж��̶�"]+20
                if 	JY.Person[WAR.Person[j]["������"]]["�ж��̶�"]>100 then			
	                JY.Person[WAR.Person[j]["������"]]["�ж��̶�"]=100 
				end
			end
		end
		WAR.Person[id][CC.TXWZ1]=CC.WARS55
		WAR.Person[id][CC.TXDH]=64
	end
	
	if pid==103 and JY.Person[pid]['�书'..wugongnum]==66 then
	   for j=0,WAR.PersonNum-1 do
	        if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
		        JY.Person[WAR.Person[j]["������"]]["���˳̶�"]=JY.Person[WAR.Person[j]["������"]]["���˳̶�"]+30
                if 	JY.Person[WAR.Person[j]["������"]]["���˳̶�"]>100 then			
	                JY.Person[WAR.Person[j]["������"]]["���˳̶�"]=100 
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
	
	if JY.Person[pid]['�书'..wugongnum]==63 and (JY.Person[pid]["����"]==44 or pid==97) then WAR.XDDF=1 end
	   
	if JY.Person[pid]['�书'..wugongnum]==16 then
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
		    WAR.Person[id][CC.TXWZ3]=CC.EVB110.."��"..WAR.Person[id][CC.TXWZ3]
	        ng=ng+1000;
		    WAR.ZSF2=1;
		end
	end	
	
	if pid==0 and GetS(4,5,5,5)==3 and wugong==64 and JLSD(20,80,pid) then
	   local d=math.random(math.modf(GetS(14,3,1,4)/100+1)+2)+6
	   ng=ng+d*100	   
	   WAR.Person[id][CC.TXWZ3]=CC.s53..SZB[d]
	end

	if JY.Person[pid]['�书'..wugongnum]==8 and pid==49 and PersonKF(pid,101) and (JLSD(20,80,pid) or WAR.NGJL==98) then
	   WAR.Person[id][CC.TXWZ3]=CC.WARS60	  
	   ng=ng+1700
	   WAR.SSFwav=1;
	   WAR.TZ_XZ=1;
	end
	
	if JY.Person[pid]['�书'..wugongnum]==80 and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and (JLSD(30,70,pid) or (GetS(4,5,5,5)==4 and JLSD(30,75,pid))) then
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
	
	if pid==1 and JY.Person[pid]['�书'..wugongnum]==67 and WAR.Person[id][CC.TXWZ3]==nil and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and math.random(10)<6 then	   
			WAR.Person[id][CC.TXWZ3]=HDZC[math.random(3)]	
			WAR.WS=1	
			ng=ng+1200
	end
	
	if pid==58 and JY.Person[pid]['�书'..wugongnum]==45 and WAR.Person[id][CC.TXWZ3]==nil and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and math.random(10)<7 then
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
	   --WAR.Person[id][CC.TXWZ1]="�����ԭ"
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
	
	if WAR.Data["����"]==130 then
	   for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["������"]==541 then
	            if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then			    
		            WAR.BSMT=1
					WAR.WS=1
					ng=ng+1500
					WAR.Person[id][CC.TXWZ1]=CC.WARS69
	                WAR.Person[id][CC.TXDH]=6	
			     end
		    end
       end
	end
	   
	if  JY.Person[pid]['�书'..wugongnum]==48 and JY.Person[pid]['�书�ȼ�'..wugongnum]==999 and WAR.NGJL==105 and WAR.KHCM[pid]~=1 then
	    WAR.KHBX=1
		WAR.Person[id][CC.TXWZ3]=CC.WARS70
	    WAR.Person[id][CC.TXDH]=6			
	end
	
    if WAR.KHCM[pid]==1 then
       WAR.Person[id][CC.TXDH]=89	
	   WAR.Person[id][CC.TXWZ2]=CC.WARS71
	end
	
	local xb=JY.Wugong[wugong]["�书����"];
	local pz=math.modf(JY.Person[0]["����"]/5)
	
	if pid==0 and GetS(4,5,5,5)==2 and JY.Person[pid]["��������"]>=120 and JY.Person[pid]['�书10']>0 and xb==2 and JLSD(30,50+pz,pid) and GetS(10,0,7,0)==1 then 
	   CleanWarMap(4,0)
	   for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and WAR.Person[i]["����"]==false then
	           SetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],4,1)
			end
		end
		WAR.Person[id][CC.TXDH]=6	
		if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[2]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[2].."��"..WAR.Person[id][CC.TXWZ3]
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
				--NewDrawString(-1,-1,"���������������Ǿ��㡻",C_GOLD,25+i)										
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
	
	if pid==0 and GetS(4,5,5,5)==1 and JY.Person[pid]['�书10']>0 and JY.Person[pid]["ȭ�ƹ���"]>=120 and JLSD(30,50+pz,pid) and xb==1 and GetS(10,0,7,0)==1 then
	   WAR.Person[id][CC.TXDH]=6	
	    if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[1]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[1].."��"..WAR.Person[id][CC.TXWZ3]
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
	
	if pid==0 and GetS(4,5,5,5)==4 and JY.Person[pid]['�书10']>0 and JY.Person[pid]["�������"]>=120 and JLSD(25,55+pz,pid) and xb==4 and GetS(10,0,7,0)==1 then
	   WAR.Person[id][CC.TXDH]=6	
	    if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[4]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[4].."��"..WAR.Person[id][CC.TXWZ3]
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
	
	if pid==0 and GetS(4,5,5,5)==3 and JY.Person[pid]['�书10']>0 and JY.Person[pid]["ˣ������"]>=120 and JLSD(30,55+pz,pid) and xb==3 and GetS(10,0,7,0)==1 then
	   WAR.Person[id][CC.TXDH]=6	
	    if WAR.Person[id][CC.TXWZ3]==nil then
	        WAR.Person[id][CC.TXWZ3]=ZJTF[3]
	    else
		    WAR.Person[id][CC.TXWZ3]=ZJTF[3].."��"..WAR.Person[id][CC.TXWZ3]
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
			        if JY.Person[pid]["�书"..i]>84 and JY.Person[pid]["�书"..i]<109 and JY.Person[pid]["�书"..i]~=86 or JY.Person[pid]["�书"..i]==43 then
					    if JY.Person[pid]["�书�ȼ�"..i]==999 then
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
            if effect>0 then              --����Ч���ط�			   
  				local emeny=GetWarMap(i,j,2);
				
				   
                 if emeny>=0 then          --����				 
                     if emeny~=WAR.CurID then       --�ǵ���
						if WAR.Person[WAR.CurID]["�ҷ�"] ~= WAR.Person[emeny]["�ҷ�"] or ((GetS(0,0,0,0)==1 or WAR.tmp[1000+pid]~=nil) and ZHEN_ID<0 and WAR.WS==0) then       --�ǵ���
					     --ֻ�е���湥������ɱ��������ʱ�˺�������Ч
							if JY.Wugong[wugong]["�˺�����"]==1 and (fightscope==0 or fightscope==3) then
								if level==11 then level=10 end
								WAR.Person[emeny]["����"]=-War_WugongHurtNeili(emeny,wugong,level)
								SetWarMap(i,j,4,3);
								WAR.Effect=3;
							else
								WAR.Person[emeny]["����"]=-War_WugongHurtLife(emeny,wugong,level,ng)
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
				    WAR.Person[GetWarMap(i,j,2)]["����"]=WAR.Person[GetWarMap(i,j,2)]["����"]-WAR.fthurt
				    WAR.Effect=2;
				    SetWarMap(i,j,4,2);
					WAR.NYSH[GetWarMap(i,j,2)]=0
				end				 
			end
			
		end
	end
	
	if fightnum==2 then level=level end
	
	local dhxg=JY.Wugong[wugong]["�书����&��Ч"]
	if WAR.LXZQ==1 then
	   dhxg=71
	elseif WAR.JSYX==1 then
	   dhxg=84
	elseif WAR.ASKD==1 then
	   dhxg=65
	elseif  WAR.GCTJ==1 then
	   dhxg=108
	end
    War_ShowFight(pid,wugong,JY.Wugong[wugong]["�书����"],level,x,y,dhxg,ZHEN_ID);
	--end
	
    for i=0,WAR.PersonNum-1 do
        WAR.Person[i]["����"]=0;
    end

    WAR.Person[WAR.CurID]["����"]=WAR.Person[WAR.CurID]["����"]+2;
	
	local rz=0
	if WAR.Person[id]["�ҷ�"] then--and inteam(pid) then
	
	else
		rz=40 
	end
	
	--if JY.WGLVXS==1 then rz=100 end

	if inteam(pid) then
		if JY.Person[pid]["�书�ȼ�" .. wugongnum]<900 then
			JY.Person[pid]["�书�ȼ�" .. wugongnum]=JY.Person[pid]["�书�ȼ�" .. wugongnum]+2+Rnd(2);
		elseif JY.Person[pid]["�书�ȼ�" .. wugongnum]<999 then
			JY.Person[pid]["�书�ȼ�" .. wugongnum]=JY.Person[pid]["�书�ȼ�" .. wugongnum]+math.modf(JY.Person[pid]["����"]/15+math.random(2))+rz
			if JY.Person[pid]["�书�ȼ�" .. wugongnum]>= 999 then    --�书������
				JY.Person[pid]["�书�ȼ�" .. wugongnum]=999
				PlayWavAtk(42) 
				DrawStrBoxWaitKey(string.format(CC.WARS76,JY.Person[pid]["����"],JY.Wugong[JY.Person[pid]["�书" .. wugongnum]]["����"]),C_ORANGE,CC.DefaultFont)
				ShowScreen();
				lib.Delay(200);
				Cls();
				ShowScreen();
				if pid==38 and JY.Person[pid]["�书" .. wugongnum]==102 then
				   say(CC.say2,38)
				   DrawStrBoxWaitKey(CC.say3,C_ORANGE,CC.DefaultFont)
				   ShowScreen();
				   JY.Person[38]['�Ṧ']=JY.Person[38]['�Ṧ']+50
				end
			end
		end
	end

    if math.modf(JY.Person[pid]["�书�ȼ�" .. wugongnum]/100)+1 > level then    --�书������
        level=math.modf(JY.Person[pid]["�书�ȼ�" .. wugongnum]/100)+1;
        DrawStrBox(-1,-1,string.format(CC.WARS77,JY.Wugong[JY.Person[pid]["�书" .. wugongnum]]["����"],level),C_ORANGE,CC.DefaultFont)
        ShowScreen();
        lib.Delay(500);
        Cls();
        ShowScreen();
    end
	if WAR.Person[WAR.CurID]["�ҷ�"] then  --������������
		local nl
		if JY.Person[pid]["�书"..wugongnum]==43 then
			nl=math.modf((level+3)/2)*JY.Wugong[wugong]["������������"]
			if nl>400 then nl=400 end
			if pid==51 then nl=math.modf(nl/2) end
		else
			nl=math.modf((level+3)/2)*JY.Wugong[wugong]["������������"]
		end
                
                for i=1,10 do
                   if JY.Person[pid]["�书"..i]==99 then
                       nl=nl-math.modf(nl*(JY.Person[pid]["�书�ȼ�"..i]/100*0.05))
                   end
                end
		AddPersonAttrib(pid,"����",-nl)
	else
		if GetS(0,0,0,0)~=1 then
			AddPersonAttrib(pid,"����",-math.modf((level+1)/3)*JY.Wugong[wugong]["������������"])
		else
			AddPersonAttrib(pid,"����",-math.modf((level+1)/6)*JY.Wugong[wugong]["������������"])
		end
	end
	if JY.Person[pid]["����"]<0 then JY.Person[pid]["����"]=0 end
	
	if JY.Person[pid]["����"]<=0 then break end

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
		if WAR.Person[WAR.CurID]["�ҷ�"] then
		   AddPersonAttrib(pid,"����",-jtl)
		else
		   AddPersonAttrib(pid,"����",-2)
		end
    end
		   
        
	local dz={}
	local dznum=0
	for i=0,WAR.PersonNum-1 do
		if WAR.Person[i]["�����书"]~=-1 and WAR.Person[i]["�����书"]~=9999 then  			--
			dznum=dznum+1
			dz[dznum]={i,WAR.Person[i]["�����书"],x-WAR.Person[WAR.CurID]["����X"],y-WAR.Person[WAR.CurID]["����Y"]}
			WAR.Person[i]["�����书"]=9999
		end
	end	
		
	for i = 1, dznum do
		local tmp=WAR.CurID
		WAR.CurID=dz[i][1]
		WAR.DZXY=1
		if WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]==1 then
		   WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]=60
		elseif WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]==2 then
		   WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]=85
		elseif WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]==3 then
		   WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]=110
		end
		--lib.Delay(100)
		War_Fight_Sub(dz[i][1],dz[i][2]+100,dz[i][3],dz[1][4])--dz[i][3],dz[i][4])          --ִ��ս��
		WAR.Person[WAR.CurID]["�����书"]=-1
		WAR.DZXYLV[WAR.Person[WAR.CurID]["������"]]=nil
		WAR.CurID=tmp
        WAR.DZXY=0			
	end
	
	if WAR.YTFS==-1 then	    
	    for i=0,WAR.PersonNum-1 do
		      if WAR.Person[i]["������"]==0 and T2SQ(WAR.Person[i]["������"]) then--and JY.Person[0]["����"]>0 then
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
				 War_Fight_Sub(i,2,WAR.Person[i]["����X"],WAR.Person[i]["����Y"])
		         WAR.SQFJ=0
				 for w=1,10 do
				        if JY.Person[0]["�书"..w]==JY.Person[0]["�书2"] and w~=2 then
				           JY.Person[0]["�书2"]=WAR.YT1
				           JY.Person[0]["�书�ȼ�2"]=WAR.YT2
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

function myrandom(p,pp) --����
	for i=0,WAR.PersonNum-1 do
		local pid=WAR.Person[i]["������"];
		if WAR.Person[i]["����"]==false and pid==76 then
			if inteam(pp) then
				p=p+5;
			end
			break;
		end
	end
	for i=1,10 do
		if JY.Person[pp]["�书"..i]==102 then
			p=p+(math.modf(JY.Person[pp]["�书�ȼ�"..i]/100)+1);
			break;
		end
	end	
	p=math.modf(p+JY.Person[pp]["�������ֵ"]*4/(JY.Person[pp]["����"]+20)+JY.Person[pp]["����"]/20)	
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
	p=p+limitX(math.modf(JY.Person[pp]['����']/500),0,20);
	--DrawStrBoxWaitKey(string.format("%4d",p),C_GOLD,30)
	local times=1;
	if inteam(pp) then
		if math.random(120)-10>JY.Person[pp]['����'] then
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
			luck=100-JY.Person[pp]['����']
		else
			luck=100
			p=p*3
		end
		p=p+math.modf(JY.Person[pp]['����']/400)
		if math.random(100)<=luck then
			if math.random(100)<=p then
				return true
			end
		end
	end
	]]--
	return false
end

function War_Direct(x1,y1,x2,y2)             --�����˷���
--�����˷���
--(x1,y1) ��λ��     -(x2,y2) Ŀ��λ��
--���أ� ����
    local x=x2-x1;
    local y=y2-y1;
	if x==0 and y==0 then
		return WAR.Person[WAR.CurID]["�˷���"]
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

function KungfuString(str,x,y,color,size,font,place)					--������ʾ�书����Ч����
	if str==nil then return end
	local w,h=size,size+5;
	local len=string.len(str)/2
	x=x-len*w/2
	y=y-h*place
	lib.DrawStr(x,y,str,color,size,font,0,0)
end

function War_ShowFight(pid,wugong,wugongtype,level,x,y,eft,ZHEN_ID)              --��ʾս������
--��ʾս������
--pid ��id
--wugong  �书��ţ� 0 ��ʾ�ö��ⶾ�ȣ�ʹ����ͨ����Ч��
--wogongtype =0 ҽ���ö��ⶾ��1,2,3,4 �书����  -1 ����
--level �书�ȼ�
--x,y ��������
--eft  �书����Ч��id  eft.idx/grp�е�Ч��
	ZHEN_ID=ZHEN_ID or -1
	local x0=WAR.Person[WAR.CurID]["����X"];
	local y0=WAR.Person[WAR.CurID]["����Y"];
		
	if wugong==47 or pid==114 then
		eft=math.random(100)
	end	
	
	local ZHEN_pid;
	local ZHEN_type;
	local ZHEN_startframe;
	local ZHEN_fightframe;
	if ZHEN_ID>=0 then
		ZHEN_pid=WAR.Person[ZHEN_ID]["������"];
		ZHEN_type=wugongtype;
		ZHEN_startframe=0;
		ZHEN_fightframe=0;
	end
	
    local fightdelay,fightframe,sounddelay;
    if wugongtype>=0 then
        fightdelay=JY.Person[pid]["���ж����ӳ�" .. wugongtype+1];
        fightframe=JY.Person[pid]["���ж���֡��" .. wugongtype+1];
        sounddelay=JY.Person[pid]["�书��Ч�ӳ�" .. wugongtype+1];
    else            ---��������Щ����ʲô��˼����
        fightdelay=0;
        fightframe=-1;
        sounddelay=-1;
    end
	--����Щû�ж���֡���ģ�ʹ��Ĭ�ϵ�֡��
	if fightdelay==0 or fightframe==0 then
		for i=1,5 do
			if JY.Person[pid]["���ж���֡��"..i]~=0 then
				fightdelay=JY.Person[pid]["���ж����ӳ�"..i];
				fightframe=JY.Person[pid]["���ж���֡��"..i];
				sounddelay=JY.Person[pid]["�书��Ч�ӳ�"..i];
				wugongtype=i-1
			end
		end		
	end
	if ZHEN_ID>=0 then
		if JY.Person[ZHEN_pid]["���ж���֡��" .. ZHEN_type+1]==0 then
			for i=1,5 do
				if JY.Person[ZHEN_pid]["���ж���֡��"..i]~=0 then
					ZHEN_type=i-1;
					ZHEN_fightframe=JY.Person[ZHEN_pid]["���ж���֡��"..i];
				end
			end
		else
			ZHEN_fightframe=JY.Person[ZHEN_pid]["���ж���֡��"..ZHEN_type+1];
		end
	end
	
    local framenum=fightdelay+CC.Effect[eft];            --��֡��

    local startframe=0;               --����fignt***�е�ǰ������ʼ֡
    if wugongtype>=0 then
        for i=0,wugongtype-1 do
            startframe=startframe+4*JY.Person[pid]["���ж���֡��" .. i+1];
        end
    end
	if ZHEN_ID>=0 then
		if ZHEN_type>=0 then
			for i=0,ZHEN_type-1 do
				ZHEN_startframe=ZHEN_startframe+4*JY.Person[ZHEN_pid]["���ж���֡��" .. i+1];
			end
		end
	end
	
    local starteft=0;          --������ʼ�书Ч��֡
    for i=0,eft-1 do
        starteft=starteft+CC.Effect[i];
    end

	WAR.Person[WAR.CurID]["��ͼ����"]=0;
	WAR.Person[WAR.CurID]["��ͼ"]=WarCalPersonPic(WAR.CurID);
	if ZHEN_ID>=0 then
		WAR.Person[ZHEN_ID]["��ͼ����"]=0;
		WAR.Person[ZHEN_ID]["��ͼ"]=WarCalPersonPic(ZHEN_ID);
	end

    --WarSetPerson();

	--WarDrawMap(0);
	--ShowScreen();

    local fastdraw;
    if CONFIG.FastShowScreen==0 or CC.AutoWarShowHead==1 then    --��ʾͷ����ȫ���ػ�
        fastdraw=0;
	else
	    fastdraw=1;
	end

    --����ʾ����ǰ�ȼ�����ͼ
    local oldpic=WAR.Person[WAR.CurID]["��ͼ"]/2;
	local oldpic_type=0;

    local oldeft=-1;
	local kfname=JY.Wugong[wugong]["����"]
	local showsize=32
	local showx=CC.ScreenW/2-showsize*string.len(kfname)/4

    for i=0,framenum-1 do
        local tstart=lib.GetTime();
		local mytype;
        if fightframe>0 then
            WAR.Person[WAR.CurID]["��ͼ����"]=1;
		    mytype=4+WAR.CurID;
            if i<fightframe then
                WAR.Person[WAR.CurID]["��ͼ"]=(startframe+WAR.Person[WAR.CurID]["�˷���"]*fightframe+i)*2;
            end
        else       --��������ʹ��fight��ͼ��
            WAR.Person[WAR.CurID]["��ͼ����"]=0;
            WAR.Person[WAR.CurID]["��ͼ"]=WarCalPersonPic(WAR.CurID);
			mytype=0;
        end
		
		if ZHEN_ID>=0 then
			if ZHEN_fightframe>0 then
				WAR.Person[ZHEN_ID]["��ͼ����"]=1;
				if i<ZHEN_fightframe and i<framenum-1 then
					WAR.Person[ZHEN_ID]["��ͼ"]=(ZHEN_startframe+WAR.Person[ZHEN_ID]["�˷���"]*ZHEN_fightframe+i)*2;
				else
					WAR.Person[ZHEN_ID]["��ͼ"]=WarCalPersonPic(ZHEN_ID);
				end
			else
				WAR.Person[ZHEN_ID]["��ͼ����"]=0;
				WAR.Person[ZHEN_ID]["��ͼ"]=WarCalPersonPic(ZHEN_ID);
			end
			SetWarMap(WAR.Person[ZHEN_ID]["����X"],WAR.Person[ZHEN_ID]["����Y"],5,WAR.Person[ZHEN_ID]["��ͼ"]);
		end

        if i==sounddelay then
            PlayWavAtk(JY.Wugong[wugong]["������Ч"]);
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
		
		local pic=WAR.Person[WAR.CurID]["��ͼ"]/2;
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

		if i<fightdelay then   --ֻ��ʾ����
		
		    WarDrawMap(4,pic*2,mytype,-1);
			local hb=GetS(JY.SubScene,x0,y0,4)--[[
				local dx=WAR.Person[WAR.CurID]["����X"]-WAR.Person[WAR.CurID]["����X"]
				local dy=WAR.Person[i]["����Y"]-WAR.Person[WAR.CurID]["����Y"]
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
		else		--ͬʱ��ʾ�书Ч��
            starteft=starteft+1;            --�˴��ƺ���eft��һ�����������⣬Ӧ����10����Ϊ9����˼�1

			if fastdraw==1 then
				local clip1={};
				clip1=Cal_PicClip(WAR.EffectXY[1][1]-x0,WAR.EffectXY[1][2]-y0,oldeft,3,
										WAR.EffectXY[1][1]-x0,WAR.EffectXY[1][2]-y0,starteft,3);
				local clip2={};
				clip2=Cal_PicClip(WAR.EffectXY[2][1]-x0,WAR.EffectXY[2][2]-y0,oldeft,3,
										WAR.EffectXY[2][1]-x0,WAR.EffectXY[2][2]-y0,starteft,3);
				local clip=ClipRect(MergeRect(clip1,clip2));

				if clip ~=nil then
					local area=(clip.x2-clip.x1)*(clip.y2-clip.y1);          --������������
					if area <CC.ScreenW*CC.ScreenH/2 then        --����㹻С�����������Ρ�
						WarDrawMap(4,pic*2,mytype,starteft*2);
						lib.SetClip(clip.x1,clip.y1,clip.x2,clip.y2);
						WarDrawMap(4,pic*2,mytype,starteft*2);
					else    --���̫��ֱ���ػ�
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
				DrawStrBox(CC.ScreenW/2-48,6,"˫�˺ϻ�",C_WHITE,24)
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
    WAR.Person[WAR.CurID]["��ͼ����"]=0;
    WAR.Person[WAR.CurID]["��ͼ"]=WarCalPersonPic(WAR.CurID);
    WarSetPerson();
    WarDrawMap(0);

    ShowScreen();
    lib.Delay(200);

    WarDrawMap(2);          --ȫ����ʾ��������
    ShowScreen();
    lib.Delay(200);

    WarDrawMap(0);
    ShowScreen();

    local HitXY={};               --��¼���е���������
	local HitXYNum=0;
    for i = 0, WAR.PersonNum-1 do
	    local x1=WAR.Person[i]["����X"];
	    local y1=WAR.Person[i]["����Y"];		
		if WAR.Person[i]["����"]==false then
 		    if GetWarMap(x1,y1,4)>1 then
				SetWarMap(x1,y1,4,1)
			    local n=WAR.Person[i]["����"]
				--lib.Debug(i..','..n)
					if n==0 then
						HitXY[HitXYNum]={x1,y1,"miss","  ","  "};						
					else
					  if WAR.FXXS[WAR.Person[i]["������"]]==1 then
						HitXY[HitXYNum]={x1,y1,string.format("%d",n),"��Ѩ"};
						WAR.FXXS[WAR.Person[i]["������"]]=0
					  else
					    HitXY[HitXYNum]={x1,y1,string.format("%d",n),"  "};
					  end
                      if WAR.LXXS[WAR.Person[i]["������"]]==1 then	
                          HitXY[HitXYNum][5]="��Ѫ"
						  WAR.LXXS[WAR.Person[i]["������"]]=0
					  else
					      HitXY[HitXYNum][5]="  "
					  end
					end
				HitXYNum=HitXYNum+1;
				if WAR.TD>-1 then
				   if WAR.TD==118 then
				      say("������������������͵ż�Ķ�ת���ƣ�û�Ŷ���Ҫ��ö�ת�´ξ͹ԹԸ�ż�����ɣ�",51)
				   else
				      instruct_2(WAR.TD,1) 
				   end
				   WAR.TD=-1
				end
				
 		    end
		end
	end
	
	--��ʾ�ط���Ч
	--for x=0,63 do			--������Ĳ㣬�ͺ������Щ��ͻ����ʱ�Ȳ�����--���ˣ�����Ӧ�ò���ͻ��
	--	for y=0,63 do SetWarMap(x,y,4,0) end
	--end
	--local fanji=false
	--for i = 0, WAR.PersonNum-1 do
	--	if WAR.Person[i][CC.TXDH]>100 then fanji=true break end;
	--	if WAR.Person[i][CC.TXDH]~=-1 then SetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],4,1) end
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
				local dx=WAR.Person[i]["����X"]-x0--WAR.Person[WAR.CurID]["����X"]
				local dy=WAR.Person[i]["����Y"]-y0--WAR.Person[WAR.CurID]["����Y"]
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
	local clips={};                --�������е���clip
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
    for i=5,15 do           --��ʾ���еĵ���
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
		else    --���̫��ֱ���ػ�  YCXS
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

function War_WugongHurtLife(emenyid,wugong,level,ang)             --�����书�˺�����
--�书�˺�����
--enemyid ����ս��id��
--wugong  �ҷ�ʹ���书
--���أ��˺�����
    local pid=WAR.Person[WAR.CurID]["������"];
    local eid=WAR.Person[emenyid]["������"];
	local dng=0
	local WGLX=JY.Wugong[wugong]["�书����"]
	local function DWPD()
     if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then
	   return true;
	 else
	   return false;
	 end
    end
    --������ѧ��ʶ
    local mywuxue=0;
    local emenywuxue=0;
    for i=0,WAR.PersonNum-1 do
        local id =WAR.Person[i]["������"]
        if WAR.Person[i]["����"]==false and JY.Person[id]["��ѧ��ʶ"]>10 then
            if WAR.Person[WAR.CurID]["�ҷ�"]==WAR.Person[i]["�ҷ�"] then
				if JY.Person[id]["��ѧ��ʶ"]>mywuxue then
					mywuxue=JY.Person[id]["��ѧ��ʶ"];
				end
            end
			if WAR.Person[emenyid]["�ҷ�"]==WAR.Person[i]["�ҷ�"] then
				if JY.Person[id]["��ѧ��ʶ"]>emenywuxue then
					emenywuxue=JY.Person[id]["��ѧ��ʶ"];
                                        if emenywuxue<50 then
                                           emenywuxue=50
                                        end
				end
            end
        end
    end

    --����ʵ��ʹ���书�ȼ�
    while true do
        if math.modf((level+1)/2)*JY.Wugong[wugong]["������������"] > JY.Person[pid]["����"] then
            level=level-1;
        else
            break;
        end
    end

    if level<=0 then     --��ֹ�������һ���ʱ��һ�ι�����ϣ��ڶ��ι���û�������������
	    level=1;
    end
	
	for i=1,10 do
		local kfid=JY.Person[eid]['�书'..i]
		if kfid>88 and kfid<109 and kfid~=97 and WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then
			if kfid==95 then
				if myrandom(20,eid) then
					WAR.Person[emenyid][CC.TXWZ2]=JY.Wugong[kfid]['����']..'����'
					WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85;
					local lv=math.modf(JY.Person[eid]['�书�ȼ�'..i]/100)+1;
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
				local lv=math.modf(JY.Person[eid]['�书�ȼ�'..i]/100)+1
				local wl=JY.Wugong[kfid]['������'..lv]
				if wl>dng then
					dng=wl
					WAR.Person[emenyid][CC.TXWZ2]=JY.Wugong[kfid]['����']..'����'					
					WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85--JY.Wugong[kfid]["�书����&��Ч"]
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
	  if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then
	   local t=math.random(4);
	   local mc=JY.Wugong[91]["����"]
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
		local kfid=JY.Person[eid]['�书'..i]
		if kfid==43 and JY.Person[eid]["����"]>10 and WAR.Person[emenyid]["�����书"]==-1 and WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then			
			if JLSD(30,70,eid) or (eid==51 and JLSD(20,80,eid)) or (WAR.tmp[1000+eid]==1 and JLSD(30,70,eid)) then
			    local p=JY.Person[eid]
			    local dzlv=p["ȭ�ƹ���"]+p["��������"]+p["ˣ������"]+p["�������"]
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
				WAR.Person[emenyid]["�����书"]=wugong;
				JY.Person[eid]["����"]=JY.Person[eid]["����"]-3
				break
			end
		end
	end
	
	local hurt;
	if level>10 then 
		hurt=JY.Wugong[wugong]["������" .. 10]/3
		level=10
	else
		hurt=JY.Wugong[wugong]["������" .. level]/4
	end
	if wugong==64 and pid==0 and GetS(4,5,5,5)==3 then
	   hurt=hurt+math.modf(GetS(14,3,1,4)/3+1)
	end
    for i,v in ipairs(CC.ExtraOffense) do
        if v[1]==JY.Person[pid]["����"] and v[2]==wugong then
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
	
	local atk=JY.Person[pid]["������"];
	local def=JY.Person[eid]["������"];
	
	if JY.Status==GAME_WMAP then
		for i,v in pairs(CC.AddAtk) do
			if v[1]==pid then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["������"]==v[2] and  WAR.Person[wid]["����"]==false then
						atk=atk+v[3];
					end
				end
			end
		end
		
		for i,v in pairs(CC.AddDef) do
			if v[1]==eid then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["������"]==v[2] and  WAR.Person[wid]["����"]==false then
						def=def+v[3];
					end
				end
			end
		end
	end
	
	local t
	local function getnl(id)
		return (JY.Person[id]["����"]*2+JY.Person[id]["�������ֵ"])/3
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
		if GetS(0,0,0,0)~=1 then --WAR.Person[WAR.CurID]["�ҷ�"] and inteam(pid) 
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
    if JY.Person[pid]["����"]>=0 then
        hurt=hurt+myrnd(JY.Thing[JY.Person[pid]["����"]]["�ӹ�����"]);
    end
    if JY.Person[pid]["����"]>=0 then
        hurt=hurt+myrnd(JY.Thing[JY.Person[pid]["����"]]["�ӹ�����"]);
    end
    if JY.Person[eid]["����"]>=0 then
        hurt=hurt-myrnd(JY.Thing[JY.Person[eid]["����"]]["�ӷ�����"]);
    end
    if JY.Person[eid]["����"]>=0 then
        hurt=hurt-myrnd(JY.Thing[JY.Person[eid]["����"]]["�ӷ�����"]);
    end
	
	hurt=hurt-def/8--JY.Person[eid]["������"]/8-JY.Person[eid]["����"]/200
	
    hurt=hurt-dng/30+JY.Person[pid]["����"]/5-JY.Person[eid]["����"]/5+JY.Person[eid]["���˳̶�"]/3-JY.Person[pid]["���˳̶�"]/3+JY.Person[eid]["�ж��̶�"]/2-JY.Person[pid]["�ж��̶�"]/2;
	--[[
	local dlv=JY.Person[pid]["�ȼ�"]-JY.Person[eid]["�ȼ�"]
	if dlv>30 then dlv=30
	elseif dlv<-30 then dlv=-30 end	
	if (WAR.Person[WAR.CurID]["�ҷ�"] and dlv<0) or (WAR.Person[WAR.CurID]["�ҷ�"]==false and dlv>0) then
		hurt=hurt+dlv
	end--]]
	--[[
    if hurt <0 then
        hurt=Rnd(10)+myrnd(JY.Person[eid]["����"]/100)+1;
    end
	--]]
    --���Ǿ�������
	if inteam(pid) then--WAR.Person[WAR.CurID]["�ҷ�"] and inteam(pid)
		local offset=math.abs(WAR.Person[WAR.CurID]["����X"]-WAR.Person[emenyid]["����X"])+
					math.abs(WAR.Person[WAR.CurID]["����Y"]-WAR.Person[emenyid]["����Y"]);

		if offset <10 then
			hurt=hurt*(100-(offset-1)*3)/100;
		else
			hurt=hurt*2/3;
		end
	end
	
       if WAR.BJ==1 then
	      local SLWX=0
          for i=1,10 do
		        if JY.Person[eid]["�书" .. i]==106 or JY.Person[eid]["�书" .. i]==107 then
		           SLWX=SLWX+1
				end
		  end
          if JY.Person[eid]["��������"]==2	or (eid==0 and GetS(4,5,5,5)==5) then SLWX=SLWX+1 end
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
	    
	   if pid==37 and JY.Person[0]["Ʒ��"]>70 then 
	      hurt=math.modf((1+(JY.Person[0]["Ʒ��"]-70)/100)*hurt)
	   end
	   
	   if pid==63 and JY.Person[pid]["����"]<math.modf(JY.Person[pid]["�������ֵ"]/2) then
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
				if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
				   if JY.Person[WAR.Person[j]["������"]]["�Ա�"]==1 then
					  s=s+1
				   end
				end
			end
	   	   hurt=math.modf(hurt*(1+s/10))
	   end
	   
	for i=1,10 do
	    if JY.Person[pid]["�书"..i]==107 and (JY.Person[pid]["��������"]==0 or (pid==0 and GetS(4,5,5,5)==5)) then
		   hurt=math.modf(hurt*1.2);
		   break
		end
	end
	
	for i=1,10 do
	    if JY.Person[eid]["�书"..i]==106 and (JY.Person[eid]["��������"]==1 or (eid==0 and GetS(4,5,5,5)==5)) then
		   hurt=math.modf(hurt*0.8);
		   break
		end
	end
	
	if GetS(4,5,5,5)==1 and pid==0 then
	   local lxzq=0;
	    for i=1,10 do
	        if JY.Person[0]["�书"..i]==109 or (JY.Person[0]["�书"..i]<27 and JY.Person[0]["�书"..i]>0) then
			    if JY.Person[0]["�书�ȼ�"..i]==999 then
				   lxzq=lxzq+1
				end
			end
		end
	        hurt=math.modf(hurt*(1+0.05*lxzq)); 
	end
	
	if GetS(4,5,5,5)==3 and eid==0 then
	   local askd=0;
	    for i=1,10 do
	        if JY.Person[0]["�书"..i]==111 or (JY.Person[0]["�书"..i]<68 and JY.Person[0]["�书"..i]>49) then
			    if JY.Person[0]["�书�ȼ�"..i]==999 then
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
	         if JY.Person[79]["�书"..i]<50 and JY.Person[79]["�书"..i]>26 then
			    if JY.Person[79]["�书�ȼ�"..i]==999 then
				   JF=JF+1
				end
		     end
	   end
	   hurt=math.modf(hurt*(1+0.05*JF));
	end
				
	
	if not inteam(pid) then 
	     for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["������"]==87 or WAR.Person[j]["������"]==74 then
	            if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then			    
		            hurt=math.modf(hurt*0.9);
			    end
			end
		 end
	end
	
	if inteam(pid) then 
	     for j=0,WAR.PersonNum-1 do
		    if WAR.Person[j]["������"]==86 or WAR.Person[j]["������"]==80 then
	            if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then			    
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
	
	
	if inteam(pid) then hurt=math.modf(hurt*(1-JY.Person[pid]["���˳̶�"]*0.002)) end
	if inteam(eid) then hurt=math.modf(hurt*(1+JY.Person[pid]["���˳̶�"]*0.0015)) end
		
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
	                   if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then                            			   			                   
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
	                   if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[emenyid]["�ҷ�"] then                            			   			                   
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
	    JY.Person[eid]["�ж��̶�"]=JY.Person[eid]["�ж��̶�"]+15
		if JY.Person[eid]["�ж��̶�"]>100 then JY.Person[eid]["�ж��̶�"]=100 end
	end
	
	if eid==114 then hurt=math.modf(hurt*0.6) end
		
	if eid==5 and math.random(10)<8 then
	   WAR.Person[emenyid][CC.TXWZ3]=CC.WARS93
	   WAR.Person[emenyid][CC.TXDH]=math.fmod(99,10)+85
	   hurt=math.modf(hurt*0.5);
	end
	
	local defadd=0;
	if wugong<109 and wugong>88 then 
	   JY.Wugong[wugong]["�书����"]=math.random(4) 
	end
	if JY.Wugong[wugong]["�书����"]==1 then
		defadd=JY.Person[eid]["ȭ�ƹ���"];
	elseif JY.Wugong[wugong]["�书����"]==2 then
		defadd=JY.Person[eid]["��������"];
	elseif JY.Wugong[wugong]["�书����"]==3 then
		defadd=JY.Person[eid]["ˣ������"];
	elseif JY.Wugong[wugong]["�书����"]==4 then
		defadd=JY.Person[eid]["�������"];
	end
	hurt=math.modf(hurt*limitX(1.2-defadd/240,0.2,1.2));	
	
	if eid==35 and GetS(10,1,1,0)==1 and JLSD(15,85,eid) then
	 if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then
	   if JY.Wugong[wugong]["�书����"]==1 then
	      WAR.Person[emenyid][CC.TXWZ3]=CC.WARS99
	   elseif JY.Wugong[wugong]["�书����"]==2 then 
		  WAR.Person[emenyid][CC.TXWZ3]=CC.WARS100
	   elseif JY.Wugong[wugong]["�书����"]==3 then
	      WAR.Person[emenyid][CC.TXWZ3]=CC.WARS101
	   elseif JY.Wugong[wugong]["�书����"]==4 then
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
	   hurt=math.modf(hurt*JY.Person[eid]["����"]/JY.Person[eid]["�������ֵ"])
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
	         if JY.Person[eid]["�书"..i]==105 and math.random(10)<6 then
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
	        if JY.Person[0]["�书"..i]==112 or (JY.Person[0]["�书"..i]<85 and JY.Person[0]["�书"..i]>67) then
			    if JY.Person[0]["�书�ȼ�"..i]==999 then
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
	
	for i=1,10 do  --Ǭ����Ų���˺�����
		local kfid=JY.Person[eid]['�书'..i]
		if WAR.QKNY<2 and kfid==97 and WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and pid~=114 and pid~=50 then
			local lv=math.modf(JY.Person[eid]['�书�ȼ�'..i]/100)+1
			if (hurt>20 and math.random(10)<5) or (eid==9 and hurt>20 and math.random(10)<7) then			  			  
				--WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['����']..'����'
				--SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],4,2)
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
                    if WAR.Person[i]["�ҷ�"]~=WAR.Person[emenyid]["�ҷ�"] and WAR.Person[i]["����"]==false then
				         nydx[nynum]=i
						 nynum=nynum+1
					end
				end
				local nyft=nydx[math.random(nynum-1)];
				local nyft2=nydx[math.random(nynum-1)];
				--SetWarMap(WAR.Person[nyft]["����X"],WAR.Person[nyft]["����Y"],4,2)
				JY.Person[WAR.Person[nyft]["������"]]["����"]=JY.Person[WAR.Person[nyft]["������"]]["����"]-math.modf(WAR.fthurt/2+Rnd(3))
				if JY.Person[WAR.Person[nyft]["������"]]["����"]<1 then 
				   JY.Person[WAR.Person[nyft]["������"]]["����"]=0 				   
				end
				--WAR.Person[nyft]["����"]=-fthurt
				WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['����']..CC.WARS106--..JY.Person[WAR.Person[nyft]["������"]]["����"]
				WAR.NYSH[nyft]=1
				if eid==9 and nyft~=nyft2 then
				    --SetWarMap(WAR.Person[nyft2]["����X"],WAR.Person[nyft2]["����Y"],4,2)
					JY.Person[WAR.Person[nyft2]["������"]]["����"]=JY.Person[WAR.Person[nyft2]["������"]]["����"]-math.modf(WAR.fthurt/2+Rnd(3))
					if JY.Person[WAR.Person[nyft2]["������"]]["����"]<1 then JY.Person[WAR.Person[nyft2]["������"]]["����"]=0 end
					--WAR.Person[nyft2]["����"]=-fthurt
					WAR.Person[emenyid][CC.TXWZ1]=WAR.Person[emenyid][CC.TXWZ1]..CC.WARS107--"+"..JY.Person[WAR.Person[nyft2]["������"]]["����"]
				    WAR.NYSH[nyft2]=1
				end
				--[[JY.Person[pid]["����"]=JY.Person[pid]["����"]-math.modf(selfhurt/2)
				if JY.Person[pid]["����"]<=0 then JY.Person[pid]["����"]=1 end
				WAR.Person[WAR.CurID]["����"]=-selfhurt]]
				WAR.QKNY=WAR.QKNY+1
				 if WAR.Person[emenyid][CC.TXDH]==-1 then
				    WAR.Person[emenyid][CC.TXDH]=math.fmod(97,10)+85--JY.Wugong[kfid]["�书����&��Ч"]
			     end				 
				break
			end
		elseif WAR.tmp[1000+eid]~=1 and WAR.ZDDH~=171 and eid==60 then --(kfid==104 and inteam(eid) or eid==60) 
			local lv=math.modf(JY.Person[eid]['�书�ȼ�'..i]/100)+1
			if ((hurt>150 and JLSD(45,60,eid)) or eid==60 or hurt>350) and JY.Person[eid]["����"]>50 then
				WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85--JY.Wugong[kfid]["�书����&��Ч"]
				if eid==60 then
				WAR.Person[emenyid][CC.TXWZ1]=CC.WARS108
				else
				WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['����']..CC.WARS109
				end
				WAR.tmp[1000+eid]=1;
				break;
			end
		end
	end
	
	if eid==9 and WAR.Person[emenyid][CC.TXWZ1]==nil then
	   if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and hurt>10 and PersonKF(9,106) then --ZWJ
		   WAR.Person[emenyid][CC.TXDH]=math.fmod(97,10)+85
		   WAR.Person[emenyid][CC.TXWZ1]=CC.WARS110
		   SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],4,2)
		   local selfhurt=math.modf(hurt*0.3)
		   JY.Person[pid]["����"]=JY.Person[pid]["����"]-math.modf(selfhurt/2)
		   WAR.Person[WAR.CurID]["����"]=-selfhurt
		   if JY.Person[pid]["����"]<=0 then JY.Person[pid]["����"]=0 end
	    end
    end
	
	if WAR.Person[WAR.CurID]["�ҷ�"]==WAR.Person[emenyid]["�ҷ�"] and WAR.tmp[1000+pid]==nil then
		if WAR.Person[WAR.CurID]["�ҷ�"] then		    
            hurt=math.modf(hurt*0.5)+Rnd(3)	          		   
		else
			hurt=math.modf(hurt*0.2)+Rnd(3)
		end
	end
	
	if inteam(eid) then--WAR.Person[emenyid]["�ҷ�"] then--or GetS(0,0,0,0)~=1 then
		JY.Person[eid]["����"]=JY.Person[eid]["����"]-hurt;
	else
		JY.Person[eid]["����"]=JY.Person[eid]["����"]-math.modf(hurt*0.5);
	end
	
	for i=1,10 do
		local kfid=JY.Person[eid]['�书'..i]
		if kfid==16 then
			if WAR.tmp[3000+eid]==nil then
				WAR.tmp[3000+eid]=0;
			end
			WAR.tmp[3000+eid]=hurt;--+WAR.tmp[3000+eid];
		end
	end
	
    WAR.Person[WAR.CurID]["����"]=WAR.Person[WAR.CurID]["����"]+math.modf(hurt/5);
	
	if JY.Person[eid]["����"]<=0 then  --������������
		for i=1,10 do
			local kfid=JY.Person[eid]['�书'..i]
		if kfid==94 and WAR.tmp[2000+eid]==nil then
				WAR.Person[emenyid][CC.TXDH]=math.fmod(kfid,10)+85--JY.Wugong[kfid]["�书����&��Ч"]								
				WAR.Person[emenyid][CC.TXWZ1]=JY.Wugong[kfid]['����']..CC.WARS111			
				local lv=math.modf(JY.Person[eid]['�书�ȼ�'..i]/100)+1				
				if eid==37 then
				JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
				else
				JY.Person[eid]["����"]=math.modf(JY.Person[eid]["�������ֵ"]*(1+lv)/25)
				end
				JY.Person[eid]["����"]=math.modf((JY.Person[eid]["����"]+JY.Person[eid]["�������ֵ"])/2)
				JY.Person[eid]["����"]=math.modf((JY.Person[eid]["����"]+50)/2)
				JY.Person[eid]["�ж��̶�"]=math.modf(JY.Person[eid]["�ж��̶�"]/2)
				JY.Person[eid]["���˳̶�"]=math.modf(JY.Person[eid]["���˳̶�"]/2)
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
	
	if JY.Person[eid]["����"]<=0 and (eid==129 or eid==65) and WAR.WCY<1 then
	   WAR.Person[emenyid][CC.TXDH]=19
	   WAR.Person[emenyid][CC.TXWZ1]=CC.WARS112
	   WAR.WCY=WAR.WCY+1
	   JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
	   JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
	   JY.Person[eid]["�ж��̶�"]=0
	   JY.Person[eid]["���˳̶�"]=0
	   JY.Person[eid]["����"]=100
	   WAR.Person[emenyid]["Time"]=980
	end
	
	if JY.Person[eid]["����"]<=0 and WAR.XMH==0 then 
        for i=0,WAR.PersonNum-1 do
	        if WAR.Person[i]["������"]==45 and WAR.Person[i]["����"]==false and WAR.Person[i]["�ҷ�"]==WAR.Person[emenyid]["�ҷ�"] then
	           WAR.Person[emenyid][CC.TXDH]=89
	           WAR.Person[emenyid][CC.TXWZ1]=CC.WARS113
			   JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
			   JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
			   JY.Person[eid]["�ж��̶�"]=0
			   JY.Person[eid]["���˳̶�"]=0
			   JY.Person[eid]["����"]=100
			   WAR.FXDS[eid]=nil
			   WAR.LXZT[eid]=nil
			   WAR.XMH=1
			   break
			end
		end
	end
			   
	if eid==553 and JY.Person[eid]["����"]<=0 then WAR.YZB=1 end--YZB
   
    if JY.Person[eid]["����"]<=0 then                 --�������˻�ö��⾭��
        JY.Person[eid]["����"]=0;
        WAR.Person[WAR.CurID]["����"]=WAR.Person[WAR.CurID]["����"]+JY.Person[eid]["�ȼ�"]*5;
		WAR.Person[emenyid]["�����书"]=-1
    end
	ang=ang-dng;
	if ang>0 then
		dng=0;
	else
		dng=-ang;
		ang=0;
	end
	
	if eid==114 then
	   --[[DrawStrBox(CC.ScreenW/2+200,24,"��ض���",C_ORANGE,30)
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
	     if JY.Person[eid]["�书"..i]==16 or JY.Person[eid]["�书"..i]==46 then
		    if JY.Person[eid]["�书�ȼ�"..i]==999 then
		        WAR.TJAY=WAR.TJAY+1
		    end
		end
	end
	
	if WAR.TJAY==2 and JLSD(15,45+math.modf(JY.Person[eid]["����"]/2.5),eid) then 
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
	   WAR.Person[emenyid][CC.TXWZ2]="�򽣹��ڡ���������"
	   --WAR.Person[emenyid][CC.TXDH]=21	  
	end]]
	
	if WAR.ASKD==1 then dng=0 end
	
	if dng==0 then
	    if inteam(eid) then
			if pid==80 then
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt*2/12));
				else
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt*2/6));
				end
			else
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt/12));
				else
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt/6));
				end
			end
		else
		    if pid==80 then
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt*2/16));
				else
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt*2/8));
				end
			else
				if PersonKF(eid,100) then
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt/16));
				else
				 AddPersonAttrib(eid,"���˳̶�",myrnd(hurt/8));
				end
			end
        end			
	end
	   
	if dng==0 and WAR.Person[WAR.CurID]["�ҷ�"]~=WAR.Person[emenyid]["�ҷ�"] then
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
			if JY.Person[pid]["�书"..i]==103 then
				spdhurt=math.modf(hurt*2/5);
				break;
			end
		end
		for i=1,10 do
			if JY.Person[eid]["�书"..i]==101 then
				spdhurt=0;
			end
		end
		WAR.Person[emenyid]["TimeAdd"]=WAR.Person[emenyid]["TimeAdd"]-spdhurt;		
	end

        if eid==59 and JY.Person[eid]["����"]<=0 then 
		   WAR.XK=1 
		   WAR.XK2=WAR.Person[emenyid]["�ҷ�"]
		end        
  
		if pid==60 then
		   JY.Person[eid]["�ж��̶�"]=JY.Person[eid]["�ж��̶�"]+30
		    if JY.Person[eid]["�ж��̶�"]>100 then JY.Person[eid]["�ж��̶�"]=100 end
		end
		
	    if WAR.TD==-2 then
		   local i; 
	       i=math.random(4);		   
	       if JY.Person[eid]["Я����Ʒ����"..i]>0 and JY.Person[eid]["Я����Ʒ"..i]>-1 and WAR.Person[WAR.CurID]["�ҷ�"]~=WAR.Person[emenyid]["�ҷ�"] then
		      JY.Person[eid]["Я����Ʒ����"..i]=JY.Person[eid]["Я����Ʒ����"..i]-1
			  WAR.TD=JY.Person[eid]["Я����Ʒ"..i]
			  if JY.Person[eid]["Я����Ʒ����"..i]<1 then 
			     JY.Person[eid]["Я����Ʒ"..i]=-1
			  end
              --if WAR.TD==81 then WAR.TD=-1 end			  
		   else
              WAR.TD=-1	
           end			  
        end
				
		if WAR.XDDF==1 then
		   JY.Person[pid]["����"]=JY.Person[pid]["����"]+math.modf(hurt*0.1)
		   if JY.Person[pid]["����"]>JY.Person[pid]["�������ֵ"] then 
		      JY.Person[pid]["����"]=JY.Person[pid]["�������ֵ"]
		   end
		   WAR.XDXX=WAR.XDXX+math.modf(hurt*0.1)
		end
		
		if eid==85 and JY.Person[eid]["����"]>0 then
		   JY.Person[eid]["����"]=JY.Person[eid]["����"]+50
		   if JY.Person[eid]["����"]>JY.Person[eid]["�������ֵ"] then 
		      JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
		   end
		end
		
		if eid==516 and JY.Person[eid]["����"]>0 then
		   JY.Person[eid]["����"]=JY.Person[eid]["����"]+150
		   if JY.Person[eid]["����"]>JY.Person[eid]["�������ֵ"] then 
		      JY.Person[eid]["����"]=JY.Person[eid]["�������ֵ"]
		   end
		end
		   
		if WAR.HQT==1 then
		    JY.Person[eid]["����"]=JY.Person[eid]["����"]-15
		   if JY.Person[eid]["����"]<1 then 
		      JY.Person[eid]["����"]=1
		   end
		end
		
		if WAR.CY==1 then
		    JY.Person[eid]["����"]=JY.Person[eid]["����"]-300
		   if JY.Person[eid]["����"]<1 then 
		      JY.Person[eid]["����"]=1
		   end
		end
		
		if WAR.Data["����"]==0 then
		   if pid==72 and eid==3 and JY.Person[eid]["����"]<=0 and JY.Person[72]["�书1"]==28 then
		      WAR.TGN=1
		   end
		end
		
		if eid~=445 and eid~=446 and eid<578 and eid~=64 and WAR.ZDDH~=17 then
		   if pid==4 and JY.Person[eid]["����"]<=0 and inteam(pid) then
		      if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] and not inteam(eid) then
		         WAR.YJ=WAR.YJ+math.random(15)+25
			  end
		   end
		end
		
		if pid==72 then 
		    for j=0,WAR.PersonNum-1 do
		      if WAR.Person[j]["������"]==4 then
	            if WAR.Person[j]["����"]==false and WAR.Person[j]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then			    
		            JY.Person[eid]["�ж��̶�"]=JY.Person[eid]["�ж��̶�"]+5+math.random(15)
		            if JY.Person[eid]["�ж��̶�"]>100 then JY.Person[eid]["�ж��̶�"]=100 end
			    end
			  end
			end
		end
		
		if WAR.KHBX==1 and hurt>0 then WAR.KHCM[eid]=1 end
		   
		if WAR.GBWZ==1 and math.random(10)<6 then
		    if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then 
		        JY.Person[eid]["����"]=0
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
		
		--if eid==0 and JY.Person[eid]["����"]>70 then WAR.tmp[1000]=1 end
		
		if JY.Person[eid]["����"]>0 and (WAR.LQZ[eid]==nil or WAR.LQZ[eid]<100) and DWPD() and WAR.DZXY~=1 and WAR.ASKD~=1 then
		   local minlqzj=math.modf((hurt/3)*0.2)
		   local lqzj=math.random(math.modf(hurt/3)+1)
		   if lqzj<minlqzj then lqzj=minlqzj end
		   
		   if WAR.LQZ[eid]==nil then
		      WAR.LQZ[eid]=lqzj+2
		   else
		      WAR.LQZ[eid]=WAR.LQZ[eid]+lqzj+2
		   end
		   if WAR.Person[emenyid]["�ҷ�"]==false then 
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
		   if WAR.Person[emenyid]["�ҷ�"]~=WAR.Person[WAR.CurID]["�ҷ�"] then
		      WAR.Person[emenyid]["�ҷ�"]=WAR.Person[WAR.CurID]["�ҷ�"]
		   end
		end
		
		if WAR.ZDDH==205 and eid==141 then
		    JY.Person[eid]["����"]=0
	    end
				
		if pid==48 then --YTZ
		   local d=math.modf((340-JY.Person[eid]["��������"]-JY.Person[eid]["����"]/50)/4)
		   if d<0 then d=0 end
		   JY.Person[eid]["�ж��̶�"]=JY.Person[eid]["�ж��̶�"]+d
		   if JY.Person[eid]["�ж��̶�"]>100 then JY.Person[eid]["�ж��̶�"]=100 end
		end
		
		
	
	    if JY.Person[eid]["����"]<=0 and inteam(pid) and DWPD() and WAR.SZJPYX[eid]==nil then
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
		
		if JY.Person[eid]["����"]<=0 and pid==28 then
		   WAR.PYZ=WAR.PYZ+1
		   if WAR.PYZ>5 then WAR.PYZ=5 end
		end
		
		if (WAR.BMXH==1 or WAR.BMXH==2) and hurt>0 and DWPD() then
		   local xnl;
		   xnl=math.modf(JY.Person[eid]["����"]/16+2)	
		   if xnl>300 then xnl=300 end
		   AddPersonAttrib(eid,"����",-xnl);
		   AddPersonAttrib(pid,"����",math.modf(xnl+1));
		   AddPersonAttrib(pid,"�������ֵ",math.modf(xnl*2/3+10));
		end
		
		if WAR.YTFS>100 and T2SQ(eid) and GetS(10,0,7,0)==1 and WAR.YTFS>100 then
		    WAR.Person[emenyid][CC.TXDH]=6
			   if WAR.Person[emenyid][CC.TXWZ1]~=nil then
			        WAR.Person[emenyid][CC.TXWZ1]=WAR.Person[emenyid][CC.TXWZ1]..CC.WARS119
		       else
			       WAR.Person[emenyid][CC.TXWZ1]=CC.WARS120
			   end
			WAR.YTFS=-1
			WAR.YT1=JY.Person[0]["�书2"]
			WAR.YT2=JY.Person[0]["�书�ȼ�2"]
			JY.Person[0]["�书2"]=wugong
			JY.Person[0]["�书�ȼ�2"]=999
		end
		
		if WAR.BMXH==3 and hurt>0 and DWPD() then
		   local xnl;
		   xnl=math.modf(JY.Person[eid]["����"]/20+2)		   
		   AddPersonAttrib(eid,"����",-xnl);
		   AddPersonAttrib(eid,"�ж��̶�",20);
		end
		
		if WAR.BMXH==2 and hurt>0 and DWPD() then
		   local xt1=Rnd(3)+2
		   local xt2=Rnd(5)+6
		   local xt3=2+Rnd(2)
		      AddPersonAttrib(eid,"����",-xt1) 
			  AddPersonAttrib(pid,"����",xt3) 			  			
		    if pid==26 then 
		      AddPersonAttrib(eid,"����",-xt2) 
			  AddPersonAttrib(pid,"����",xt2) 
			end
		end
		
		if wugong==64 and pid==0 and GetS(4,5,5,5)==3 and hurt>0 and WAR.XXCC==0 then
		   for i=1,10 do
		        if JY.Person[0]["�书"..i]==64 then
				    if JY.Person[0]["�书�ȼ�"..i]==999 then
					   SetS(14,3,1,4,GetS(14,3,1,4)+math.random(2))
					   if GetS(14,3,1,4)>600 then SetS(14,3,1,4,600) end
					   if GetS(14,3,1,4)>JY.Person[0]['ˣ������']*10-900 then 
					      SetS(14,3,1,4,JY.Person[0]['ˣ������']*10-900)
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
				       
		
    --�����ж�����
    local poisonnum=math.modf(level*JY.Wugong[wugong]["�����ж�����"]+5*JY.Person[pid]["��������"]);

    if 10*JY.Person[eid]["��������"]< poisonnum and dng==0 and pid~=48 then
		poisonnum=math.modf(poisonnum/10-JY.Person[eid]["��������"]-JY.Person[eid]["����"]/150)
		if poisonnum<0 then poisonnum=0 end
		AddPersonAttrib(eid,"�ж��̶�",myrnd(poisonnum));
    end
    
	WAR.NGHT=0
	WAR.FLHS4=0
	
	if PersonKF(eid,108) then JY.Person[eid]["�ж��̶�"]=0 end
	--if PersonKF(eid,100) then JY.Person[eid]["���˳̶�"]=0 end
	
	if WAR.Person[emenyid][CC.TXWZ2]==nil then WAR.Person[emenyid][CC.TXWZ2]='  ' end
	if DWPD()==false then
	    WAR.Person[emenyid][CC.TXDH]=-1
		WAR.Person[emenyid][CC.TXWZ1]=nil
		WAR.Person[emenyid][CC.TXWZ2]=nil
		WAR.Person[emenyid][CC.TXWZ3]=nil
	end
	
	--WAR.Person[emenyid][CC.TXDH]=math.fmod(107,10)+85
	--WAR.Person[emenyid][CC.TXWZ2]="�����񹦻���+̫������"
	--WAR.Person[emenyid][CC.TXWZ1]="Ǭ����Ų�Ʒ������ʹ+����ʹ"
	return hurt;
end

function War_WugongHurtNeili(enemyid,wugong,level)           --�����书�˺�����
--�书�˺�����
--enemyid ����ս��id��
--wugong  �ҷ�ʹ���书
--���أ��˺�����
    local pid=WAR.Person[WAR.CurID]["������"];
    local eid=WAR.Person[enemyid]["������"];

    local addvalue=JY.Wugong[wugong]["������" .. level];
    local decvalue=JY.Wugong[wugong]["ɱ����" .. level];
	
	if WAR.Person[WAR.CurID]["�ҷ�"]~=WAR.Person[enemyid]["�ҷ�"] then
		if addvalue>0 then
			if math.modf(addvalue/2)>0 then
				AddPersonAttrib(pid,"�������ֵ",Rnd(math.modf(addvalue/2)));
			end
			AddPersonAttrib(pid,"����",math.abs(addvalue+Rnd(3)-Rnd(3)));
		end
		if JY.Wugong[wugong]["����"]==88 then
		   JY.Person[eid]['����']=JY.Person[eid]['����']-3-math.random(3)
		   if JY.Person[eid]['����']<0 then JY.Person[eid]['����']=0 end
		end
						
		return -AddPersonAttrib(eid,"����",-math.abs(decvalue+Rnd(3)-Rnd(3)));
    else
	    return -AddPersonAttrib(eid,"����",0);
    end
end

function War_PoisonMenu()              ---�ö��˵�
    WAR.ShowHead=0;
    local r=War_ExecuteMenu(1);
	WAR.ShowHead=1;
	Cls();
	return r;
end

function War_PoisonHurt(pid,emenyid)     --��������ж�����
    local vv=math.modf((JY.Person[pid]["�ö�����"]-JY.Person[emenyid]["��������"])/4);
	if JY.Status==GAME_WMAP then
		for i,v in pairs(CC.AddPoi) do
			if v[1]==pid then
				for wid=0,WAR.PersonNum-1 do
					if WAR.Person[wid]["������"]==v[2] and  WAR.Person[wid]["����"]==false then
						vv=vv+v[3]/4;
					end
				end
			end
		end
	end
	vv=vv-(JY.Person[emenyid]["����"]/200)
	for i=1,10 do
	    if JY.Person[emenyid]["�书"..i]==108 then
		   vv=0
		   break
		end
    end
	vv=math.modf(vv)
    if vv<0 then
        vv=0;
    end
    return AddPersonAttrib(emenyid,"�ж��̶�",vv);
end

function War_DecPoisonMenu()          ---�ⶾ�˵�
    WAR.ShowHead=0;
    local r=War_ExecuteMenu(2);
	WAR.ShowHead=1;
	Cls();
	return r;
end

function War_DoctorMenu()            ---ҽ�Ʋ˵�
    WAR.ShowHead=0;
    local r=War_ExecuteMenu(3);
	WAR.ShowHead=1;
	Cls();
	return r;
end

function War_ExecuteMenu(flag,thingid)            ---ִ��ҽ�ƣ��ⶾ�ö�����
---ִ��ҽ�ƣ��ⶾ�ö�
---flag=1 �ö��� 2 �ⶾ��3 ҽ�� 4 ����
---thingid ������Ʒid
    local pid=WAR.Person[WAR.CurID]["������"];
    local step;

    if flag==1 then
        step=math.modf(JY.Person[pid]["�ö�����"]/40);         --�ö�����
    elseif flag==2 then
        step=math.modf(JY.Person[pid]["�ⶾ����"]/40);         --�ⶾ����
    elseif flag==3 then
        step=math.modf(JY.Person[pid]["ҽ������"]/40);         --ҽ�Ʋ���
    elseif flag==4 then
        step=math.modf(JY.Person[pid]["��������"]/15)+1;         --��������
    end

    War_CalMoveStep(WAR.CurID,step,1);

    local x1,y1=War_SelectMove();              --ѡ�񹥻�����

    if x1 ==nil then
        lib.GetKey();
		Cls();
        return 0;
    else
        return War_ExecuteMenu_Sub(x1,y1,flag,thingid);
    end
end

function War_ExecuteMenu_Sub(x1,y1,flag,thingid)     ---ִ��ҽ�ƣ��ⶾ�ö��������Ӻ������Զ�ҽ��Ҳ�ɵ���
    local pid=WAR.Person[WAR.CurID]["������"];
    local x0=WAR.Person[WAR.CurID]["����X"];
    local y0=WAR.Person[WAR.CurID]["����Y"];

    CleanWarMap(4,0);

	WAR.Person[WAR.CurID]["�˷���"]=War_Direct(x0,y0,x1,y1);

	SetWarMap(x1,y1,4,1);

    local emeny=GetWarMap(x1,y1,2);
	if emeny>=0 then          --����
		 if flag==1 then
			 if WAR.Person[WAR.CurID]["�ҷ�"] ~= WAR.Person[emeny]["�ҷ�"] then       --�ǵ���
				 WAR.Person[emeny]["����"]=War_PoisonHurt(pid,WAR.Person[emeny]["������"])
				 SetWarMap(x1,y1,4,5);
  			     WAR.Effect=5;
			 end
		 elseif flag==2 then
			 if WAR.Person[WAR.CurID]["�ҷ�"] == WAR.Person[emeny]["�ҷ�"] then       --���ǵ���
				 WAR.Person[emeny]["����"]=ExecDecPoison(pid,WAR.Person[emeny]["������"])
				 SetWarMap(x1,y1,4,6);
  			     WAR.Effect=6;
			 end
		 elseif flag==3 then
		     if WAR.Person[WAR.CurID]["������"]==0 and GetS(4,5,5,5)==7 then
				 
			 else	 
				 if WAR.Person[WAR.CurID]["�ҷ�"] == WAR.Person[emeny]["�ҷ�"] then       --���ǵ���
					 WAR.Person[emeny]["����"]=ExecDoctor(pid,WAR.Person[emeny]["������"])
					 SetWarMap(x1,y1,4,4);
					 WAR.Effect=4;
				 end
			 end
		 elseif flag==4 then
			 if WAR.Person[WAR.CurID]["�ҷ�"] ~= WAR.Person[emeny]["�ҷ�"] then       --�ǵ���
				 WAR.Person[emeny]["����"]=War_AnqiHurt(pid,WAR.Person[emeny]["������"],thingid)*2
				 SetWarMap(x1,y1,4,2);
  			     WAR.Effect=2;
			 end
		 end

	end
	
	if flag==3 and WAR.Person[WAR.CurID]["������"]==0 and GetS(4,5,5,5)==7 then				 
		for ex=x1-3,x1+3 do
			for ey=y1-3,y1+3 do
			    SetWarMap(ex,ey,4,1)
				--WAR.Effect=4;				
				if GetWarMap(ex,ey,2)~=nil and GetWarMap(ex,ey,2)>-1 then
				    local ep=GetWarMap(ex,ey,2)
					if WAR.Person[WAR.CurID]["�ҷ�"] == WAR.Person[ep]["�ҷ�"] then					
					   WAR.Person[ep]["����"]=ExecDoctor(pid,WAR.Person[ep]["������"])
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
			War_ShowFight(pid,0,-1,0,x1,y1,JY.Thing[thingid]["�����������"]);
		end
	end

	for i=0,WAR.PersonNum-1 do
		WAR.Person[i]["����"]=0;
	end
	if flag==4 then
		if emeny>=0 then
			instruct_32(thingid,-1);            --��Ʒ��������
			return 1;
		else
			return 0;                   --������գ������û�д�
		end
	else
		WAR.Person[WAR.CurID]["����"]=WAR.Person[WAR.CurID]["����"]+1;
		AddPersonAttrib(pid,"����",-2);
		if inteam(pid) then AddPersonAttrib(pid,"����",-4) end
	end

	return 1;

end

function War_ThingMenu()            --ս����Ʒ�˵�
    WAR.ShowHead=0;
    local thing={};
    local thingnum={};

    for i = 0,CC.MyThingNum-1 do
        thing[i]=-1;
        thingnum[i]=0;
    end

    local num=0;
    for i = 0,CC.MyThingNum-1 do
        local id = JY.Base["��Ʒ" .. i+1];
        if id>=0 then
            if JY.Thing[id]["����"]==3 or JY.Thing[id]["����"]==4 then
                thing[num]=id;
                thingnum[num]=JY.Base["��Ʒ����" ..i+1];
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

function War_UseAnqi(id)          ---ս��ʹ�ð���
    return War_ExecuteMenu(4,id);
end

function War_AnqiHurt(pid,emenyid,thingid)         --���㰵���˺�
    local num;
    if JY.Person[emenyid]["���˳̶�"]==0 then
        num=JY.Thing[thingid]["������"]/4-Rnd(5);
    elseif JY.Person[emenyid]["���˳̶�"]<=33 then
        num=JY.Thing[thingid]["������"]/3-Rnd(5);
    elseif JY.Person[emenyid]["���˳̶�"]<=66 then
        num=JY.Thing[thingid]["������"]/2-Rnd(5);
    else
        num=JY.Thing[thingid]["������"]/2-Rnd(5);
    end

    num=math.modf((num-JY.Person[pid]["��������"]*2)/3);
    AddPersonAttrib(emenyid,"���˳̶�",math.modf(-num/6));      --�˴���numΪ��ֵ

    local r=AddPersonAttrib(emenyid,"����",math.modf(num/2));
	if (emenyid==129 or emenyid==65) and JY.Person[emenyid]["����"]<=0 then
	   JY.Person[emenyid]["����"]=1
	end
	if emenyid==553 and JY.Person[emenyid]["����"]<=0 then WAR.YZB=1 end
	if JY.Person[emenyid]["����"]<=0 then
	   WAR.Person[WAR.CurID]["����"]=WAR.Person[WAR.CurID]["����"]+JY.Person[emenyid]["�ȼ�"]*5;
	end	
    if JY.Thing[thingid]["���ж��ⶾ"]>0 then
        num=math.modf((JY.Thing[thingid]["���ж��ⶾ"]+JY.Person[pid]["��������"])/4);
        num=num-JY.Person[emenyid]["��������"];
        num=limitX(num,0,CC.PersonAttribMax["�ö�����"]);
        AddPersonAttrib(emenyid,"�ж��̶�",num);
    end
    return r;
end

function War_RestMenu()           --��Ϣ
    local pid=WAR.Person[WAR.CurID]["������"];
	if WAR.tmp[1000+pid]==1 then return 1 end
	--[[
	local vv=math.modf(WAR.Person[WAR.CurID]["�Ṧ"]/20-JY.Person[pid]["���˳̶�"]/40+JY.Person[pid]["����"]/30-3)+3;
	vv=(WAR.Person[WAR.CurID]["�ƶ�����"]+1)/vv
	vv=vv/15--]]
	local vv=math.modf(JY.Person[pid]["����"]/100-JY.Person[pid]["���˳̶�"]/50-JY.Person[pid]["�ж��̶�"]/50)+2;
	if WAR.Person[WAR.CurID]["�ƶ�����"]>0 then
		vv=vv+2
	end
	if inteam(pid) then
	   vv=vv+math.random(3)
	else
	   vv=vv+6
	end
	vv=vv/120
    local v=3+Rnd(3);
    AddPersonAttrib(pid,"����",v);
    if JY.Person[pid]["����"]>0 then
        v=3+math.modf(JY.Person[pid]["�������ֵ"]*vv);
        AddPersonAttrib(pid,"����",v);
        v=3+math.modf(JY.Person[pid]["�������ֵ"]*vv);
        AddPersonAttrib(pid,"����",v);
    end
	if JY.Thing[202][WZ7]>1 and (not inteam(pid)) then
	   if JY.Person[pid]["����"]>math.modf(JY.Person[pid]["�������ֵ"]/2) then
	      return War_ActupMenu() ;
	   else
	      return War_DefupMenu() ;
	   end
	else
       return 1;
	end
end

function War_TgrtsMenu()
    local pid=WAR.Person[WAR.CurID]["������"];
	Cls();
	WAR.ShowHead=0;
	WarDrawMap(0);
	local yn=JYMsgBox(CC.EVB172..GRTS[pid],GRTSSAY[pid],CC.EVB173,2,pid);
    if yn==2 then return 0 end
	
    if pid==53 then 
	    if JY.Person[pid]["����"]>20 then
		   WAR.TZ_DY=1 
		   PlayWavE(16) 
		   CurIDTXDH(WAR.CurID,1080,1085,CC.EVB174)	   
		   CurIDTXDH(WAR.CurID,1086,1093,CC.EVB175)	   	
           JY.Person[pid]["����"]=JY.Person[pid]["����"]-10
		else
		   DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		   return 0;
	    end
	end
	if pid==49 then
	    if JY.Person[pid]["����"]>20 and JY.Person[pid]["����"]>1000 then
	        
			JY.Person[pid]["����"]=JY.Person[pid]["����"]-5
			JY.Person[pid]["����"]=JY.Person[pid]["����"]-500
			local ssh={};
			local num=1;
			
			for i=0,WAR.PersonNum-1 do
			    local wid=WAR.Person[i]["������"]
		        if WAR.TZ_XZ_SSH[wid]==1 and WAR.Person[i]["����"]==false then
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
			     name[i][1]=JY.Person[ssh[i][2]]["����"]
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
					local x0=WAR.Person[WAR.CurID]["����X"];
					local y0=WAR.Person[WAR.CurID]["����Y"];
					local dx=WAR.Person[ssh[i][1]]["����X"]-x0--WAR.Person[WAR.CurID]["����X"]
					local dy=WAR.Person[ssh[i][1]]["����Y"]-y0--WAR.Person[WAR.CurID]["����Y"]
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
	    if JY.Person[pid]["����"]>25 and JY.Person[pid]["����"]>300 then
		       local px,py=WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"];
			   local mxy={
					   {WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"]+1},
					   {WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"]-1},
					   {WAR.Person[WAR.CurID]["����X"]+1,WAR.Person[WAR.CurID]["����Y"]},
					   {WAR.Person[WAR.CurID]["����X"]-1,WAR.Person[WAR.CurID]["����Y"]},			   
						  };
				local zdp={};
				local num=1;
				for i=1,4 do
					if GetWarMap(mxy[i][1],mxy[i][2],2)>=0 then
						local mid=GetWarMap(mxy[i][1],mxy[i][2],2);
						if inteam(WAR.Person[mid]["������"]) then
						   zdp[num]=WAR.Person[mid]["������"]
						   num=num+1
						end
					end
				end
				local zdp2={};
				for i=1,num-1 do
				     zdp2[i]={};
				     zdp2[i][1]=JY.Person[zdp[i]]["����"].."��"..JY.Person[zdp[i]]["����"]
					 zdp2[i][2]=nil
					 zdp2[i][3]=1
				end				     
				DrawStrBox(CC.MainMenuX,CC.MainMenuY,CC.EVB180,C_GOLD,30)  		    			
				--Cls();
				local r=ShowMenu(zdp2,num-1,10,CC.MainMenuX,CC.MainMenuY+45,0,0,1,0,CC.DefaultFont,C_RED,C_GOLD);
				Cls();
				AddPersonAttrib(zdp[r],"����",50);
				AddPersonAttrib(89,"����",-25);
				AddPersonAttrib(89,"����",-300);
				PlayWavE(28) 
				lib.Delay(10)
				CurIDTXDH(WAR.CurID,1345,1364,CC.EVB181)
				local Ocur=WAR.CurID;
				for i=0,WAR.PersonNum-1 do
				    if WAR.Person[i]["������"]==zdp[r] then
					    WAR.CurID=i;
						break;
					end
				end
				WarDrawMap(0);
				PlayWavE(36)
                lib.Delay(100)				
				CurIDTXDH(WAR.CurID,1382,1398,CC.EVB182)
				--CurIDTXDH(WAR.CurID,1397,1382,"�ָ�����50��")
				WAR.CurID=Ocur;
				WarDrawMap(0);
                --QZXS(JY.Person[zdp[r]]["����"].."�ָ�����50��")				
		else
		   DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		   return 0;
		end
	end
	if pid==9 then
	    if JY.Person[pid]["����"]>10 and JY.Person[pid]["����"]>500 then
		    local nyp={};
			local num=1;	
			for i=0,WAR.PersonNum-1 do
	            if WAR.Person[i]["�ҷ�"]==true and WAR.Person[i]["����"]==false then
			        if RealJL(WAR.CurID,i,8) and i~=WAR.CurID then
					   nyp[num]={};		   
					   nyp[num][1]=JY.Person[WAR.Person[i]["������"]]["����"]
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
			local mid=WAR.Person[nyp[r][4]]["������"]
			QZXS(CC.EVB184..JY.Person[mid]["����"]..CC.EVB185)
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
			lib.SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,-1)
			lib.SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,-1)			
			WarDrawMap(0);			
		    CurIDTXDH(WAR.CurID,1390,1398)
			WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"]=nx,ny;
			WarDrawMap(0);
			CurIDTXDH(WAR.CurID,1382,1390)			
			lib.SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],5,WAR.Person[WAR.CurID]["��ͼ"])
			lib.SetWarMap(WAR.Person[WAR.CurID]["����X"],WAR.Person[WAR.CurID]["����Y"],2,WAR.CurID)			
			WarDrawMap(0);	
			CurIDTXDH(WAR.CurID,1390,1398)
			WAR.CurID=Ocur;	
			AddPersonAttrib(9,"����",-10);
		    AddPersonAttrib(9,"����",-500);				
		else
		     DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		     return 0;
		end
	end 

	if pid==88 then
	    if JY.Person[pid]["����"]>10 and JY.Person[pid]["����"]>700 then
		    local dxp={};
			local num=1;	
			for i=0,WAR.PersonNum-1 do
	            if WAR.Person[i]["�ҷ�"]==true and WAR.Person[i]["����"]==false then
			        if RealJL(WAR.CurID,i,5) and i~=WAR.CurID then
					   dxp[num]={};		   
					   dxp[num][1]=JY.Person[WAR.Person[i]["������"]]["����"]
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
			local mid=WAR.Person[dxp[r][4]]["������"]
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
	        AddPersonAttrib(88,"����",-10);
		    AddPersonAttrib(88,"����",-1000);	
        else
             DrawStrBoxWaitKey(CC.EVB176,C_WHITE,30)  
		     return 0;
		end
	end 			   
	   
	return 1;
end	

function War_DefupMenu()            --����
	
	local p=WAR.CurID
	local id=WAR.Person[p]["������"];
	local x0,y0=WAR.Person[p]["����X"],WAR.Person[p]["����Y"];
	--[[local v=math.modf(WAR.Person[p]["�Ṧ"]/20-JY.Person[id]["���˳̶�"]/40+JY.Person[id]["����"]/30-3)+3;
	local y=WAR.Person[p]["�ƶ�����"];
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
	    --if WAR.Person[i]["�ҷ�"]==false then
		    -- JY.Person[WAR.Person[i]["������"]]["����"]=0
		--end
	--end
	return 1
	--[[
    for i =WAR.CurID, WAR.PersonNum-2 do
        local tmp=WAR.Person[i+1];
        WAR.Person[i+1]=WAR.Person[i];
        WAR.Person[i]=tmp;
        --��������
    end

    WarSetPerson();     --����ս������λ��

    for i=0,WAR.PersonNum-1 do
        WAR.Person[i]["��ͼ"]=WarCalPersonPic(i);
    end

    return 1;
]]--
end

function War_ActupMenu()            --����
	local p=WAR.CurID
	local id=WAR.Person[p]["������"];
	local x0,y0=WAR.Person[p]["����X"],WAR.Person[p]["����Y"];
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

function War_StatusMenu()          --ս������ʾ״̬
    WAR.ShowHead=0;
	Menu_Status();
	WAR.ShowHead=1;
	Cls();
end

function War_AutoMenu()           --�����Զ�ս��
    WAR.AutoFight=1;
	WAR.ShowHead=0;
	Cls();
    War_Auto();
    return 1;
end


function War_Auto()             --�Զ�ս��������
    local pid=WAR.Person[WAR.CurID]["������"];
	WAR.ShowHead=1;
	WarDrawMap(0);
	ShowScreen();
	lib.Delay(CC.WarAutoDelay);
	WAR.ShowHead=0;

    if CC.AutoWarShowHead==1 then
	    WAR.ShowHead=1;
	end

    local autotype=War_Think();         --˼�����ս��
	if WAR.Person[WAR.CurID]["�ҷ�"] or WAR.ZDDH==238 then
	    if JY.Person[pid]["����"]>50 and JY.Person[pid]["����"]>10 then
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
	
    if autotype==0 then  --��Ϣ
        War_AutoEscape();  --���ܿ�
        War_RestMenu();
    elseif autotype==1 then
        War_AutoFight();      --�Զ�ս��
    elseif autotype==2 then    --��ҩ������
        War_AutoEscape();
        War_AutoEatDrug(2);
    elseif autotype==3 then    --��ҩ������
        War_AutoEscape();
         War_AutoEatDrug(3);
    elseif autotype==4 then    --��ҩ������
        War_AutoEscape();
        War_AutoEatDrug(4);
    elseif autotype==5 then    --�Լ�ҽ��
        War_AutoEscape();
        War_AutoDoctor();
    elseif autotype==6 then    --��ҩ�ⶾ
        War_AutoEscape();
        War_AutoEatDrug(6);
    elseif autotype==7 then    --�ҷ�AI
	    CurIDTXDH(WAR.CurID,1325,1344,CC.EVB171)	
		War_RestMenu();
    end

    return 0;
end

--˼�����ս��
--���أ�0 ��Ϣ�� 1 ս����2 ʹ����Ʒ���������� 3 ʹ����Ʒ�������� 4 ��ҩ�������� 5 ҽ��
--     6 ʹ����Ʒ�ⶾ

function War_Think()           --˼�����ս��
    local pid=WAR.Person[WAR.CurID]["������"];
    local r=-1;         --���ǵĽ��

    if JY.Person[pid]["����"] <10 then         --��Ϣ
        r=War_ThinkDrug(4);
        if r>=0 then
            return r;
        end
        return 0;
    end

    if JY.Person[pid]["����"]<20 or JY.Person[pid]["���˳̶�"]>50 then
        r=War_ThinkDrug(2);       --������������
        if r>=0 then
            return r;
        end
    end

    local rate=-1;         --���������İٷֱ�
    if JY.Person[pid]["����"] <JY.Person[pid]["�������ֵ"] /5 then
        rate=90;
    elseif JY.Person[pid]["����"] <JY.Person[pid]["�������ֵ"] /4 then
        rate=70;
    elseif JY.Person[pid]["����"] <JY.Person[pid]["�������ֵ"] /3 then
        rate=50;
    elseif JY.Person[pid]["����"] <JY.Person[pid]["�������ֵ"] /2 then
        rate=25;
    end

    if Rnd(100)<rate then
        r=War_ThinkDrug(2);       --������������
        if r>=0 then
            return r;
        else             --û������������ҩ�������Ƿ��Լ�ҽ��
		    r=War_ThinkDoctor();
		    if r>=0 then
		       return r;
		    end
        end
    end

    rate=-1;         --���������İٷֱ�
    if JY.Person[pid]["����"] <JY.Person[pid]["�������ֵ"] /5 then
        rate=75;
    elseif JY.Person[pid]["����"] <JY.Person[pid]["�������ֵ"] /4 then
        rate=50;
    end

    if Rnd(100)<rate then
        r=War_ThinkDrug(3);       --������������
        if r>=0 then
            return r;
        end
    end


    rate=-1;         --�ⶾ�İٷֱ�
    if JY.Person[pid]["�ж��̶�"] > CC.PersonAttribMax["�ж��̶�"] *3/4 then
        rate=60;
    elseif JY.Person[pid]["�ж��̶�"] >CC.PersonAttribMax["�ж��̶�"] /2 then
        rate=30;
    end

    if Rnd(100)<rate then
        r=War_ThinkDrug(6);       --���ǽⶾ
        if r>=0 then
            return r;
        end
    end

    local minNeili=War_GetMinNeiLi(pid);     --�����书����С����

    if JY.Person[pid]["����"]>=minNeili then
        r=1;
    else
        r=0;
    end

    return r;
end

--�ܷ��ҩ���Ӳ���
--flag=2 ������3������4����  6 �ⶾ
function War_ThinkDrug(flag)             --�ܷ��ҩ���Ӳ���
    local pid=WAR.Person[WAR.CurID]["������"];
    local str;
    local r=-1;

    if flag==2 then
        str="������";
    elseif flag==3 then
        str="������";
    elseif flag==4 then
        str="������";
    elseif flag==6 then
        str="���ж��ⶾ";
    else
        return r;
    end

    local function Get_Add(thingid)    --����ֲ�������ȡ����Ʒthingid���ӵ�ֵ
		if flag==6 then
			return -JY.Thing[thingid][str];   --�ⶾΪ��ֵ
		else
			return JY.Thing[thingid][str];
		end
    end

    if inteam(pid) and WAR.Person[WAR.CurID]["�ҷ�"]==true then
        for i =1, CC.MyThingNum do
            local thingid=JY.Base["��Ʒ" ..i];
            if thingid>=0 then
                if JY.Thing[thingid]["����"]==3 and Get_Add(thingid)>0 then
                    r=flag;                     ---������������ҩ��������ʹ����Ʒ������
                    break;
                end
            end
        end
    else
        for i =1, 4 do
            local thingid=JY.Person[pid]["Я����Ʒ" ..i];
            if thingid>=0 then--and thingid<236 then
                if JY.Thing[thingid]["����"]==3 and Get_Add(thingid)>0  then
                    r=flag;                     ---������������ҩ��������ʹ����Ʒ������
                    break;
                end
            end
        end
    end

    return r;

end


--�����Ƿ��Լ�ҽ��
function War_ThinkDoctor()          --�����Ƿ���Լ�ҽ��
    local pid=WAR.Person[WAR.CurID]["������"];

	if JY.Person[pid]["����"]<50 or JY.Person[pid]["ҽ������"]<20 then
	    return -1;
	end

	if JY.Person[pid]["���˳̶�"]>JY.Person[pid]["ҽ������"]+20 then
	    return -1;
	end

	local rate = -1;
	local v=JY.Person[pid]["�������ֵ"]-JY.Person[pid]["����"];
	if JY.Person[pid]["ҽ������"] < v/4 then
        rate=30;
	elseif JY.Person[pid]["ҽ������"] < v/3 then
	    rate=50;
	elseif JY.Person[pid]["ҽ������"] < v/2 then
	    rate=70;
	else
	    rate=90;
	end

	if Rnd(100) <rate then
	    return 5;
	end

	return -1;
end

---�Զ�ս��
function War_AutoFight()             ---ִ���Զ�ս��

	local wugongnum=War_AutoSelectWugong();    --ѡ���书

	if wugongnum <=0 then --û��ѡ���书����Ϣ
        War_AutoEscape();
        War_RestMenu();
		return
	end
	--[[if inteam(WAR.Person[WAR.CurID]["������"]) and GetS(0,0,0,0)==1 then--WAR.Person[WAR.CurID]["�ҷ�"]
		local r=War_AutoMove(wugongnum);         -- �����˷����ƶ�
		if r==1 then   --����ڹ�����Χ
			War_AutoExecuteFight(wugongnum);     --����
		else
			War_RestMenu();           --��Ϣ
		end
	else]]
		unnamed(wugongnum)
	--end
end


function War_AutoSelectWugong()           --�Զ�ѡ����ʵ��书
    local pid=WAR.Person[WAR.CurID]["������"];
	
    local probability={};       --ÿ���书ѡ��ĸ���

    local wugongnum=10;         --ȱʡ10���书
	for i =1, 10 do             --����ÿ�ֿ�ѡ���书���ܹ�����
        local wugongid=JY.Person[pid]["�书" .. i];
        if wugongid>0 then
		       --ѡ��ɱ�������书������������������������С��������Է���һ�����书��
            if JY.Wugong[wugongid]["�˺�����"]==0 then
				if JY.Wugong[wugongid]["������������"]<=JY.Person[pid]["����"] then
					local level=math.modf(JY.Person[pid]["�书�ȼ�" .. i]/100)+1;
					--�ܹ�������Ϊ����
					probability[i]=(JY.Person[pid]["������"]*3+JY.Wugong[wugongid]["������" .. level ])/2;
				else
					probability[i]=0;
				end
				if inteam(pid) and WAR.Person[WAR.CurID]["�ҷ�"] then
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
				
			else            --ɱ�������书
                probability[i]=10;  --��С�ĸ���ѡ��ɱ����
			end
		else
		    wugongnum=i-1;
			break;
        end
    end
	
    local maxoffense=0;       --������󹥻���
	for i =1, wugongnum do
        if  probability[i]>maxoffense then
            maxoffense=probability[i];
        end
    end

    local mynum=0;             --�����ҷ��͵��˸���
	local enemynum=0;
	for i=0, WAR.PersonNum-1 do
	    if WAR.Person[i]["����"]==false then
		    if WAR.Person[i]["�ҷ�"]==WAR.Person[WAR.CurID]["�ҷ�"] then
			    mynum=mynum+1;
			else
			    enemynum=enemynum+1;
			end
		end
	end

    local factor=0;       --��������Ӱ�����ӣ����˶��������ȹ��������书��ѡ���������
	if enemynum>mynum then
	    factor=2;
	else
	    factor=1;
	end

	for i =1, wugongnum do       --������������Ч��
        local wugongid=JY.Person[pid]["�书" .. i];
        if probability[i]>0 then
		    if probability[i]<maxoffense-300 then       --ȥ��������С���书
			    probability[i]=0
			end
			local extranum=0;           --�书������ϵĹ�����
			for j,v in ipairs(CC.ExtraOffense) do
				if v[1]==JY.Person[pid]["����"] and v[2]==wugongid then
					extranum=v[3];
					break;
				end
			end
    		local level=math.modf(JY.Person[pid]["�书�ȼ�" .. i]/100)+1;
			probability[i]=probability[i]+JY.Wugong[wugongid]["������Χ"]*factor*JY.Wugong[wugongid]["ɱ�˷�Χ" ..level]*20;
        end
    end

	local s={};           --���ո��������ۼ�
	local maxnum=0;
    for i=1,wugongnum do
        s[i]=maxnum;
		maxnum=maxnum+probability[i];
	end
	s[wugongnum+1]=maxnum;

	if maxnum==0 then    --û�п���ѡ����书
	    return -1;
	end

    local v=Rnd(maxnum);            --���������
	local selectid=0;
    for i=1,wugongnum do            --���ݲ������������Ѱ�������ĸ��书����
	    if v>=s[i] and v< s[i+1] then
		    selectid=i;
			break;
		end
	end
    
    return selectid;
end


function War_AutoSelectEnemy()             --ѡ��ս������
    local enemyid=War_AutoSelectEnemy_near()
    WAR.Person[WAR.CurID]["�Զ�ѡ�����"]=enemyid;
    return enemyid;
end


function War_AutoSelectEnemy_near()              --ѡ���������

    War_CalMoveStep(WAR.CurID,100,1);           --���ÿ��λ�õĲ���

    local maxDest=math.huge;
    local nearid=-1;
    for i=0,WAR.PersonNum-1 do           --������������ĵ���
        if WAR.Person[WAR.CurID]["�ҷ�"] ~=WAR.Person[i]["�ҷ�"] then
            if WAR.Person[i]["����"]==false then
			   local step=GetWarMap(WAR.Person[i]["����X"],WAR.Person[i]["����Y"],3);
                if step<maxDest then
                    nearid=i;
                    maxDest=step;
                end
            end
        end
    end
    return nearid;
end

--�Զ������˷����ƶ�
--�����书��ţ������书id
--���� 1=���Թ������ˣ� 0 ���ܹ���
function War_AutoMove(wugongnum)              --�Զ������˷����ƶ�
    local pid=WAR.Person[WAR.CurID]["������"];
    local wugongid=JY.Person[pid]["�书"  ..wugongnum];
    local level=math.modf(JY.Person[pid]["�书�ȼ�".. wugongnum]/100)+1;

    local wugongtype=JY.Wugong[wugongid]["������Χ"];
	local movescope=JY.Wugong[wugongid]["�ƶ���Χ" ..level];
	local fightscope=JY.Wugong[wugongid]["ɱ�˷�Χ" ..level];
    local scope=movescope+fightscope;


    local x,y;
	local move=128;
    local maxenemy=0;

	local movestep=War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["�ƶ�����"],0);   --�����ƶ�����

	War_AutoCalMaxEnemyMap(wugongid,level);  --������书����������Թ��������˵ĸ���

	for i=0,WAR.Person[WAR.CurID]["�ƶ�����"] do
	    local step_num=movestep[i].num ;
		if step_num==nil or step_num==0 then
		    break;
		end
		for j=1,step_num do
		    local xx=movestep[i].x[j];
			local yy=movestep[i].y[j]

			local num=0;
			if wugongtype==0 or wugongtype==2 or wugongtype==3 then
				num=GetWarMap(xx,yy,4)      --�������λ�ÿ��Թ������������˸���
			elseif wugongtype==1  then
				local v=GetWarMap(xx,yy,4)      --�������λ�ÿ��Թ������������˸���
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
	    War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["�ƶ�����"],0);   --���¼����ƶ�����
        War_MovePerson(x,y);    --�ƶ�����Ӧ��λ��
		return 1;
	else   --�κ��ƶ���ֱ�ӹ����������ˣ�Ѱ��һ�������ƶ�������������λ�õ�·��
		x,y=War_GetCanFightEnemyXY(scope);       --������Թ��������˵����λ��

		local minDest=math.huge;
        if x==nil then   --�޷��ߵ����Թ������˵ĵط������ܵ��˱�Χס�����߱�����Χס��
             local enemyid=War_AutoSelectEnemy()   --ѡ���������

			 War_CalMoveStep(WAR.CurID,100,0);   --�����ƶ����� �������100��

			 for i=0,CC.WarWidth-1 do
                for j=0,CC.WarHeight-1 do
					local dest=GetWarMap(i,j,3);
                    if dest <128 then
                        local dx=math.abs(i-WAR.Person[enemyid]["����X"])
                        local dy=math.abs(j-WAR.Person[enemyid]["����Y"])
                        if minDest>(dx+dy) then        --��ʱx,y�Ǿ�����˵����·������Ȼ���ܱ�Χס
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
            minDest=0;        --�����ߵ�
		end

		if minDest<math.huge then   --��·����
		    while true do    --��Ŀ��λ�÷����ҵ������ƶ���λ�ã���Ϊ�ƶ��Ĵ���
				local i=GetWarMap(x,y,3);
                if i<=WAR.Person[WAR.CurID]["�ƶ�����"] then
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
            War_MovePerson(x,y);    --�ƶ�����Ӧ��λ��
        end
    end

    return 0;
end


function War_AutoCalMaxEnemyMap(wugongid,level)       --�����ͼ��ÿ��λ�ÿ��Թ����ĵ�����Ŀ

    local wugongtype=JY.Wugong[wugongid]["������Χ"];
    local movescope=JY.Wugong[wugongid]["�ƶ���Χ" ..level];
	local fightscope=JY.Wugong[wugongid]["ɱ�˷�Χ" ..level];

	local x0=WAR.Person[WAR.CurID]["����X"];
	local y0=WAR.Person[WAR.CurID]["����Y"];

 	CleanWarMap(4,0);    --��level 4��ͼ��ʾ��Щλ�ÿ��Թ���������

----�㹥�����湥��, ÿ��������Թ����ĵ��˸�������Ȼֻ��Ϊ0��1��
---�����湥���͵㹥��һ�������ᵼ���湥�����ܲ��ܹ��������ĵ��ˣ����������ٶȿ�
	if wugongtype==0 or wugongtype==3 then
		for n=0,WAR.PersonNum-1 do
			if n~=WAR.CurID and WAR.Person[n]["����"]==false and
				WAR.Person[n]["�ҷ�"] ~=WAR.Person[WAR.CurID]["�ҷ�"] then   --����
				local xx=WAR.Person[n]["����X"];
				local yy=WAR.Person[n]["����Y"];
				local movestep=War_CalMoveStep(n,movescope,1);   --�����书�ƶ�����
				for i=1,movescope do
					local step_num=movestep[i].num ;
					if step_num==0 then
						break;
					end
					for j=1,step_num do
						SetWarMap(movestep[i].x[j],movestep[i].y[j],4,1);  --����书�ƶ��ĵط�����Ϊ�ɹ���������֮��
					end
				end
		end
		end
--�߹�����ʮ�� ��¼ÿ���ĵ���Թ��������˵ĸ��������߹��������鲢��׼ȷ����Ҫ��һ����ʵ��
	elseif wugongtype==1 or wugongtype==2  then
		for n=0,WAR.PersonNum-1 do
			if n~=WAR.CurID and WAR.Person[n]["����"]==false and
				WAR.Person[n]["�ҷ�"] ~=WAR.Person[WAR.CurID]["�ҷ�"] then   --����
				local xx=WAR.Person[n]["����X"];
				local yy=WAR.Person[n]["����Y"];
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


function War_AutoCalMaxEnemy(x,y,wugongid,level)       --�����(x,y)��ʼ��������ܹ����м�������

    local wugongtype=JY.Wugong[wugongid]["������Χ"];
    local movescope=JY.Wugong[wugongid]["�ƶ���Χ" ..level];
	local fightscope=JY.Wugong[wugongid]["ɱ�˷�Χ" ..level];

	local maxnum=0;
	local xmax,ymax;

	if wugongtype==0 or wugongtype==3 then

		local movestep=War_CalMoveStep(WAR.CurID,movescope,1);   --�����书�ƶ�����
		for i=1,movescope do
			local step_num=movestep[i].num ;
			if step_num==0 then
				break;
			end
			for j=1,step_num do
				local xx=movestep[i].x[j];
				local yy=movestep[i].y[j];
				local enemynum=0;

				for n=0,WAR.PersonNum-1 do   --�����书������Χ�ڵĵ��˸���
					 if n~=WAR.CurID and WAR.Person[n]["����"]==false and
					    WAR.Person[n]["�ҷ�"] ~=WAR.Person[WAR.CurID]["�ҷ�"] then
						 local x=math.abs(WAR.Person[n]["����X"]-xx);
						 local y=math.abs(WAR.Person[n]["����Y"]-yy);
						 if x<=fightscope and y <=fightscope then
							  enemynum=enemynum+1;
						 end
					 end
				end

				if enemynum>maxnum then        --��¼�����˺�λ��
					maxnum=enemynum;
					xmax=xx;
					ymax=yy;
				end
			end
		end

	elseif wugongtype==1 then    --�߹���
		for direct=0,3 do           -- ��ÿ������ѭ�����ҳ���������
			local enemynum=0;
			for i=1,movescope do
				local xnew=x+CC.DirectX[direct+1]*i;
				local ynew=y+CC.DirectY[direct+1]*i;

				if xnew>=0 and xnew<CC.WarWidth and ynew>=0 and ynew<CC.WarHeight then
					local id=GetWarMap(xnew,ynew,2);
					if id>=0 then
						if WAR.Person[WAR.CurID]["�ҷ�"] ~= WAR.Person[id]["�ҷ�"] then
							enemynum=enemynum+1;                  --�书������Χ�ڵĵ��˸���
						end
					end
				end
			end
			if enemynum>maxnum then        --��¼�����˺�λ��
				maxnum=enemynum;
				xmax=x+CC.DirectX[direct+1];       --�߹�����¼һ�������������
				ymax=y+CC.DirectY[direct+1];
			end
		end

	elseif wugongtype==2 then --ʮ�ֹ���
		local enemynum=0;
		for direct=0,3 do           -- ��ÿ������ѭ��
			for i=1,movescope do
				local xnew=x+CC.DirectX[direct+1]*i;
				local ynew=y+CC.DirectY[direct+1]*i;
				if xnew>=0 and xnew<CC.WarWidth and ynew>=0 and ynew<CC.WarHeight then
					local id=GetWarMap(xnew,ynew,2);
					if id>=0 then
						if WAR.Person[WAR.CurID]["�ҷ�"] ~= WAR.Person[id]["�ҷ�"] then
							enemynum=enemynum+1;                  --�书������Χ�ڵĵ��˸���
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

--�Զ�ִ��ս������ʱ��λ��һ�����Դ򵽵���
function War_AutoExecuteFight(wugongnum)            --�Զ�ִ��ս������ʾ��������
    local pid=WAR.Person[WAR.CurID]["������"];
    local x0=WAR.Person[WAR.CurID]["����X"];
    local y0=WAR.Person[WAR.CurID]["����Y"];
    local wugongid=JY.Person[pid]["�书"  ..wugongnum];
    local level=math.modf(JY.Person[pid]["�书�ȼ�".. wugongnum]/100)+1;

    local maxnum,x,y=War_AutoCalMaxEnemy(x0,y0,wugongid,level);

    if x ~= nil then
        War_Fight_Sub(WAR.CurID,wugongnum,x,y);
		WAR.Person[WAR.CurID]["Action"]={'atk',x-WAR.Person[WAR.CurID]["����X"],y-WAR.Person[WAR.CurID]["����Y"]}
	end

end

--����
function War_AutoEscape()                --����
    local pid=WAR.Person[WAR.CurID]["������"];
    if JY.Person[pid]["����"]<=5  then
	    return
	end

    local x,y;

    War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["�ƶ�����"],0);   --�����ƶ�����
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
                    if WAR.Person[WAR.CurID]["�ҷ�"]~=WAR.Person[k]["�ҷ�"] and WAR.Person[k]["����"]==false then
                        local dx=math.abs(i-WAR.Person[k]["����X"])
                        local dy=math.abs(j-WAR.Person[k]["����Y"])
                        if minDest>(dx+dy) then        --���㵱ǰ������������λ��
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
                if minDest>maxDest then           --��һ����Զ��λ��
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
	War_CalMoveStep(WAR.CurID,WAR.Person[WAR.CurID]["�ƶ�����"],0); 
    War_MovePerson(x,y);    --�ƶ�����Ӧ��λ��

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
--����idʱ���������ƶ�
--������ʱ�������ڳ���
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
		if WAR.Person[i]["������"]==pid then return i end
	end
	return -1
end

function WE_move(pid,x,y)
--pid,������
--x,y,Ŀ����������������ֵ
	local id=WE_getwarid(pid)
	if id==-1 then return end
	WAR.CurID=id
	local cx,cy=WAR.Person[id]["����X"],WAR.Person[id]["����Y"]
	local nx,ny=WE_xy(cx+x,cy+y,id)
	--lib.Debug(x..','..y..','..nx..','..ny)
	War_MovePerson(nx,ny)
	lib.Delay(100)
end

function WE_moveto(pid,x,y)
--pid,������
--x,y,Ŀ������
	local id=WE_getwarid(pid)
	if id==-1 then return end
	WAR.CurID=id
	local nx,ny=WE_xy(x,y,id)
	--lib.Debug(x..','..y..','..nx..','..ny)
	War_MovePerson(nx,ny)
	lib.Delay(100)
end

function WE_follow(pid,eid)
--pid,������
--id,Ŀ������ƶ�����Ŀ�����������λ��
	local a=WE_getwarid(pid)
	local b=WE_getwarid(eid)
	--lib.Debug(a..','..b)
	if a==-1 or b==-1 then return end
	WAR.CurID=a
	local x,y=WAR.Person[b]["����X"],WAR.Person[b]["����Y"]
	local nx,ny=WE_xy(x,y,a)
	--lib.Debug(pid..','..eid..','..a..','..b..','..x..','..y..','..nx..','..ny)
	War_MovePerson(nx,ny)
	lib.Delay(100)
end

function WE_addperson(id,x,y,faseto,flag)
--id,ս�����¼ӵ������������
--x,y,����λ��
--flag,���ұ�ʶ
--faceto���﷽��0����1����2����3����
	faseto=faseto or 0
	flag=flag or true
	local cx,cy=WE_xy(x,y)
	WAR.Person[WAR.PersonNum]["������"]=id;
	WAR.Person[WAR.PersonNum]["�ҷ�"]=true--flag;
	WAR.Person[WAR.PersonNum]["����X"]=cx;
	WAR.Person[WAR.PersonNum]["����Y"]=cy;
	WAR.Person[WAR.PersonNum]["����"]=false;
	WAR.Person[WAR.PersonNum]["�˷���"]=faseto;
	WAR.Person[WAR.PersonNum]["��ͼ"]=WarCalPersonPic(WAR.PersonNum);
		--WAR.Person[i]["��ͼ"]=WarCalPersonPic(i);
	--WAR.Person[WAR.PersonNum]["AI"]=2;
	SetWarMap(cx,cy,2,WAR.PersonNum);
	SetWarMap(cx,cy,5,WAR.Person[WAR.PersonNum]["��ͼ"]);
	lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[id]["ͷ�����"]),string.format(CC.FightPicFile[2],JY.Person[id]["ͷ�����"]),4+WAR.PersonNum);
	--WAR.Person[WAR.PersonNum]["�Ṧ"]=GetSpeed(id)
	WAR.Person[WAR.PersonNum]["�ƶ�����"]=math.modf(WAR.Person[WAR.PersonNum]["�Ṧ"]/20)--JY.Person[id]["���˳̶�"]/40);
	WAR.PersonNum=WAR.PersonNum+1
	--WAR.CurID=WAR.PersonNum-1
end

function WE_sort()
--���д��������¼�����
--��������ͼ���Ṧ�����
--δ������ȫ	
--���������������û���ˣ����ұ�����
	WarPersonSort(1)
	for i=0,WAR.PersonNum-1 do
		local pid=WAR.Person[i]["������"]
		lib.PicLoadFile(string.format(CC.FightPicFile[1],JY.Person[pid]["ͷ�����"]),string.format(CC.FightPicFile[2],JY.Person[pid]["ͷ�����"]),4+i);
		end
end

function WE_atk(id,cx,cy,kfid,lv,flag)
--�����书����
--���lvΪ�գ���ֻ�������﹥������
	CleanWarMap(4,0)
	local cid=WE_getwarid(id)
	local x0=WAR.Person[cid]["����X"];
	local y0=WAR.Person[cid]["����Y"];
	WAR.Person[cid]["�˷���"]=War_Direct(0,0,cx,cy) or WAR.Person[cid]["�˷���"]
	if lv~=nil then
		local kind,len1,len2=fenjie(JY.Wugong[kfid]["��Χ"..math.modf((lv+2)/3)])
		WarDrawAtt(x0+cx,y0+cy,kind,len1,len2,3,x0,y0)
	end
	local tmp=WAR.CurID
	WAR.CurID=cid
	War_ShowFight(id,kfid,JY.Wugong[kfid]["�书����"],lv,x0+cx,y0+cy,JY.Wugong[kfid]["�书����&��Ч"],0,0,0);
	WAR.CurID=tmp
	CleanWarMap(4,0)
end

function WE_JL(id1,id2,len)
--�ж�����id֮��ľ��룬���С�ڵ���len�򷴻���
--���lenΪ���򷵻����˵ľ���
	len=len or 1
	local cid1=WE_getwarid(id1)
	local cid2=WE_getwarid(id2)
	local x1,y1=WAR.Person[cid1]["����X"],WAR.Person[cid1]["����Y"]
	local x2,y2=WAR.Person[cid2]["����X"],WAR.Person[cid2]["����Y"]
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
	SetWarMap(cx,cy,5,WAR.Person[pid]["��ͼ"]);
	WAR.Person[pid]["����X"]=cx
	WAR.Person[pid]["����Y"]=cy
end

function WE_xiaoshi(id)
	local pid=WE_getwarid(id)
	local cx,cy=WAR.Person[pid]["����X"],WAR.Person[pid]["����Y"]
	SetWarMap(cx,cy,2,-1);
	SetWarMap(cx,cy,5,-1);
end

---��ҩ
----flag=2 ������3������4����  6 �ⶾ
function War_AutoEatDrug(flag)          ---��ҩ�Ӳ���
    local pid=WAR.Person[WAR.CurID]["������"];
    local life=JY.Person[pid]["����"];
    local maxlife=JY.Person[pid]["�������ֵ"];
    local selectid;
    local minvalue=math.huge;

    local shouldadd;
    local maxattrib;
    local str;
    if flag==2 then
        maxattrib=JY.Person[pid]["�������ֵ"];
        shouldadd=maxattrib-JY.Person[pid]["����"];
        str="������";
    elseif flag==3 then
        maxattrib=JY.Person[pid]["�������ֵ"];
        shouldadd=maxattrib-JY.Person[pid]["����"];
        str="������";
    elseif flag==4 then
        maxattrib=CC.PersonAttribMax["����"];
        shouldadd=maxattrib-JY.Person[pid]["����"];
        str="������";
    elseif flag==6 then
        maxattrib=CC.PersonAttribMax["�ж��̶�"];
        shouldadd=JY.Person[pid]["�ж��̶�"];
        str="���ж��ⶾ";
    else
        return ;
    end

    local function Get_Add(thingid)     --������Ʒ���ӵ�ֵ
	    if flag==6 then
		    return -JY.Thing[thingid][str]/2;   --�ⶾΪ��ֵ
		else
            return JY.Thing[thingid][str];
		end
	end

    if inteam(pid) and WAR.Person[WAR.CurID]["�ҷ�"]==true then
        local extra=0;
        for i =1, CC.MyThingNum do
            local thingid=JY.Base["��Ʒ" ..i];
            if thingid>=0 then
                local add=Get_Add(thingid);
                if JY.Thing[thingid]["����"]==3 and add>0 then
                    local v=shouldadd-add;
                    if v<0 then               --���Լ���, �����������Һ���ҩƷ
                        extra=1;
                        break;
                    else
                        if v<minvalue then        --Ѱ�Ҽ���������������
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
                local thingid=JY.Base["��Ʒ" ..i];
                if thingid>=0 then
                    local add=Get_Add(thingid);
                    if JY.Thing[thingid]["����"]==3 and add>0 then
                        local v=add-shouldadd;
                        if v>=0 then               --���Լ�������
                            if v<minvalue then
                                minvalue=v;
                                selectid=thingid;
                            end
                        end
                    end
                end
            end
        end
        if UseThingEffect(selectid,pid)==1 then       --ʹ����Ч��
            instruct_32(selectid,-1);            --��Ʒ��������
        end
    else
        local extra=0;
        for i =1, 4 do
            local thingid=JY.Person[pid]["Я����Ʒ" ..i];
			local tids=JY.Person[pid]["Я����Ʒ����" ..i];
            if thingid>=0 and tids>0 then
                local add=Get_Add(thingid);
                if JY.Thing[thingid]["����"]==3 and add>0 then
                    local v=shouldadd-add;
                    if v<0 then               --���Լ�������, �����������Һ���ҩƷ
                        extra=1;
                        break;
                    else
                        if v<minvalue then        --Ѱ�Ҽ���������������
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
                local thingid=JY.Person[pid]["Я����Ʒ" ..i];
				local tids=JY.Person[pid]["Я����Ʒ����" ..i];
                if thingid>=0 and tids>0 then
                    local add=Get_Add(thingid);
                    if JY.Thing[thingid]["����"]==3 and add>0 then
                        local v=add-shouldadd;
                        if v>=0 then               --���Լ�������
                            if v<minvalue then
                                minvalue=v;
                                selectid=thingid;
                            end
                        end
                    end
                end
            end
        end

        if UseThingEffect(selectid,pid)==1 then       --ʹ����Ч��
            instruct_41(pid,selectid,-1);            --��Ʒ��������
        end
    end

    lib.Delay(500);
end


--�Զ�ҽ��
function War_AutoDoctor()            --�Զ�ҽ��
    local x1=WAR.Person[WAR.CurID]["����X"];
    local y1=WAR.Person[WAR.CurID]["����Y"];

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
		x0=WAR.Person[WAR.CurID]["����X"];
		y0=WAR.Person[WAR.CurID]["����Y"];
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
	
	if kind==0 then		--����
		num=1
		xy[1]={x,y}				
	elseif kind==1 then					--������
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
	elseif kind==2 then					--��������
		for tx=x-len1,x+len1 do			--��������о��е��˷ѣ�1/2�ĵ㶼�ǲ�����Ҫ���
			for ty=y-len1,y+len1 do
				if math.abs(tx-x)+math.abs(ty-y)>len1 then
				
				else
					num=num+1
					xy[num]={tx,ty}
				end
			end
		end			
	elseif kind==3 then					--���㷽��
		len2=len2 or len1
		local dx,dy=math.abs(x-x0),math.abs(y-y0)
		if dx>dy then len1,len2=len2,len1 end
		for tx=x-len1,x+len1 do
			for ty=y-len2,y+len2 do
				num=num+1
				xy[num]={tx,ty}
			end
		end	
	elseif kind==5 then					--��ʮ��
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
	elseif kind==6 then					--���㾮
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
	elseif kind==7 then					--������
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
	elseif kind==8 then					--����d
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
	elseif kind==9 then					--����e
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
	elseif kind==10 then				--������
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
		--���Ȼ����м�һ��
		for i=0,len1-1 do
			num=num+1
			xy[num]={x+i*fx,y+i*fy}
		end
			--Ȼ��������
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
	elseif kind==11 then				--������
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
	elseif kind==12 then				--������
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
	elseif kind==13 then			--��������
		local fx,fy=x-x0,y-y0;
		if fx>1 then fx=1
		elseif fx<-1 then fx=-1 end
		if fy>1 then fy=1
		elseif fy<-1 then fy=-1 end
		local xx=x+fx*len1;
		local yy=y+fy*len1;
		for tx=xx-len1,xx+len1 do			--��������о��е��˷ѣ�1/2�ĵ㶼�ǲ�����Ҫ���
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
		
		
		
	if flag==1 then									--���ƹ�����Χ

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
	elseif flag==2 then													--���ع�����Ŀ
		local diwo=WAR.Person[WAR.CurID]["�ҷ�"]
		local atknum=0
		for i=1,num do
			if xy[i][1]>=0 and xy[i][1]<CC.WarWidth and xy[i][2]>=0 and xy[i][2]<CC.WarHeight then
				local id=GetWarMap(xy[i][1],xy[i][2],2);
				if id~=-1 and id~=WAR.CurID then 
					--lib.Debug(xy[i][1]..','..xy[i][2]..'|'..id)
					local xa,xb,xc
					if diwo~=WAR.Person[id]["�ҷ�"] then 
						xa=2
					elseif GetS(0,0,0,0)==1 then
						xa=-0.5
					else
						xa=0
					end
					local hp=JY.Person[WAR.Person[id]["������"]]["����"]
					if hp<atk/6 then
						xb=2
					elseif hp<atk/3 then
						xb=1
					else
						xb=0
					end
					local danger=JY.Person[WAR.Person[id]["������"]]["�������ֵ"]
					xc=danger/500
					atknum=atknum+xa*math.modf(xb*xc+5)
					
--					if id<0 then--==WAR.Person[WAR.CurID]["�Զ�ѡ�����"] then
	--					atknum=atknum+60	--����ط���ʱ��ʹ��
		--			else
			--			local hp=JY.Person[WAR.Person[id]["������"]]["����"]
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
	elseif flag==3 then							--�����书Ч�����ò㣬���Ĳ�
		--CleanWarMap(4,0)
		for i=1,num do
			SetWarMap(xy[i][1],xy[i][2],4,1);
		end
	
	end
		
		
end

function War_FightSelectType(movefanwei,atkfanwei,x,y)		--
    local x0=WAR.Person[WAR.CurID]["����X"];
    local y0=WAR.Person[WAR.CurID]["����Y"];
    if x==nil and y==nil then
        x,y=War_KfMove(movefanwei,atkfanwei);              --δָ�������ص㣬ѡ�񹥻�����
		if x ==nil then
			lib.GetKey();
			Cls();
			return;
		end
	else																	--�Զ�ս��ʱ����ָ�������ص㣬��Զ�ת���������������
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
			if dx+dy~=1 then 			--������ȷ�Ͳ�������
				if dxy==0 or dxy==1 or dxy==2 then						--���ﰴ����˵Ӧ���� ==1����Ϊɶʵ��1���������⣿�ţ���ʵ������Զ�ת���ˣ������Ķ�����ȷ������,�޺���
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
			if dx+dy~=1 then 			--������ȷ�Ͳ�������
				if dxy==0 or dxy==1 then						--���ﰴ����˵Ӧ���� ==1����Ϊɶʵ��1���������⣿�ţ���ʵ������Զ�ת���ˣ������Ķ�����ȷ������,�޺���
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
		WarDrawAtt(x,y,atkfanwei,1)								--��ʾ������Χ����תʱ��ʾ����ȷ��Ӧ��������û���ƶ�����������-�޸���
		ShowScreen();
		lib.Delay(500);
    end

    WAR.Person[WAR.CurID]["�˷���"]=War_Direct(x0,y0,x,y) or WAR.Person[WAR.CurID]["�˷���"]

	SetWarMap(x,y,4,1);

    WAR.EffectXY={};
	--WarDrawAtt(x,y,atkfanwei,3)
	return x,y

end

function War_KfMove(movefanwei,atkfanwei)              ---ѡ���ƶ�λ��
--kind 0����1���� 2���� 3����
	local kind=movefanwei[1] or 0
	local len=movefanwei[2] or 0
    local x0=WAR.Person[WAR.CurID]["����X"];
    local y0=WAR.Person[WAR.CurID]["����Y"];
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
    local fightscope=JY.Wugong[wugong]["������Χ"];
	local kfkind=JY.Wugong[wugong]["�书����"];
    local pid=WAR.Person[WAR.CurID]["������"];
	if fightscope==0 then 
		if level>10 then
			m1=1
			m2=JY.Wugong[wugong]["�ƶ���Χ"..10];
			a1=1
			a2=3
			a3=3
		else
			m1=0
			m2=JY.Wugong[wugong]["�ƶ���Χ"..level];
			a1=1
			a2=math.modf(level/5)
			a3=math.modf(level/8)
		end
	elseif fightscope==1 then
		if kfkind==1 then
			a1=12
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..10];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1;
			else
				m1=2
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..level];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level]-1;
			end		
		elseif kfkind==2 then
			a1=10
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..10];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10];
				a3=a2-1
				a4=a3-1
			else
				m1=2
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..level];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level];
				if level>7 then
					a3=a2-1
				end
			end
		elseif kfkind==3 then
			a1=11
			if level>10 then
				m1=3
				m2=1
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1;
			else
				m1=2
				m2=1
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level]-1;
			end
		elseif kfkind==4 then
			m1=2
			if level>10 then
				m2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1;
				a1=7
				a2=1+math.modf(level/3)
				a3=a2
			else
				m2=JY.Wugong[wugong]["�ƶ���Χ"..level]-1;
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
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10];
			else
				a1=8--+math.random(2)
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level];
			end
		else
			if level>10 then
				if kfkind==1 then
					a1=5
					a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1
					a3=a2-3;
				elseif kfkind==2 then
					a1=1
					a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1
					a3=a2
				else
					a1=2
					a2=1+math.modf(JY.Wugong[wugong]["�ƶ���Χ"..10]/2)
				end
			else
				a1=1
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level];
				a3=0
			end	
		end
	elseif fightscope==3 then
		m1=0
		a1=3
		if level>10 then
			m2=JY.Wugong[wugong]["�ƶ���Χ"..10]+1;
			a2=JY.Wugong[wugong]["ɱ�˷�Χ"..10]
			a3=a2
		else
			m2=JY.Wugong[wugong]["�ƶ���Χ"..level];
			a2=JY.Wugong[wugong]["ɱ�˷�Χ"..level];
		end
	end
	
	--return 2,1,10,a2,a3,a4,a5
	--return Rnd(4),Rnd(8),Rnd(13),Rnd(8),Rnd(8),Rnd(8),Rnd(8)
	return m1,m2,a1,a2,a3,a4,a5
end

function refw(wugong,level)
	local m1,m2,a1,a2,a3,a4,a5
	if JY.Wugong[wugong]["������Χ"]==-1 then
		return JY.Wugong[wugong]["������1"],JY.Wugong[wugong]["������2"],
			JY.Wugong[wugong]["δ֪1"],JY.Wugong[wugong]["δ֪2"],
			JY.Wugong[wugong]["δ֪3"],JY.Wugong[wugong]["δ֪4"],JY.Wugong[wugong]["δ֪5"];
	end
    local fightscope=JY.Wugong[wugong]["������Χ"];
	local kfkind=JY.Wugong[wugong]["�书����"];
    local pid=WAR.Person[WAR.CurID]["������"];
	if fightscope==0 then 
		if level>10 then
			m1=1
			m2=JY.Wugong[wugong]["�ƶ���Χ"..10];
			a1=1
			a2=3
			a3=3
		else
			m1=0
			m2=JY.Wugong[wugong]["�ƶ���Χ"..level];
			a1=1
			a2=math.modf(level/5)
			a3=math.modf(level/8)
		end
	elseif fightscope==1 then
		if kfkind==1 then
			a1=12
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..10];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1;
			else
				m1=2
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..level];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level]-1;
			end		
		elseif kfkind==2 then
			a1=10
			if level>10 then
				m1=3
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..10];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10];
				a3=a2-1
				a4=a3-1
			else
				m1=2
				m2=1--JY.Wugong[wugong]["�ƶ���Χ"..level];
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level];
				if level>7 then
					a3=a2-1
				end
			end
		elseif kfkind==3 then
			a1=11
			if level>10 then
				m1=3
				m2=1
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1;
			else
				m1=2
				m2=1
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level]-1;
			end
		elseif kfkind==4 then
			m1=2
			if level>10 then
				m2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1;
				a1=7
				a2=1+math.modf(level/3)
				a3=a2
			else
				m2=JY.Wugong[wugong]["�ƶ���Χ"..level]-1;
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
				a2=JY.Wugong[wugong]["�ƶ���Χ"..10];
			else
				a1=8--+math.random(2)
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level];
			end
		else
			if level>10 then
				if kfkind==1 then
					a1=5
					a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1
					a3=a2-3;
				elseif kfkind==2 then
					a1=1
					a2=JY.Wugong[wugong]["�ƶ���Χ"..10]-1
					a3=a2
				else
					a1=2
					a2=1+math.modf(JY.Wugong[wugong]["�ƶ���Χ"..10]/2)
				end
			else
				a1=1
				a2=JY.Wugong[wugong]["�ƶ���Χ"..level];
				a3=0
			end	
		end
	elseif fightscope==3 then
		m1=0
		a1=3
		if level>10 then
			m2=JY.Wugong[wugong]["�ƶ���Χ"..10]+1;
			a2=JY.Wugong[wugong]["ɱ�˷�Χ"..10]
			a3=a2
		else
			m2=JY.Wugong[wugong]["�ƶ���Χ"..level];
			a2=JY.Wugong[wugong]["ɱ�˷�Χ"..level];
		end
	end
	
	--return 2,1,10,a2,a3,a4,a5
	--return Rnd(4),Rnd(8),Rnd(13),Rnd(8),Rnd(8),Rnd(8),Rnd(8)
	return m1,m2,a1,a2,a3,a4,a5
end










      

