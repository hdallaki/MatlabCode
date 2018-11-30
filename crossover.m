function [c,d] = crossover(a,b)
t=0;
while (t==0)
	t=round(rand()*8);
end
c=zeros(1,8);d=zeros(1,8);
for i=1:t
	c(i)=b(i);
	d(i)=a(i);
end
t=t+1;
k=t;
m=k;
while (k<9)
for i=t:8
	flag=true;
	for j=1:k-1
		if (a(i)==c(j)) 
			flag=false; 
			break; 
		end
	end
	if (flag) 
		c(k)=a(i); 
		k=k+1; 
	end
end
for i=k:8
	for j=8:-1:1
		flag=true;
		for n=1:i-1
			if (c(n)==j) 
				flag=false; 
				break; 
			end
		end
		if (flag) 
			c(i)=j; 
		end
	end
end
k=9;
end
k=m; t=k;
while (k<9)
for i=t:8
	flag=true;
	for j=1:k-1
		if (b(i)==d(j)) 
			flag=false; 
			break; 
		end
	end
	if (flag) 
		d(k)=b(i); 
		k=k+1; 
	end
end
for i=k:8
	for j=8:-1:1
		flag=true;
		for n=1:i-1
			if (d(n)==j) 
				flag=false; 
				break; 
			end
		end
		if (flag) 
			d(i)=j; 
		end
	end
end
k=9;
end