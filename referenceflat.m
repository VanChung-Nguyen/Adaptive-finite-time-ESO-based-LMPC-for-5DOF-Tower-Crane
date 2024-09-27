function out = referenceflat(t)
global xl yl zl xl2d yl2d zl2d l1
i=round(t/0.043)+1;
if i>2000
    i=2000;
end
out=[xl(i);yl(i);zl(i);xl2d(i);yl2d(i);zl2d(i);l1(i)];
end
