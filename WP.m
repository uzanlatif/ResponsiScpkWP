clc;clear; %hapus layar

%import data dari dataset
opts = detectImportOptions('InvestMRT.xlsx');
opts.SelectedVariableNames = (3:8);
data = readmatrix('InvestMRT.xlsx', opts);
raw = data(1:50,[1 2 3 6])

k=[0 0 1 0]; %0= cost 1 = benefit

w = [3,5,4,1];%Nilai pembobotan

[m n]=size(raw);
w=w./sum(w);

for j=1:n,
    if k(j)==0,
        w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(raw(i,:).^w);
end;

data= S/sum(S);
Descend=sort(data,'descend')
Skor_Tertinggi = max(data) 
