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

*Versuch #1*

```supercollider

// “... feldman becomes specialist in as, in music, that is as slow as possible… and 

// as soft as possible.” - Karlheinz Stockhausen, English Lectures (1972)

(////////relative indeterminant small group of sinewaves
a = {
    var freq, env, osc;
	~size = [1, 2, 3, 5, 8].choose; // the size of group -> global, how many each time, sometimes only one individual
	freq = Array.exprand(~size, 550.0, 5500.0); // pitch
	env = Env.sine(dur: freq/110, level: 110/freq); // dur and amp
	//env = Env.sine(dur: freq/1110, level: 110/freq); // alternative
  
	osc = {SinOsc.ar(freq)};
	Splay.ar(osc * EnvGen.kr(env, doneAction: Done.freeSelf), spread: 1, level: 0.2, center: 0); // doneAction: 2
  //and, how it sounds with multichannel?
}
)


(//////////interval/silence
fork{
inf.do {a.play;
		{[ ".",  "~"].choose.post}.dup(~size); // use the global parameter ~size
		"".postln;
		exprand(0.1, 50.0).wait; // band width of interval -> limit of time
}
}
)


// 进一步-> stockhausen studie i
// point, group, mass
// statistically, precisely, systematic - indeterminacy, chane operation?
// ...

```

<br>

*Versuch #2.1 - 3xSinOsc, eng frequenziert*

```supercollider
(
t = Task({
          11.do{|i|
                var morph = 27*i;
	            ("i-morph" ++ morph).postln;
		
               "l_sin_fadeTime:".post; // sinuston links
		  Ndef(\l_sin).fadeTime = [5,8,13,21].choose.postln;
          Ndef(\l_sin,
			   {SinOsc.ar(
				          freq: 
				          (("f#5".namecps) * exprand(0.21, 0.26) + morph + SinOsc.kr(1/13, 0, pi.rand)).poll(0.1),
				          mul: "l_sin_amp:".post;
				          [0.11, 0.22, 0.33].choose.postln;)
		        });


		  Ndef(\l_sin).play(0, 1);

" ".postln;

		      "z_sin_fadeTime:".post; // sinuston im zentrum
		  Ndef(\z_sin).fadeTime = [8,13,21].choose.postln;
		  Ndef(\z_sin,
			  {SinOsc.ar(
				         freq: 
				         (("f#5".namecps) * exprand(0.21, 0.28) + morph + SinOsc.kr(1/13, 0, pi.rand)).poll(0.1),
				         mul: 
				         "z_sin_amp:".post;
				         [0.11, 0.22, 0.33].choose.postln;)
		      });

		  Ndef(\z_sin).play(0, 2);

" ".postln;

		     "r_sin_fadeTime:".post; //sinuston rechts
		  Ndef(\r_sin).fadeTime = [8,13,21].choose.postln;
		  Ndef(\r_sin,
			  {SinOsc.ar(
				         freq: 
				         (("f#5".namecps) * exprand(0.21, 0.32) + morph + SinOsc.kr(1/13, 0, pi.rand)).poll(0.1),
				         mul: 
				         "r_sin_amp:".post;
				         [0.11, 0.22, 0.33].choose.postln;)
		      });

		  Ndef(\r_sin).play(1, 1);

" ".postln; 

		 [13, 21, 34].choose.postln.wait;

" ".postln; //换行
};
});
)


t.start;
t.stop;

Ndef(\l_sin).clear(8);
Ndef(\z_sin).clear(13);
Ndef(\r_sin).clear(5);

```

## Referenz

<a name="myfootnote1">1</a>: <i>[Lecture 1 [PARTE 1/4] Stockhausen Karlheinz - English Lectures (1972)](https://www.youtube.com/watch?v=lYmMXB0e17E)<i> <br>
<a name="myfootnote2">2</a>: <i>[Lecture 1 [PARTE 3/4] Stockhausen Karlheinz - English Lectures (1972)](https://www.youtube.com/watch?v=NMvpb8b06H4)<i> <br>
