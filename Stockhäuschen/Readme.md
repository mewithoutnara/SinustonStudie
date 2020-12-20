## Stockhäuschen/小斯托克豪森/小仓库 <br>

erstellt am 14. 12. 2020

<br>

#### The British Lectures - Lecture 1, Part 1 - (Musical Forming) (1972)<sup>[1](#myfootnote1)</sup> <br>

<br>

3 x 3 terms <br>
POINT - GROUP - MASS <br>
DETERMINATE - VARIABLE - STATISTICAL <br>
DEVELOPMENT - SEQUENCE - MOMENT <br>

<br>

#### The British Lectures - Lecture 1, Part 3 - (Musical Forming) (1972)<sup>[2](#myfootnote2)</sup> <br>

<br>

"...statistical methods into musical composition... the term of the band and of the width of the band... whatever the determination is, e.g.: <br>
pitch: highest <-> lowest <br>
rhythm: smallest shortest duration <-> longest duration <br>
timbre: brightest <-> darkest <br>
... <br>
between such limits is called a band. a band has a certain width... <br>
0: determinant situation  <->  extreme maximum: relative indeterminism" <br>

<br>

Versuch #1

```supercollider

//“... feldman becomes speacialist in as, in music , that is as slow as possible… and 

// as soft as possible.” - Karlheinz Stockhausen, English Lectures (1972)

(////////relative indeterminant small group of sinewaves
a = {
    var freq, env, osc;
	~size = [1, 2, 3, 5, 8].choose; // the size of group -> how many each time, sometime only one individual
	freq = Array.exprand(~size, 550.0, 5500.0); // pitch
	env = Env.sine(dur: freq/110, level: 110/freq); // duration and volume
	//env = Env.sine(dur: freq/1110, level: 110/freq); // alternative
  
	osc = {SinOsc.ar(freq)};
	Splay.ar(osc * EnvGen.kr(env, doneAction: Done.freeSelf), spread: 1, level: 0.2, center: 0); // doneAction: 2
  //and, how it sounds with multichannel?
}
)


(//////////interval/silence
fork{
inf.do {a.play;
		{[ ".",  "~"].choose.post}.dup(~size); // gespielt süß...
		"".postln;
		exprand(0.1, 50.0).wait; // band width of interval, limit of time
}
}
)


// 进一步-> stockhausen studie i
// point, group, mass
// statistically, precisely, systematic - indeterminacy, change operation?
// ...

```

<br>

## Referenz

<a name="myfootnote1">1</a>: <i>[Lecture 1 [PARTE 1/4] Stockhausen Karlheinz - English Lectures (1972)](https://www.youtube.com/watch?v=lYmMXB0e17E)<i> <br>
<a name="myfootnote2">2</a>: <i>[Lecture 1 [PARTE 3/4] Stockhausen Karlheinz - English Lectures (1972)](https://www.youtube.com/watch?v=NMvpb8b06H4)<i> <br>
