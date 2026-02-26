close all; clear all; clc;

%load the data
Subject(1)={'C:\Users\user\Desktop\Semester 7\FYP\Coding\CheongRun.xlsx'};
A=1;
B=importdata(cell2mat(Subject(A)));
data=B.data;
data_chong = data(17000:199601,:);               %data for 4 min (from min 4-7)
%data1= data(368641:860160,:);                %data for 4 min (from min 2-5)
% data1= data(245761:737280,:);              %data for 4 min (from min 3-6)

[totalsample, channel] = size(data_chong);
Fs=1000; 
%accl-x
xchong =[];

for i= 1:83700
    
   xchong(i,1) = data_chong(i,1);
   i+1;
   
end

%accl-y

ychong=[];

for i= 1:83700
    
   ychong(i,1) = data_chong(i,2);
   i+1;
end

%accl-z

zchong=[];

for i= 1:83700
    
   zchong(i,1) = data_chong(i,3);
   i+1;
end
fs=1000;
%zero lag low bass filter x
[b,a] = butter(4,20*2/(1000),'low');
chongfilter_x=filtfilt(b,a,xchong);

%zero lag low bass filter y

[b,a] = butter(4,20*2/(1000),'low');
chongfilter_y=filtfilt(b,a,ychong);

%zero lag low bass filter z

[b,a] = butter(4,20*2/(1000),'low');
chongfilter_z=filtfilt(b,a,zchong);
%0-25m
%acc1-x

chongx_25 =[];

for i= 1:4400
    
   chongx_25(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_25=approximateEntropy(chongx_25);

%accl-y

chongy_25 =[];

for i= 1:4400
    
   chongy_25(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_25=approximateEntropy(chongy_25);

%accl-z

chongz_25 =[];

for i= 1:4400
    
   chongz_25(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_25=approximateEntropy(chongz_25);
%25-50m
%acc1-x

chongx_50 =[];

for i= 4401:8800
    
   chongx_50(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_50=approximateEntropy(chongx_50);

%accl-y

chongy_50=[];

for i=4401:8800
    
   chongy_50(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_50=approximateEntropy(chongy_50);

%accl-z

chongz_50=[];

for i=4401:8800
    
   chongz_50(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_50=approximateEntropy(chongz_50);
%50-75m
%acc1-x

chongx_75 =[];

for i= 8801:12600
    
   chongx_75(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_75=approximateEntropy(chongx_75);

%accl-y

chongy_75=[];

for i=8801:12600
    
   chongy_75(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_75=approximateEntropy(chongy_75);

%accl-z

chongz_75=[];

for i=8801:12600
    
   chongz_75(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_75=approximateEntropy(chongz_75);
%75-100m
%acc1-x

chongx_100 =[];

for i= 12601:17000
    
   chongx_100(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_100=approximateEntropy(chongx_100);

%accl-y

chongy_100=[];

for i=12601:17000
    
   chongy_100(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_100=approximateEntropy(chongy_100);

%accl-z

chongz_100=[];

for i=12601:17000
    
   chongz_100(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_100=approximateEntropy(chongz_100);
%100-125m
%acc1-x

chongx_125 =[];

for i= 17001:21500
    
   chongx_125(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_125=approximateEntropy(chongx_125);

%accl-y

chongy_125=[];

for i=17001:21500
    
   chongy_125(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_125=approximateEntropy(chongy_125);

%accl-z

chongz_125=[];

for i=17001:21500
    
   chongz_125(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_125=approximateEntropy(chongz_125);
%125-150m
%acc1-x

chongx_150 =[];

for i= 21501:26100
    
   chongx_150(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_150=approximateEntropy(chongx_150);

%accl-y

chongy_150=[];

for i=21501:26100
    
   chongy_150(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_150=approximateEntropy(chongy_150);

%accl-z

chongz_150=[];

for i=21501:26100
    
   chongz_150(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_150=approximateEntropy(chongz_150);
%150-175m
%acc1-x

chongx_175 =[];

for i= 26101:30700
    
   chongx_175(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_175=approximateEntropy(chongx_175);

%accl-y

chongy_175=[];

for i=26101:30700
    
   chongy_175(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_175=approximateEntropy(chongy_175);

%accl-z

chongz_175=[];

for i=26101:30700
    
   chongz_175(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_175=approximateEntropy(chongz_175);
%175-200m
%acc1-x

chongx_200 =[];

for i= 30701:35000
    
   chongx_200(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_200=approximateEntropy(chongx_200);

%accl-y

chongy_200=[];

for i=30701:35000
    
   chongy_200(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_200=approximateEntropy(chongy_200);

%accl-z

chongz_200=[];

for i=30701:35000
    
   chongz_200(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_200=approximateEntropy(chongz_200);
%200-225m
%acc1-x

chongx_225 =[];

for i= 35001:40400
    
   chongx_225(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_225=approximateEntropy(chongx_225);

%accl-y

chongy_225=[];

for i=35001:40400
    
   chongy_225(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_225=approximateEntropy(chongy_225);

%accl-z

chongz_225=[];

for i=35001:40400
    
   chongz_225(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_225=approximateEntropy(chongz_225);
%225-250m
%acc1-x

chongx_250 =[];

for i= 40401:45700
    
   chongx_250(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_250=approximateEntropy(chongx_250);

%accl-y

chongy_250=[];

for i=40401:45700
    
   chongy_250(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_250=approximateEntropy(chongy_250);

%accl-z

chongz_250=[];

for i=40401:45700
    
   chongz_250(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_250=approximateEntropy(chongz_250);
%250-275m
%acc1-x

chongx_275 =[];

for i= 45701:52100
    
   chongx_275(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_275=approximateEntropy(chongx_275);

%accl-y

chongy_275=[];

for i=45701:52100
    
   chongy_275(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_275=approximateEntropy(chongy_275);

%accl-z

chongz_275=[];

for i=45701:52100
    
   chongz_275(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_275=approximateEntropy(chongz_275);
%275-300m
%acc1-x

chongx_300 =[];

for i= 52101:58200
    
   chongx_300(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_300=approximateEntropy(chongx_300);

%accl-y

chongy_300=[];

for i=52101:58200
    
   chongy_300(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_300=approximateEntropy(chongy_300);

%accl-z

chongz_300=[];

for i=52101:58200
    
   chongz_300(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_300=approximateEntropy(chongz_300);
%300-325m
%acc1-x

chongx_325 =[];

for i= 58201:65000
    
   chongx_325(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_325=approximateEntropy(chongx_325);

%accl-y

chongy_325=[];

for i=58201:65000
    
   chongy_325(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_325=approximateEntropy(chongy_325);

%accl-z

chongz_325=[];

for i=58201:65000
    
   chongz_325(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_325=approximateEntropy(chongz_325);
%325-350m
%acc1-x

chongx_350 =[];

for i= 65001:71000
    
   chongx_350(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_350=approximateEntropy(chongx_350);

%accl-y

chongy_350=[];

for i=65001:71000
    
   chongy_350(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_350=approximateEntropy(chongy_350);

%accl-z

chongz_350=[];

for i=65001:71000
    
   chongz_350(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_350=approximateEntropy(chongz_350);
%350-375m
%acc1-x

chongx_375 =[];

for i= 71001:77500
    
   chongx_375(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_375=approximateEntropy(chongx_375);

%accl-y

chongy_375=[];

for i=71001:77500
    
   chongy_375(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_375=approximateEntropy(chongy_375);

%accl-z

chongz_375=[];

for i=71001:77500
    
   chongz_375(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_375=approximateEntropy(chongz_375);
%375-400m
%acc1-x

chongx_400 =[];

for i= 77501:83700
    
   chongx_400(i,1) = chongfilter_x(i,1);
   i+1;
   
end
chongvalue_entX_400=approximateEntropy(chongx_400);

%accl-y

chongy_400=[];

for i=77501:83700
    
   chongy_400(i,1) = chongfilter_y(i,1);
   i+1;
end
chongvalue_entY_400=approximateEntropy(chongy_400);

%accl-z

chongz_400=[];

for i=77501:83700
    
   chongz_400(i,1) = chongfilter_z(i,1);
   i+1;
end
chongvalue_entZ_400=approximateEntropy(chongz_400);

%figurex,y&z
apenx=[0,chongvalue_entX_25,chongvalue_entX_50,chongvalue_entX_75,chongvalue_entX_100,chongvalue_entX_125,chongvalue_entX_150,chongvalue_entX_175,chongvalue_entX_200,chongvalue_entX_225,chongvalue_entX_250,chongvalue_entX_275,chongvalue_entX_300,chongvalue_entX_325,chongvalue_entX_350,chongvalue_entX_375,chongvalue_entX_400];
apeny=[0,chongvalue_entY_25,chongvalue_entY_50,chongvalue_entY_75,chongvalue_entY_100,chongvalue_entY_125,chongvalue_entY_150,chongvalue_entY_175,chongvalue_entY_200,chongvalue_entY_225,chongvalue_entY_250,chongvalue_entY_275,chongvalue_entY_300,chongvalue_entY_325,chongvalue_entY_350,chongvalue_entY_375,chongvalue_entY_400];
apenz=[0,chongvalue_entZ_25,chongvalue_entZ_50,chongvalue_entZ_75,chongvalue_entZ_100,chongvalue_entZ_125,chongvalue_entZ_150,chongvalue_entZ_175,chongvalue_entZ_200,chongvalue_entZ_225,chongvalue_entZ_250,chongvalue_entZ_275,chongvalue_entZ_300,chongvalue_entZ_325,chongvalue_entZ_350,chongvalue_entZ_375,chongvalue_entZ_400];
dis=[0,25,50,75,100,125,150,175,200,225,250,275,300,325,350,375,400];
figure 
plot(dis,apenx,'-ro',dis,apeny,'-go',dis,apenz,'-yo','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2)
title('value of approximate entropy for each axis (x,y&z)(Second subject)');
xlabel('Distances (m)');
ylabel(' value of approximate entropy');
%matlap toexcel
 dis=[0;25;50;75;100;125;150;175;200;225;250;275;300;325;350;375;400];
 apenx=[0;chongvalue_entX_25;chongvalue_entX_50;chongvalue_entX_75;chongvalue_entX_100;chongvalue_entX_125;chongvalue_entX_150;chongvalue_entX_175;chongvalue_entX_200;chongvalue_entX_225;chongvalue_entX_250;chongvalue_entX_275;chongvalue_entX_300;chongvalue_entX_325;chongvalue_entX_350;chongvalue_entX_375;chongvalue_entX_400];
apeny=[0;chongvalue_entY_25;chongvalue_entY_50;chongvalue_entY_75;chongvalue_entY_100;chongvalue_entY_125;chongvalue_entY_150;chongvalue_entY_175;chongvalue_entY_200;chongvalue_entY_225;chongvalue_entY_250;chongvalue_entY_275;chongvalue_entY_300;chongvalue_entY_325;chongvalue_entY_350;chongvalue_entY_375;chongvalue_entY_400];
apenz=[0;chongvalue_entZ_25;chongvalue_entZ_50;chongvalue_entZ_75;chongvalue_entZ_100;chongvalue_entZ_125;chongvalue_entZ_150;chongvalue_entZ_175;chongvalue_entZ_200;chongvalue_entZ_225;chongvalue_entZ_250;chongvalue_entZ_275;chongvalue_entZ_300;chongvalue_entZ_325;chongvalue_entZ_350;chongvalue_entZ_375;chongvalue_entZ_400];
  T=table(dis,apenx,apeny,apenz);
filename = 'aproxisecond.xlsx';
writetable(T,filename);
%figure resatent vector
data = xlsread('aproxisecond.xlsx')
A=[];
for i=1:17
    
A(i)=sqrt(data(i,2).^2+data(i,3).^2+data(i,4).^2);
i+1
end
figure 
plot(dis,A,'-bo','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2)
title('resultant vector value of approximate entropy (Second subject)');
xlabel('Distances (m)');
ylabel(' value of approximate entropy');
grid on,