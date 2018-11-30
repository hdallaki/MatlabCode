function b = mutation(a)
b=a;
m=round(random('unif',1,8));
while (true) 
	n=round(random('unif',1,8));
	if (n==m) 
		continue; 
	end
	break;
end
t=b(m);
b(m)=b(n);
b(n)=t;