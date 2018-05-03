clear all
load magic04
g=magic04(:,1:10);
% multivariate mean vector
mg=mean(g)
%inner product
z=g-repmat(mg,size(g,1),1);%centered data matrix
in_co_ma=1.0/size(g,1)*(z')*z;
% outer product
temp=zeros(size(z,2),size(z,2));
for i=1:size(z,1)
    temp=temp+z(i,:)'*z(i,:);
end
out_co_ma=1.0/size(g,1)*temp;
%correlation
z1=z(:,1);
z2=z(:,2);
cos=z1'*z2/(norm(z1)*norm(z2));
scatter(g(:,1),g(:,2));
figure(2)
%pdf
data=sort(g(:,1));
norm=normpdf(data,mean(data),std(data,0));
plot(data,norm);
xlabel('attribute 1')
ylabel('pdf of attribute 1')
%variance
var_g=var(g)
%covariance
cov_g=cov(g);
%The pair of attributes of the largest covariance:[x y]
[x y]=find(cov_g==max(max(cov_g)))
%The pair of attributes of the samllest covariance:[x1 y1]
[x1 y2]=find(cov_g==min(min(cov_g)))