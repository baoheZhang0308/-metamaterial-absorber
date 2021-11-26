clc
clear
Sim = xlsread('Metal_VO2.xlsx'); 
r12 = importdata('r12.txt'); 
r21 = importdata('r21.txt'); 
t12 = importdata('t12.txt'); 
t21 = importdata('t21.txt'); 
phi12 = importdata('¦Õ12.txt'); 
phi21 = importdata('¦Õ21.txt'); 
theta12 = importdata('¦È12.txt'); 
theta21 = importdata('¦È21.txt'); 
d=10e-6; 
n1=sqrt(1.96);
c=3e8;
f=r12(:,1)*1e12;
freq=r12(:,1);
k0=2*pi*f/c;
beta=n1*k0*d;
r=r12(:,2).*exp(i.*phi12(:,2)*pi/180)-(t12(:,2).*exp(i.*theta12(:,2)*pi/180).*t21(:,2).*exp(i.*theta21(:,2)*pi/180))./(1+r21(:,2).*exp(i.*phi21(:,2)*pi/180));
R=abs(r).^2
A=1-R;
plot(freq,R,'b',freq,A,'k',freq,Sim,'r','linewidth',1.3)
legend('R','A','Sim')
set(gca,'XLim',[0 10]); set(gca,'YLim',[0 1]);
set(gca,'FontSize',14)
