function conf = cf(a)
conf=0;
for i=1:8
	k=i+1;
	for j=k:8
		if (abs(j-i)==abs(a(j)-a(i)))
			conf=conf+1; 
		end
	end
end
