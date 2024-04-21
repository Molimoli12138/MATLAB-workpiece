
I = imread('512.jpg');

J = im2bw(I,0.7);


m=1;%数据个数计数
xy=512;%输入图片的行/列分辨率
b=ones(12000,2);%边界像素块坐标储存

for i=1:1:xy   %所扫描图像大小为xy乘以xy
    for j=1:1:(xy-1)
        if(J(i,j)==0&&J(i,j+1)==1)%一次读取两位，黑白则记录下黑块坐标
            b(m,1)=i;         
            b(m,2)=j;
            m=m+1;
        elseif(J(i,j)==1&&J(i,j+1)==0)%一次读取两位，黑白则记录下黑块坐标
            b(m,1)=(i+1);     
            b(m,2)=j+1;
            m=m+1;
        end
    end
end%横扫描

for j=1:1:xy
    for i=1:1:xy-1
        if(J(i,j)==0&&J(i+1,j)==1)%同理
            b(m,1)=i;
            b(m,2)=j;
            m=m+1;
        elseif(J(i,j)==1&&J(i+1,j)==0)%同理
            b(m,1)=(i+1);
            b(m,2)=j;
            m=m+1;
        elseif(i+1==xy)
            break
        end
    end
end%竖扫描

c=ones(xy,xy);
for i=1:1:m
    c(b(i,1),b(i,2))=0;
end
imshow(c);%黑白线搞处理完成得到二进制图c;



d=zeros(12000,2);

for i=1:1:m
 d(i,1)=b(i,1);
 d(i,2)=b(i,2);
end







