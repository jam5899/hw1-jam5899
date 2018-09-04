probs=[];
for N=100:500
total=0;
for j=1:1000
rand_seq = '';
for i =1:N
ran = randi([1,4],1,1);
if ran == 1;
letter = 'A';
elseif ran == 2;
letter = 'C';
elseif ran == 3;
letter = 'T';
elseif ran == 4;
letter = 'G';
end
rand_seq = strcat(rand_seq,letter);
end

rand_seq;
start=min(strfind(rand_seq,'ATG'));

stop=max(strfind(rand_seq,'TAA'));
if stop<max(strfind(rand_seq,'TAG'));
    stop=max(strfind(rand_seq,'TAG'));
end
if stop<max(strfind(rand_seq,'TGA'));
    stop=max(strfind(rand_seq,'TGA'));
end
ORF=(stop+2)-start;
if ORF>50
    total=total+1;
end
end
probability=total/1000;
probs=[probs,probability];
end
scatter(100:500,probs)
