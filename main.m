%% 
% Author: Hedayatollah Dallaki
% Email	: hdallaki@gmail.com

clc
% population size=100
% 100 row for 100 individual
% 8 column for position of queen & 1 column for conflict
Queen = zeros(100,9);
for i=1:100
    a=randperm(8);
    for j=1:8
        Queen(i,j)= a(j);
    end
end
% 9's column determines the conflict
for i=1:100
    t = Queen(i,1:8);
    Queen(i,9)= conf(t);
end
% sort the Queen used to conflict's column (9's column)
Queensort = sortrows(Queen,9)
% if Queensort include of solution(s) print those
for i=1:10
    if (Queensort(i,9) == 0) 
        sl = Queensort(i,1:8)
    end
end
% do until receive solution or 100 times do this loop
lp = 0;
flag = false;
while ((lp<100) && (flag == false))
% Generate 5 random index
rmd=zeros(5,2);
for i=1:5
    t = ceil(rand()*100);
    rmd(i,1) = t;
    rmd(i,2) = Queensort(t,9);
end
% Select 2 best of 5 random individual
rmd = sortrows(rmd,2);
t1 = rmd(1,1);
t2 = rmd(2,1);
a = Queensort(t1,1:8);
b = Queensort(t2,1:8);
% do crossover with probability 100%
[c0,d0] = crossover(a,b);
% do mutation with probability 80%
r1 = rand();
if (r1<0.8) 
    c = mutation(c0); 
end
r1 = rand();
if (r1<0.8) 
    d = mutation(d0); 
end
t1 = conf(c);
t2 = conf(d);
% replace two offspring if better than two worst individual
if (t1< Queensort(99,9))
    for i=1:8
        Queensort(99,i) = c(i);
    end
    Queensort(99,9) = t1;
end
if (t2< Queensort(100,9))
    for i=1:8
        Queensort(100,i) = d(i);
    end
    Queensort(100,9) = t2;
end
queen = sortrows(Queensort,9);
for i=1:10
    if (queen(i,9) == 0) 
        sl = queen(i,1:8)
        flag = true;
    end
end
%flag
lp = lp +1 ;
end
if (flag == 0)
    msgbox('I could not find solution')
end