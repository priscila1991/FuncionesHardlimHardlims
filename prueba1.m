x1 = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1;
      0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1;
      0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
      0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
x2 = [0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 1];
%plotpv(x1,x2)
net = newp([0 1;0 1;0 1;0 1],1,'hardlim');
net.trainParam.show=90;
net = train(net,x1,x2);
pesos=net.iw{1,1};
bias=net.b{1};
en=[1;1;0;1];
s = sim (net,en)
x2
%plotpc(pesos,bias)
