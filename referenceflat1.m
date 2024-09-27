function out = referenceflat1(t)
global xl yl zl xld yld zld xl2d yl2d zl2d
i=round(t/0.043)+1;
if i>2000
    i=2000;
end
out=[xl(i);yl(i);zl(i);xl2d(i);yl2d(i);zl2d(i)];
end
