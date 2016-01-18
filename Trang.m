function [ f ] = Trang( x,a,b,c)
%Trang mimmicks a triangular signal. 

f = zeros(1,length(x));
s=(a/b);
for n=1:length(x)
   if (x(n)>=c-b) && (x(n)<=c)
       p=s*x(n)-s*(c-b);
   elseif (x(n)<=c+b) && (x(n)>=c)
       p=-s*x(n)+s*(c+b);
   else
       p=0;
   end
   
   f(n)=p;
   
end

end

