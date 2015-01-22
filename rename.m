function rename(files, root)

for i = 1:1:length(files)
    s = files(i).name;
    [a,b] = strtok(s,'-');
    [a,b] = strtok(b,'-');
    newfilename = a;
    movefile([root files(i).name], [root newfilename]);
end