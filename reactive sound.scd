///Quarks.install("MathLib");
(
(
s.options.numWireBufs = 1024*16;
s.options.numOutputBusChannels=12;
s.options.numInputBusChannels=0;
s.options.memSize = 8192*256;
s.options.blockSize = 64;
s.options.maxNodes = 8192*2;
Buffer.freeAll;
Window.closeAll;
s.makeGui(w);
//s.meter;
//s.freqscope;
s.scope;
);
~img_print = Image.open("/Users/rohifes/Documents/Literary/Portfolio/SUPERCOLLIDER/2026/synth/image1.jpg");///////////////paste image image1.jpg
s.waitForBoot{
Tdef(\drone, {
//~controlBus = Bus.control(s, 1);

////////////////////////////////////////////////////////////////////////////////////////// wavetable, scales, space,timbre///////////////////////////////////////
~count=[10,2,2,2,2,2];

//////////////////////////////////////////////////////////////////////animation
(
({
var ot=0,dota,pla=0;
var data;
var az=0,el=0;
var sph,mag,r,run = true;
var scale=1,scale1=10,scale2=10,harm,perspective;
var axis=~count.[0],cloud=~count.[1],axis1=~count.[2],gravity1=~count.[3],axis2=~count.[4],gravity2=~count.[5];
var m_x=1,m_y=1,m_z=1,mq=m_x+1;
var sph1,sph2,sph3,sph4,sph7,sph6;
var sph11,sph22,sph33,sph44,sph77,sph66;
var sph_1,sph_2,sph_3,sph_4,sph_7,sph_6;
var sph_11,sph_22,sph_33,sph_44,sph_77,sph_66;
var az1=0,el1=0,az2=0,el2=0,az3=0,el3=0,az4=0,el4=0,az7=0,el7=0,az6=0,el6=0;
var az11=0,el11=0,az22=0,el22=0,az33=0,el33=0,az44=0,el44=0,az77=0,el77=0,az66=0,el66=0;
var az_1=0,el_1=0,az_2=0,el_2=0,az_3=0,el_3=0,az_4=0,el_4=0,az_7=0,el_7=0,az_6=0,el_6=0;
var azimuth,elevation,magnitudex,magnitudey,magnitudez,magnitudeqx;
var magx,magy,magz,magqx,rotation;
var angle=0,angle1=0,angle11=0;
var g=((1+5.sqrt)/2),s=(1+2.sqrt),ott=pi.rand2,temp,space,mod_el=0;
var waveSpeed = 0.1;
var waveFreq = 5;
var amp=1;
var theta,phi ,wave;

	~az=[];~el=[];~magx=[];~magy=[];~magz=[];~qx=[]; ~cart=[];      ~detune=1;
//	spread = if(m_z < 1) { 1 / m_z } { m_z };
~hz=Synth.new(\player);
//~hz.set(\ml,0.1);
data = [];
Window.free;
~w = Window.new("3D Scatterplot", Rect(40,40, 1800, 1000)).front;

~v = UserView.new(~w,Rect(0,0,1800,1000)).background_(Color.black);
a = ScatterView3d(~v, Rect(0,0, 1800,1000), ~data, [-5000, 5000].asSpec,[-5000, 5000].asSpec,[-5000, 5000].asSpec);
a.drawMethod = \fillRect;
a.symbolSize = 2;
a.symbolColor = Color.white;
a.background = Color.clear;
/*b = ScatterView3d(~v, Rect(0,0, 1800,1000), ~data, [-5000, 5000].asSpec,[-5000, 5000].asSpec,[-5000, 5000].asSpec);
b.drawMethod = \fillRect;
b.symbolSize = 2;
b.symbolColor = Color.white;
b.background = Color.clear;*/

  r= Routine({loop{

//scale=5000;
scale=~controlBus4.getSynchronous;
mod_el=~controlBus5.getSynchronous;
scale1=~controlBus1.getSynchronous;
scale2=~controlBus2.getSynchronous;
rotation=~controlBus3.getSynchronous;
harm=10;
temp=1;
space=0;
m_x=m_y=m_z=harm;
mq=harm+1;

	//	~expansion=rotation;
	//	~tempo=rotation;
	//	~re_mix=rotation;
	//	~drive=scale1;
	//	~rect=scale2;



	axis=~count.[0];
	cloud=~count.[1];
	axis1=~count.[2];
	gravity1=~count.[3];
	axis2=~count.[4];
	gravity2=~count.[5];

        az1=0; el1=0;
        az2=0; el2=0;
        az3=0; el3=0;
        az4=0; el4=0;
        az7=0; el7=0;
        az6=0; el6=0;
angle = 0;
angle1 = 0;
angle11 = 0;

az11=0; el11=0;
az22=0; el22=0;
az33=0; el33=0;
az44=0; el44=0;
az77=0; el77=0;
az66=0; el66=0;

az_1=0; el_1=0;
az_2=0; el_2=0;
az_3=0; el_3=0;
az_4=0; el_4=0;
az_7=0; el_7=0;
az_6=0; el_6=0;

        data = [];
	dota=[];
        pla = 0;

	//scale=1;
	//scale.postln;

	(
{
	~az=[];~el=[];~magx=[];~magy=[];~magz=[];~magqx=[];


	axis.do{

//////////////////////////// AZ
cloud.do{

az1=(az1+(2pi-(2pi/s))).wrap(pi.neg,pi);
el1=(el1+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));
angle1=angle;

sph1=Spherical(1,(az1+angle).wrap(pi.neg,pi),(el1+angle).wrap((pi/2).neg,(pi/2)));

axis1.do{

az11=sph1.theta;
el11=sph1.phi;

gravity1.do{

az11=(az11+(2pi-(2pi/s))).wrap(pi.neg,pi);
el11=(el11+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

angle11=angle1;

sph11=Spherical(1/scale1,(az11+angle1).wrap(pi.neg,pi),(el11+angle1).wrap((pi/2).neg,(pi/2)));

sph_1=(sph1.asCartesian+sph11.asCartesian);

axis2.do{

az_1=sph11.theta;
el_1=sph11.phi;

azimuth=gravity2.collect{

az_1=(az_1+(2pi-(2pi/s))).wrap(pi.neg,pi);
el_1=(el_1+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

sph_11=Spherical(1/scale2,(az_1+angle11).wrap(pi.neg,pi),(el_1+angle11).wrap((pi/2).neg,(pi/2)));

(sph_1+sph_11.asCartesian).asSpherical.theta

};

~az=~az++azimuth;
angle11=(angle11+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle1=(angle1+(2pi-(2pi/s))).wrap(0,2pi);

};

};

//////////////////////////// EL
cloud.do{

az2=(az2+(2pi-(2pi/s))).wrap(pi.neg,pi);
el2=(el2+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));
angle1=angle;

sph2=Spherical(1,(az2+angle).wrap(pi.neg,pi),(el2+angle).wrap((pi/2).neg,(pi/2)));

axis1.do{

az22=sph2.theta;
el22=sph2.phi;

gravity1.do{

az22=(az22+(2pi-(2pi/s))).wrap(pi.neg,pi);
el22=(el22+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

angle11=angle1;

sph22=Spherical(1/scale1,(az22+angle1).wrap(pi.neg,pi),(el22+angle1).wrap((pi/2).neg,(pi/2)));

sph_2=(sph2.asCartesian+sph22.asCartesian);

axis2.do{

az_2=sph22.theta;
el_2=sph22.phi;

elevation=gravity2.collect{

az_2=(az_2+(2pi-(2pi/s))).wrap(pi.neg,pi);
el_2=(el_2+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

sph_22=Spherical(1/scale2,(az_2+angle11).wrap(pi.neg,pi),(el_2+angle11).wrap((pi/2).neg,(pi/2)));

(sph_2+sph_22.asCartesian).asSpherical.phi

};

~el=~el++elevation;
angle11=(angle11+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle1=(angle1+(2pi-(2pi/s))).wrap(0,2pi);

};

};

//////////////////////////// MAG X
cloud.do{

az3=(az3+(2pi-(2pi/s))).wrap(pi.neg,pi);
el3=(el3+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));
angle1=angle;

sph3=Spherical(1,(az3+angle).wrap(pi.neg,pi),(el3+angle).wrap((pi/2).neg,(pi/2)));

axis1.do{

az33=sph3.theta;
el33=sph3.phi;

gravity1.do{

az33=(az33+(2pi-(2pi/s))).wrap(pi.neg,pi);
el33=(el33+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

angle11=angle1;

sph33=Spherical(1/scale1,(az33+angle1).wrap(pi.neg,pi),(el33+angle1).wrap((pi/2).neg,(pi/2)));

sph_3=(sph3.asCartesian+sph33.asCartesian);

axis2.do{

az_3=sph33.theta;
el_3=sph33.phi;

magnitudex=gravity2.collect{

az_3=(az_3+(2pi-(2pi/s))).wrap(pi.neg,pi);
el_3=(el_3+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

sph_33=Spherical(1/scale2,(az_3+angle11).wrap(pi.neg,pi),(el_3+angle11).wrap((pi/2).neg,(pi/2)));

magx=((Complex(cos((sph3.theta*m_x)),cos((sph3.theta*m_x))).rho/(2.sqrt))*
(Complex(cos((sph3.phi)),cos((sph3.phi))).rho/(2.sqrt)));

(Spherical(magx,sph3.theta,sph3.phi).asCartesian
+Spherical(magx/scale2,sph_33.theta,sph_33.phi).asCartesian).asSpherical.rho

};

								~magx=~magx++magnitudex;
angle11=(angle11+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle1=(angle1+(2pi-(2pi/s))).wrap(0,2pi);

};

};

//////////////////////////// MAG Y
cloud.do{

az4=(az4+(2pi-(2pi/s))).wrap(pi.neg,pi);
el4=(el4+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));
angle1=angle;

sph4=Spherical(1,(az4+angle).wrap(pi.neg,pi),(el4+angle).wrap((pi/2).neg,(pi/2)));

axis1.do{

az44=sph4.theta;
el44=sph4.phi;

gravity1.do{

az44=(az44+(2pi-(2pi/s))).wrap(pi.neg,pi);
el44=(el44+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

angle11=angle1;

sph44=Spherical(1/scale1,(az44+angle1).wrap(pi.neg,pi),(el44+angle1).wrap((pi/2).neg,(pi/2)));

sph_4=(sph4.asCartesian+sph44.asCartesian);

axis2.do{

az_4=sph44.theta;
el_4=sph44.phi;

magnitudey=gravity2.collect{

az_4=(az_4+(2pi-(2pi/s))).wrap(pi.neg,pi);
el_4=(el_4+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

sph_44=Spherical(1/scale2,(az_4+angle11).wrap(pi.neg,pi),(el_4+angle11).wrap((pi/2).neg,(pi/2)));

magy=((Complex(sin((sph4.theta*m_x)),sin((sph4.theta*m_x))).rho/(2.sqrt))*
(Complex(cos((sph4.phi)),cos((sph4.phi))).rho/(2.sqrt)));

(Spherical(magy,sph4.theta,sph4.phi).asCartesian
+Spherical(magy/scale2,sph_44.theta,sph_44.phi).asCartesian).asSpherical.rho

};

								~magy=~magy++magnitudey;
angle11=(angle11+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle1=(angle1+(2pi-(2pi/s))).wrap(0,2pi);

};

};

//////////////////////////// MAG Z
cloud.do{

az7=(az7+(2pi-(2pi/s))).wrap(pi.neg,pi);
el7=(el7+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));
angle1=angle;

sph7=Spherical(1,(az7+angle).wrap(pi.neg,pi),(el7+angle).wrap((pi/2).neg,(pi/2)));

axis1.do{

az77=sph7.theta;
el77=sph7.phi;

gravity1.do{

az77=(az77+(2pi-(2pi/s))).wrap(pi.neg,pi);
el77=(el77+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

angle11=angle1;

sph77=Spherical(1/scale1,(az77+angle1).wrap(pi.neg,pi),(el77+angle1).wrap((pi/2).neg,(pi/2)));

sph_7=(sph7.asCartesian+sph77.asCartesian);

axis2.do{

az_7=sph77.theta;
el_7=sph77.phi;

magnitudez=gravity2.collect{

az_7=(az_7+(2pi-(2pi/s))).wrap(pi.neg,pi);
el_7=(el_7+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

sph_77=Spherical(1/scale2,(az_7+angle11).wrap(pi.neg,pi),(el_7+angle11).wrap((pi/2).neg,(pi/2)));

magz=(Complex(sin((sph7.phi*m_z)),sin((sph7.phi*m_z))).rho/(2.sqrt));

(Spherical(magz,sph7.theta,sph7.phi).asCartesian
+Spherical(magz/scale2,sph_77.theta,sph_77.phi).asCartesian).asSpherical.rho

};

								~magz=~magz++magnitudez;
angle11=(angle11+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle1=(angle1+(2pi-(2pi/s))).wrap(0,2pi);

};

};

/////////////////////////////////MAG QX
	cloud.do{

az6=(az6+(2pi-(2pi/s))).wrap(pi.neg,pi);
el6=(el6+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));
angle1=angle;

sph6=Spherical(1,(az6+angle).wrap(pi.neg,pi),(el6+angle).wrap((pi/2).neg,(pi/2)));

axis1.do{

az66=sph6.theta;
el66=sph6.phi;

gravity1.do{

az66=(az66+(2pi-(2pi/s))).wrap(pi.neg,pi);
el66=(el66+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

angle11=angle1;

sph66=Spherical(1/scale1,(az66+angle1).wrap(pi.neg,pi),(el66+angle1).wrap((pi/2).neg,(pi/2)));

sph_6=(sph6.asCartesian+sph66.asCartesian);

axis2.do{

az_6=sph66.theta;
el_6=sph66.phi;

magnitudeqx=gravity2.collect{

az_6=(az_6+(2pi-(2pi/s))).wrap(pi.neg,pi);
el_6=(el_6+(pi-(pi/g))).wrap((pi/2).neg,(pi/2));

sph_66=Spherical(1/scale2,(az_6+angle11).wrap(pi.neg,pi),(el_6+angle11).wrap((pi/2).neg,(pi/2)));

		magqx=((((Complex(cos(((sph6.theta)*mq).wrap(pi.neg,pi)),cos(((sph6.theta)*mq).wrap(pi.neg,pi))))*
(Complex(sin((sph6.phi*(mq-1)).wrap((pi/2).neg,(pi/2))),sin((sph6.phi*(mq-1)).wrap((pi/2).neg,(pi/2)))))*
										(Complex(cos((sph6.phi).wrap((pi/2).neg,(pi/2))),cos((sph6.phi).wrap((pi/2).neg,(pi/2))))))).rho/(2.sqrt));

(Spherical(magqx,sph6.theta,sph6.phi).asCartesian
+Spherical(magqx/scale2,sph_66.theta,sph_66.phi).asCartesian).asSpherical.rho

};

								~magqx=~magqx++magnitudeqx;
angle11=(angle11+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle1=(angle1+(2pi-(2pi/s))).wrap(0,2pi);

};

};

angle=(angle+(2pi-(2pi/s))).wrap(0,2pi);

az1=0;el1=0;
az2=0;el2=0;
az3=0;el3=0;
az4=0;el4=0;
az7=0;el7=0;
az6=0;el6=0;

};
}.value;
);
		(
						~magxb = ~magx.collect { |val, i|

	 theta = ~az[i];
     phi = ~el[i];
	wave = amp*sin((waveFreq * theta) + (waveFreq * phi )- waveSpeed);
    val * wave;
};

		~magyb = ~magy.collect { |val, i|

	 theta = ~az[i];
     phi = ~el[i];
	wave = amp*sin((waveFreq * theta) + (waveFreq * phi )- waveSpeed);
    val * wave;
};

		~magzb = ~magz.collect { |val, i|

	 theta = ~az[i];
     phi = ~el[i];
	wave = amp*sin((waveFreq * theta) + (waveFreq * phi )- waveSpeed);
    val * wave;
};
		);


	dota=(~count.[0]*~count.[1]*~count.[2]*~count.[3]*~count.[4]*~count.[5]).collect{

	az=~az.[pla];
	el=~el.[pla]+mod_el;
	//mag=1000;
			mag=(Cartesian(~magxb.[pla],~magyb.[pla],~magzb.[pla]).rho)/2.sqrt;
	//	mag=mag+(Cartesian(~magqx.[pla],0,0).rho);
	pla=pla+1;
			//mk=(mk+(1-(1/1.6180339887499))).wrap(0,1);
			//sph=Spherical(perspective*scale*mag,az,el).asCartesian.asArray;
			sph=Spherical((scale*mag).wrap(4500,5000),az,el.wrap((pi/16).neg,(pi/16))).asCartesian;
			sph=sph.rotateYZ(0.5pi).asArray;
};
	//mk=(mk+(1200-(1200/1.6180339887499))).wrap(0,1200);
	data =data++dota;

	//data.postln;
        // schedule GUI update on AppClock
        AppClock.sched(0, {
            a.data = data;   // ScatterView3d data
			//b.data = data;

			~v.background_(Color(space,space,space));
            ~v.refresh;
          //  0;               // keep AppClock loop going
        }); /*~cart.postln;*/ (1/8).wait;
};};

);
r.play;


~v.animate;
~v.drawFunc ={

    Pen.translate(1000,600);

		//b.symbolColor = Color.new(red:temp,blue:temp,green:temp);
		//a.symbolColor =Color.new(red:temp,blue:temp,green:temp);
   a.rot(0.25pi,ot,0);
 //b.rot(0.25pi,ot+0.5pi,0);

		ot = (ot + rotation).wrap(0,2pi);
    ~cart = data.collect{|p|

        var x=p[0], y=p[1], z=p[2];
        var rx,ry,rz,point;

point=Cartesian(x,y,z).rotateYZ(0.25pi);
point=Cartesian(x,y,z).rotateXZ(ot);

     ~cart=[point.x,point.y,point.z];

    };
//~cart.postln;
};
//{ while { run } {~v.background_(Color.black); ~v.refresh; (1/8).wait } }.fork(AppClock);
}.defer);

);
		(
		~vertices = 1024;

{
var nn=1.neg, n=0;
var difaz, difel;

difaz = ~vertices.collect{
    nn = nn + 1;
    ~az.[nn]
};

nn = 1.neg;

difel = ~vertices.collect{
    nn = nn + 1;
    ~el.[nn]
};

~cx = [];
~cy = [];
~cz = [];

~vertices.do{
    var az, el;
    var x, y, z;

    az = difaz.[n];
    el = difel.[n];

    // explicit spherical -> cartesian (radius = 1)
    x = cos(el) * cos(az);
    y = cos(el) * sin(az);
    z = sin(el);

    ~cx = ~cx ++ x;
    ~cy = ~cy ++ y;
    ~cz = ~cz ++ z;

    n = n + 1;
};
}.value;
);
////envelope sig
		(
~ne=1.neg;~arraye=56.collect{~ne=~ne+1;2.pow(~ne/56)};
~signalSizee = 2048*1;
);

(
~n=1.neg;~array=992.collect{~n=~n+1;2.pow(~n/992)};
~n=(0-(2pi/992)); ~ph=992.collect{~n=~n+(2pi/992);};
~bufferSize = 4096*8;
~signalSize = 2048*8;
);
(
~wt= Buffer.alloc(s,~bufferSize);
{
var signal,wt;
signal=Signal.sineFill(~signalSize,~array,~ph);
wt = signal.asWavetable;
~wt.loadCollection(wt);
//signal.plot;
}.value;
);
(
~note=21;
(
{
var nn=1.neg;
~scale=~note.collect{nn=nn+1;Scale.dorian.performDegreeToKey(nn,12)};
}.value;
);
);


////////////////////////////////////////////////////////////////////////////////sound
(
SynthDef.new(\synth,{
arg gain=1,lowend=20,s_size=1,room=1,drive=0,au=0,
c=0,az=0,el=0,dicay=2,attack=2,sc=20,ssc=1,mix=0,rect=16,
busArray = #[0,1,2,3,4,5,6,7,8,9,10,11];
var fund,fu=24,n=0,mod_x,mod_y,mod_z,phasex,phasey,phasez,low=0;
var freq1,freq2,freq3,amp1,amp2,amp3,sig1,sig2,sig3,heavy;
var b_x,b_y,b_z,polytope,env,expansion,sph1,sph2,xx,yy,zz,envf;
var g_ch1,g_ch2,g_ch3,g_ch4,s1,s2,s3,s4,a1,a2,a3,a4,mp,mps,mpf,px,py,pz,ptheta,pphi;
var s_x,s_y,s_z,threshold,c1,c2,c3,mp_x,mp_y,mp_z,mps_x,mps_y,mps_z,mpf_x,mpf_y,mpf_z;
var peak, times,signal,rip,enva,key;

s1=Rand(0, ~vertices-1).round(1).asInteger;s2=Rand(0, ~vertices-1).round(1).asInteger;
s3=Rand(0, ~vertices-1).round(1).asInteger;s4=Rand(0, ~vertices-1).round(1).asInteger;

////envelope
signal = Signal.sineFill(~signalSizee, ~arraye, [0]);
signal = signal.rotate(signal.size div: 2);
peak = signal.abs.maxIndex.max(1);
rip = Env.perc(0.5,0.5).asSignal(~signalSizee);
rip = rip * (1 + (signal / 8));
rip = rip.normalize;
peak = peak.min(signal.size - 2).max(1);
times =Array.fill(peak, attack / peak) ++ Array.fill(signal.size - peak - 1, dicay / (signal.size - peak - 1));
enva = Env(rip.asArray, times);
env = EnvGen.ar(enva,doneAction:2)*gain;


//env=EnvGen.ar(Env.perc(attack,dicay,gain),doneAction:2);
envf=EnvGen.ar(Env.new([0,0,pi,pi,2pi],[(dicay/2),(attack/2),(dicay/2),(attack/2)]),doneAction:0);

expansion=2.pow(c.lag(0.01)/16256);
fund=(fu*(9/8))*expansion;
heavy=2.pow(drive.lag(0.01)/16256);

xx = (~vertices * cos(el) * cos(az)).round(1).asInteger.abs;
yy = (~vertices * cos(el) * sin(az)).round(1).asInteger.abs;
zz = (~vertices * sin(el)).round(1).asInteger.abs;
px=Select.kr(xx,~cx);
py=Select.kr(yy,~cy);
pz=Select.kr(zz,~cz);

ptheta=atan2(py,px);
pphi=atan2(pz,(px.squared+py.squared).sqrt);

///osc
mp_x = sc  * cos(pphi) * cos(ptheta);
mp_y = sc  * cos(pphi) * sin(ptheta);
mp_z = sc  * sin(pphi);

mps_x = ssc * cos(pphi) * cos(ptheta);
mps_y = ssc * cos(pphi) * sin(ptheta);
mps_z = ssc * sin(pphi);

mpf_x = cos(pphi) * cos(ptheta);
mpf_y = cos(pphi) * sin(ptheta);
mpf_z = sin(pphi);

b_x=2.pow(mp_x.round(1)/16256);
b_y=2.pow(mp_y.round(1)/16256);
b_z=2.pow(mp_z.round(1)/16256);
s_x=2.pow(Select.kr(mps_x.round(1).abs,~scale).asInteger /12);
s_y=2.pow(Select.kr(mps_y.round(1).abs,~scale).asInteger /12);
s_z=2.pow(Select.kr(mps_z.round(1).abs,~scale).asInteger /12);

key=2.pow(Select.kr(au,~scale).asInteger/12);
fund=fund*key;

mod_x=mpf_x;
mod_y=mpf_y;
mod_z=mpf_z;
//for linear phase mapping use linlin
//for compresse exp smoother maping with more energe towards similar values use complex
//for rational relations between phases and symmetry matrices use atan2 relation insteadof maping
//here since signal is wavefield ratio phases with more sidebands and matrice symmetries may be usefull
//phasex=(Complex(1,mod_x).theta*2)+envf;
//phasey=(Complex(1,mod_y).theta*2)+envf;
//phasez=(Complex(1,mod_z).theta*2)+envf;
phasex=atan2(mod_x,mod_y)+envf;
phasey=atan2(mod_y,mod_z)+envf;
phasez=atan2(mod_z,mod_x)+envf;

freq1=(fund)*b_x*s_x;
freq2=(fund)*b_y*s_y;
freq3=(fund)*b_z*s_z;
amp1=b_x.reciprocal*expansion.reciprocal*s_x.reciprocal*key.reciprocal;
amp2=b_y.reciprocal*expansion.reciprocal*s_y.reciprocal*key.reciprocal;
amp3=b_z.reciprocal*expansion.reciprocal*s_z.reciprocal*key.reciprocal;

c1=FreeVerb.ar(BPF.ar((Osc.ar(~wt.bufnum,freq1,phase:phasex,mul:1200).abs*
SinOsc.ar(freq1,phase:phasex)),freq1,heavy,amp1),mix,room);
c2=FreeVerb.ar(BPF.ar((Osc.ar(~wt.bufnum,freq2,phase:phasey,mul:1200).abs*
SinOsc.ar(freq2,phase:phasey)),freq2,heavy,amp2),mix,room);
c3=FreeVerb.ar(BPF.ar((Osc.ar(~wt.bufnum,freq3,phase:phasez,mul:1200).abs*
SinOsc.ar(freq3,phase:phasez)),freq3,heavy,amp3),mix,room);

////distortion rectifier
sig1=((((SinOsc.ar(freq1*(rect*2),phase:phasex,mul:amp1)).abs+(amp1))*
(SinOsc.ar(freq1*(rect),phase:phasex,mul:amp1))).abs+(amp1))*c1*10;
sig2=((((SinOsc.ar(freq2*(rect*2),phase:phasey,mul:amp2)).abs+(amp2))*
(SinOsc.ar(freq2*(rect),phase:phasey,mul:amp2))).abs+(amp2))*c2*10;
sig3=((((SinOsc.ar(freq3*(rect*2),phase:phasez,mul:amp3)).abs+(amp3))*
(SinOsc.ar(freq3*(rect),phase:phasez,mul:amp3))).abs+(amp3))*c3*10;

sig1=(sig1*mix.linlin(0,1,0.1,2)).softclip;
sig2=(sig2*mix.linlin(0,1,0.1,2)).softclip;
sig3=(sig3*mix.linlin(0,1,0.1,2)).softclip;

//////propagation
sig1=sig1*mp_x.sign;
sig2=sig2*mp_y.sign;
sig3=sig3*mp_z.sign;

///spectral compensation
//sig1=BRF.ar(c1,freq1/2,heavy);
//sig2=BRF.ar(c2,freq2/2,heavy);
//sig3=BRF.ar(c3,freq3/2,heavy);
//sig1=BRF.ar(c1,freq1*4,heavy);
//sig2=BRF.ar(c2,freq2*4,heavy);
//sig3=BRF.ar(c3,freq3*4,heavy);

/////compresion
sig1=HPF.ar(sig1,lowend);
sig2=HPF.ar(sig2, lowend);
sig3=HPF.ar(sig3, lowend);
threshold=(((343/s_size)/fund).reciprocal.ampdb/2.sqrt).dbamp;
sig1=Compander.ar(sig1,c1,threshold,1.2,1/3,0.03,0.15)+BrownNoise.ar(0.000001);
sig2=Compander.ar(sig2,c2,threshold,1.2,1/3,0.03,0.15)+BrownNoise.ar(0.000001);
sig3=Compander.ar(sig3,c3,threshold,1.2,1/3,0.03,0.15)+BrownNoise.ar(0.000001);

/////spat
a1=a2=a3=a4=1;
g_ch1=
(sig1.abs.range(0.001,1)*cos(pphi)*cos(ptheta)*
 sig1.range(0.001,1)*cos(Select.kr(s1,~el)*a1)*cos(Select.kr(s1,~az)*a1))
+
(sig2.abs.range(0.001,1)*cos(pphi)*sin(ptheta)*
 sig2.range(0.001,1)*cos(Select.kr(s1,~el)*a1)*sin(Select.kr(s1,~az)*a1))
+
(sig3.abs.range(0.001,1)*sin(pphi)*
 sig3.range(0.001,1)*sin(Select.kr(s1,~el)*a1));

g_ch2=
(sig1.abs.range(0.001,1)*cos(pphi)*cos(ptheta)*
 sig1.range(0.001,1)*cos(Select.kr(s2,~el)*a2)*cos(Select.kr(s2,~az)*a2))
+
(sig2.abs.range(0.001,1)*cos(pphi)*sin(ptheta)*
 sig2.range(0.001,1)*cos(Select.kr(s2,~el)*a2)*sin(Select.kr(s2,~az)*a2))
+
(sig3.abs.range(0.001,1)*sin(pphi)*
 sig3.range(0.001,1)*sin(Select.kr(s2,~el)*a2));

g_ch3=
(sig1.abs.range(0.001,1)*cos(pphi)*cos(ptheta)*
 sig1.range(0.001,1)*cos(Select.kr(s3,~el)*a3)*cos(Select.kr(s3,~az)*a3))
+
(sig2.abs.range(0.001,1)*cos(pphi)*sin(ptheta)*
 sig2.range(0.001,1)*cos(Select.kr(s3,~el)*a3)*sin(Select.kr(s3,~az)*a3))
+
(sig3.abs.range(0.001,1)*sin(pphi)*
 sig3.range(0.001,1)*sin(Select.kr(s3,~el)*a3));

g_ch4=
(sig1.abs.range(0.001,1)*cos(pphi)*cos(ptheta)*
 sig1.range(0.001,1)*cos(Select.kr(s4,~el)*a4)*cos(Select.kr(s4,~az)*a4))
+
(sig2.abs.range(0.001,1)*cos(pphi)*sin(ptheta)*
 sig2.range(0.001,1)*cos(Select.kr(s4,~el)*a4)*sin(Select.kr(s4,~az)*a4))
+
(sig3.abs.range(0.001,1)*sin(pphi)*
 sig3.range(0.001,1)*sin(Select.kr(s4,~el)*a4));

(
Out.ar(busArray.[0],LeakDC.ar(sig1*env));
Out.ar(busArray.[1],LeakDC.ar(sig2*env));
Out.ar(busArray.[2],LeakDC.ar(sig3*env));
)
///comment out the above parentheses and uncomment the below to use the synth on
///threefold speaker wavefield quad spat (12ch)/// to puput stereo sets (x,y) not use z channel as ouput (2,5,etc), sig3.
/*(
Out.ar(busArray.[0],LeakDC.ar(sig1*env*g_ch1));
Out.ar(busArray.[1],LeakDC.ar(sig2*env*g_ch1));
Out.ar(busArray.[2],LeakDC.ar(sig3*env*g_ch1));
Out.ar(busArray.[3],LeakDC.ar(sig1*env*g_ch2));
Out.ar(busArray.[4],LeakDC.ar(sig2*env*g_ch2));
Out.ar(busArray.[5],LeakDC.ar(sig3*env*g_ch2));
Out.ar(busArray.[6],LeakDC.ar(sig1*env*g_ch3));
Out.ar(busArray.[7],LeakDC.ar(sig2*env*g_ch3));
Out.ar(busArray.[8],LeakDC.ar(sig3*env*g_ch3));
Out.ar(busArray.[9],LeakDC.ar(sig1*env*g_ch4));
Out.ar(busArray.[10],LeakDC.ar(sig2*env*g_ch4));
Out.ar(busArray.[11],LeakDC.ar(sig3*env*g_ch4));
)*/

}).add;
);
5.wait;
/////////////////////////////////////////////////////////////////////////////////////////////////////////sequencer,pattern
(
({
var m1=1.neg, m2=1.neg, m3=1.neg,a,b,c,d,n=0,bank=8,time=32.reciprocal,beat=1,r=0;
~r=0;~r1=0;~r2=0;

~azr=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~elr=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];

~dur1=[];~dur2=[];~dur3=[];
~dx=[];~dy=[];~dz=[];
~durx=[];~dury=[];~durz=[];
~dur=[];

bank.do{
    m1=m2=m3=~vertices.rand;

    ~x=1.collect{
        var az, el, x, y, z, xr, yr, zr;

        az = ~az.[m1];
        el = ~el.[m1];

        // spherical (beat = radius)
        x = beat * cos(el) * cos(az);
        y = beat * cos(el) * sin(az);
        z = beat * sin(el);

        // rotate (~r, ~r1, ~r2) approximated as axis rotations
        xr = x*cos(~r) - y*sin(~r);
        yr = x*sin(~r) + y*cos(~r);
        zr = z;

        xr = xr;
        2.pow(xr).round(time);
    };

    ~y=1.collect{
        var az, el, x, y, z, xr, yr, zr;

        az = ~az.[m2];
        el = ~el.[m2];

        x = beat * cos(el) * cos(az);
        y = beat * cos(el) * sin(az);
        z = beat * sin(el);

        xr = x*cos(~r1) - z*sin(~r1);
        zr = x*sin(~r1) + z*cos(~r1);

        yr = y;

        yr = yr;
        2.pow(yr).round(time);
    };

    ~z=1.collect{
        var az, el, x, y, z, xr, yr, zr;

        az = ~az.[m3];
        el = ~el.[m3];

        x = beat * cos(el) * cos(az);
        y = beat * cos(el) * sin(az);
        z = beat * sin(el);

        yr = y*cos(~r2) - z*sin(~r2);
        zr = y*sin(~r2) + z*cos(~r2);

        xr = x;

        zr = zr;
        2.pow(zr).round(time);
    };

    m1=1.neg; m2=1.neg; m3=1.neg;

    ~dx=~dx++~x;
    ~dy=~dy++~y;
    ~dz=~dz++~z;

    ~x=[]; ~y=[]; ~z=[];
    r=r+90.degrad;
};

n=0;
bank.do{ ~dur1=~dur1++~dx.[n]; n=n+1;}; n=0;
bank.do{ ~dur2=~dur2++~dy.[n]; n=n+1;}; n=0;
bank.do{ ~dur3=~dur3++~dz.[n]; n=n+1;}; n=0;

~dur=~dur++~dur1++~dur2++~dur3;

			}.value);

~gain=1;~drive=0;~c=0;~attack=0.01;~decay=1;~s_size=1;~lowend=20;~room=0;
~incr1=0;~incr2=0;~sc=1;~gold=((1+5.sqrt)/2);~silver=(1+2.sqrt);
~incr=0;~ssc=26;~mix=0;~rect=16;
//~seq= Pseq([~dur.[0],Rest(~dur.[13.rand]),~dur.[1],Rest(~dur.[13.rand]),~dur.[2],Rest(~dur.[13.rand]),~dur.[3]] ,inf);
TempoClock.default.tempo_(0.01);

~pattern = Pdef(\1,
Pbind(\instrument, \synth,
\dur, Pseq(~dur ,inf),\s_size,Pfunc { ~s_size }, \lowend,Pfunc { ~lowend }, \room,Pfunc { ~room },
\gain,Pfunc { ~gain }, \sc, Pfunc { ~sc },\drive, Pfunc { ~drive },\au,Pseq([2,11,7,5,3],inf),
\c, Pfunc { ~c },\mix, Pfunc{~mix},\rect,Pfunc{~rect},
\az, Pseries(0, Pfunc{~incr1}, inf).collect(_.wrap(pi.neg, pi)),
\el, Pseries(0, Pfunc{~incr2}, inf).collect(_.wrap(0.5pi.neg, 0.5pi)),
\attack,  Pfunc { ~attack }, \dicay, Pfunc { ~decay }, \ssc, Pfunc{~ssc};
));
~pattern.play;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////gui
(
{
var size,sk,compass,n,scl,r,ssk=20,scope1,scope2,scope3,scope4,meter;
size=700; sk=(size/30); n=(2pi/9).neg; scl=(size/4); r=2;
compass=10.collect{n=n+(2pi/10); (exp(Complex(0,1)*n)*scl)};

w = Window("synthf", Rect(50, 50, size*2, size)).front;
~vw = UserView(w, Rect(0,0,size,size)).drawFunc_({ ~img_print.drawInRect(~vw.bounds)});
~vw1 = UserView(w,Rect(size,0,size,size)).background_(Color.black);
~logView = ListView( ~vw1, Rect(0, 0, 40, 750))
.background_(Color.black).stringColor_(Color.white)
.font_(Font("Arial", 20))
.items_([]);
~logItems = List.new;
~log = { |msg| {~logItems.add(msg); if(~logItems.size > 200) { ~logItems.removeAt(0);  };
 ~logView.items_(~logItems.asArray); ~logView.value_(~logItems.size - 1); }.defer;};

scope1 = FreqScopeView(~vw1, Rect(sk+100+50,sk+ssk+30,  sk+350, sk+100));
scope1.active_(true);scope1.dbRange_(120);scope1.inBus_(0);scope1.freqMode_(0);
scope2 = FreqScopeView(~vw1, Rect(sk+100+50, sk+ssk+180,  sk+350, sk+100));
scope2.active_(true);scope2.dbRange_(120);scope2.inBus_(1);scope2.freqMode_(0);
scope3 = FreqScopeView(~vw1, Rect(sk+100+50, sk+ssk+330, sk+350, sk+100));
scope3.active_(true);scope3.dbRange_(120);scope3.inBus_(2);scope3.freqMode_(0);
(
~sl1=Knob.new(~vw, Rect.aboutPoint((compass.[0].real+(size/r)) @ (compass.[0].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,1,16256/3).round(1).asInteger.postln;
~sc=value;
~log.(value.asString);
});
);
(
~sl2=Knob.new(~vw, Rect.aboutPoint((compass.[1].real+(size/r)) @ (compass.[1].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linlin(0,1,(16256*4).neg,(16256*3)).round(1).asInteger.postln;
~drive=value;
~log.(value.asString);
});
);
(
~sl4=Knob.new(~vw, Rect.aboutPoint((compass.[2].real+(size/r)) @ (compass.[2].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,0.01,4).postln;
~attack=value;
~log.(value.asString);
});
);
(
~sl3=Knob.new(~vw, Rect.aboutPoint((compass.[3].real+(size/r)) @ (compass.[3].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,1,~note).round(1).asInteger.postln;
~ssc=value;
~log.(value.asString);
});
);
(
~sl5=Knob.new(~vw, Rect.aboutPoint((compass.[4].real+(size/r)) @ (compass.[4].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linlin(0,1,0,16256*3).round(1).asInteger.postln;
~c=value;
~log.(value.asString);
});
);
(
~sl6=Knob.new(~vw, Rect.aboutPoint((compass.[5].real+(size/r)) @ (compass.[5].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,1,8).postln;
~decay=value;
~log.(value.asString);
});
);
(
~sl7=Knob.new(~vw, Rect.aboutPoint((compass.[6].real+(size/r))@ (compass.[6].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,1/16,8).round(1/64).postln;
TempoClock.default.tempo_(value);
~log.(value.asString);
});
);
(
~sl8=Knob.new(~vw, Rect.aboutPoint((compass.[7].real+(size/r))@ (compass.[7].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linlin(0,1,0.degrad,2pi-(2pi/~silver)).round((2pi/992).degrad).postln;
~incr1=value;
~log.(value.asString);
});
);
(
~sl9=Knob.new(~vw, Rect.aboutPoint((compass.[8].real+(size/r))@ (compass.[8].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linlin(0,1,0.degrad,pi-(pi/~gold)).round((pi/992).degrad).postln;
~incr2=value;
~log.(value.asString);
});
);
(
~sl10=Knob.new(~vw, Rect.aboutPoint((compass.[9].real+(size/r))@ (compass.[9].imag+(size/r)), sk, sk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,0.01,1).postln;
~mix=value;
~log.(value.asString);
});
);
(
~sl01=Knob.new(~vw1, Rect.new(sk+sk+50+50+sk,sk+sk, sk+ssk, sk+ssk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,0.001,2pi).postln;
~gain=value;
~log.(value.asString);
});
);
(
~sl02=Knob.new(~vw1, Rect.new(sk+sk+150+50+sk,sk+sk, sk+ssk, sk+ssk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,0.05,3).postln;
~s_size=value;
~log.(value.asString);
});
);
(
~sl03=Knob.new(~vw1, Rect.new(sk+sk+250+50+sk,sk+sk, sk+ssk, sk+ssk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linlin(0,1,10,100).postln;
~lowend=value;
~log.(value.asString);
});
);
(
~sl04=Knob.new(~vw1, Rect.new(sk+sk+350+50+sk,sk+sk, sk+ssk, sk+ssk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linexp(0,1,0.01,1).postln;
~room=value;
~log.(value.asString);
});
);
(
~sl05=Knob.new(~vw1, Rect.new(sk+sk+450+50+sk,sk+sk, sk+ssk, sk+ssk)).
background_(Color.black).action_({
arg obj;
var value;
value=obj.value.linlin(0,1,1,16).postln;
~rect=value;
~log.(value.asString);
});
)
}.defer
)
)
}); Tdef(\drone).play;
}
)






/////space symmetric, for music keys, timbre or vbap
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////spaces
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////tetrahedron
(
~azimuth=[45.degrad,135.neg.degrad,45.neg.degrad,135.degrad];
~elevation=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad];
);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////cube
(
~azimuth=[45.degrad,135.degrad,45.neg.degrad,135.neg.degrad,45.degrad,135.degrad,45.neg.degrad,135.neg.degrad];
~elevation=[35.264390.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,35.264390.degrad,35.264390.degrad,35.264390.degrad,35.264390.degrad];
)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////octahedron
(
~azimuth=[0.degrad,0.degrad,90.degrad,180.degrad,90.neg.degrad,0.degrad];
~elevation=[90.neg.degrad,0.degrad,0.degrad,0.degrad,0.degrad,90.degrad];
)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////icosahedron
(
~azimuth=[90.degrad,90.neg.degrad,0.degrad,180.degrad,58.28.degrad,121.72.degrad,121.72.neg.degrad,58.neg.degrad,90.degrad,90.neg.degrad,0.degrad,180.degrad];
~elevation=[58.28.neg.degrad,58.28.neg.degrad,31.72.neg.degrad,31.72.neg.degrad,0.degrad,0.degrad,0.degrad,0.degrad,58.28.degrad,58.28.degrad,31.72.degrad,31.72.degrad];
)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////dodecahedron
(
~azimuth=[45.degrad,135.neg.degrad,135.degrad,45.neg.degrad,90.degrad,90.neg.degrad,0.degrad,180.degrad,45.degrad,135.neg.degrad,135.degrad,45.neg.degrad,90.degrad,
	90.neg.degrad,69.09.degrad,110.91.degrad,110.91.neg.degrad,69.09.neg.degrad,0.degrad,180.degrad];

~elevation=[35.26.neg.degrad,35.26.neg.degrad,35.26.neg.degrad,35.26.neg.degrad,69.09.neg.degrad,69.09.neg.degrad,20.91.neg.degrad,20.91.neg.degrad,
	35.26.degrad,35.26.degrad,35.26.degrad,35.26.degrad,69.09.degrad,69.09.degrad,0.degrad,0.degrad,0.degrad,0.degrad,20.91.degrad,20.91.degrad]
)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Rhombic dodecahedron
(
~azimuth=[0.degrad,45.degrad,135.neg.degrad,135.degrad,45.neg.degrad,0.degrad,180.degrad,90.degrad,90.neg.degrad,0.degrad,
	45.degrad,135.neg.degrad,135.degrad,45.neg.degrad];
~elevation=[90.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,35.264390.neg.degrad,0.degrad
	,0.degrad,0.degrad,0.degrad,90.degrad,35.264390.degrad,35.264390.degrad,35.264390.degrad,35.264390.degrad];
)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////cuboctahedron
(
~azimuth=[0.degrad,90.degrad,180.degrad,90.neg.degrad,45.degrad,135.degrad,45.neg.degrad,135.neg.degrad,
	0.degrad,90.degrad,180.degrad,90.neg.degrad];
~elevation=[45.neg.degrad,45.neg.degrad,45.neg.degrad,45.neg.degrad,0.degrad,0.degrad,0.degrad,0.degrad,
	45.degrad,45.degrad,45.degrad,45.degrad];
)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Rhombic Triacontahedron
(
~azimuth=[0.degrad,0.degrad,72.degrad,144.degrad,144.neg.degrad,72.neg.degrad,36.degrad,108.degrad,180.degrad,108.neg.degrad,36.neg.degrad,
	0.degrad,72.degrad,144.degrad,144.neg.degrad,72.neg.degrad,36.degrad,108.degrad,180.degrad,108.neg.degrad,36.neg.degrad,
	0.degrad,72.degrad,144.degrad,144.neg.degrad,72.neg.degrad,36.degrad,108.degrad,180.degrad,108.neg.degrad,36.neg.degrad,0.degrad];

~elevation=[90.neg.degrad,52.6.neg.degrad,52.6.neg.degrad,52.6.neg.degrad,52.6.neg.degrad,52.6.neg.degrad,26.6.neg.degrad,26.6.neg.degrad,26.6.neg.degrad,26.6.neg.degrad,26.6.neg.degrad,10.8.neg.degrad,10.8.neg.degrad,10.8.neg.degrad,10.8.neg.degrad,10.8.neg.degrad,52.6.degrad,52.6.degrad,52.6.degrad,52.6.degrad,52.6.degrad,26.6.degrad,26.6.degrad,26.6.degrad,26.6.degrad,26.6.degrad,10.8.degrad,10.8.degrad,10.8.degrad,10.8.degrad,10.8.degrad,90.degrad];

)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////icosidodecahedron
(
~azimuth=[18.degrad,90.degrad,162.degrad,126.neg.degrad,54.neg.degrad,54.degrad,126.degrad,162.neg.degrad,90.neg.degrad,18.neg.degrad,
	0.degrad,36.degrad,72.degrad,108.degrad,144.degrad,180.degrad,144.neg.degrad,108.neg.degrad,72.neg.degrad,36.neg.degrad,
	54.degrad,126.degrad,162.neg.degrad,90.neg.degrad,18.neg.degrad,18.degrad,90.degrad,162.degrad,126.neg.degrad,54.neg.degrad];

~elevation=[58.283.degrad,58.283.degrad,58.283.degrad,58.283.degrad,58.283.degrad,58.283.neg.degrad,58.283.neg.degrad,58.283.neg.degrad,58.283.neg.degrad,58.283.neg.degrad,0.degrad,0.degrad,0.degrad,0.degrad,0.degrad,0.degrad,0.degrad,0.degrad,0.degrad,0.degrad,
37.717.degrad,37.717.degrad,37.717.degrad,37.717.degrad,37.717.degrad,37.717.neg.degrad,37.717.neg.degrad,37.717.neg.degrad,37.717.neg.degrad,37.717.neg.degrad];
)*/