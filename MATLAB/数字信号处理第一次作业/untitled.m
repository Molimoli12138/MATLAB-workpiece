t=0:192;
x =[1 zeros(1,192)];
stem(t,x);
a=[1 0.95];
b=[1 -1];

y=filter(b,a,x);
stem(t,y);     %filter求出h[n]

[y,t]=impz(b,a);
stem(t,y);     %impz验证h[n]

[y,w]=freqz(b,a,512);
plot(w,y);
yf=abs(y);
yx=angle(y);
plot(w,20*log10(abs(yf)));
plot(w,yx); %求出h[n]的幅频(yf)与相频响应(yx)

zplane(b,a);%显示零极点

[z,p,K]=tf2zp(b,a);
omega=(0:511)*2*pi/512; 

unitcirc=exp(j*omega);
polevectors = unitcirc - p; 
polelength=zeros(1,512);
poleangle=zeros(1,512);
for i=1:1:512
   polelength(1,i)=(real(polevectors(1,i))^2+imag(polevectors(1,i))^2)^0.5;
   poleangle(1,i)=angle(polevectors(1,i));
end


zerovectors = unitcirc - z; 
zerolength=zeros(1,512);
zeroangle=zeros(1,512);
for i=1:1:512
   zerolength(1,i)=(real(zerovectors(1,i))^2+imag(zerovectors(1,i))^2)^0.5;
   zeroangle(1,i)=angle(zerovectors(1,i));
end
figure,
plot(omega,polelength);
figure,
plot(omega,zerolength);

figure,
Hlength=abs(K)*(zerolength./polelength);
plot(omega,Hlength);
figure,
Hangle=K+zeroangle-poleangle;
plot(omega,Hangle);


