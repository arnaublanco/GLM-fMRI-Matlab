
conds = [{'bed'} {'bench'} {'chair'} {'table'}];
timepoints = 465;
TR = 1.5;

dir_file = 'events.tsv';
C = readtsv(dir_file);

dm_cond = zeros(timepoints/TR,size(conds,2)+1);
dm_cond(:,1) = 1;

counter = 2;
for i = 1:size(conds,2)
   idx = find(strcmp([C{3}], conds{i}));
   for b = 1:size(idx,1)
      begin = (C{1}(idx(b)))/TR;
      ending = (C{1}(idx(b))+C{2}(idx(b)))/TR;
      dm_cond(begin+1:ending,i+1) = 1;
      counter = counter + 1;
   end
end

dir_dm = 'design_matrix.txt';
writematrix(dir_dm,dm_cond,'delimiter','\t');
