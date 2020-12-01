/* Sinuston_Studie */





/*
  Melatengürtel 23
  50933 Köln

use laptop speakers
with half volume of sound.
open your window,
close the curtain.
*/

s.scope;

Ndef(\a).fadeTime = 120;

Ndef(\a, {SinOsc.ar([350.0, 351.3]*rrand(0.1, 30.0),mul: [0.2, rrand(0.1, 0.3)])});


Ndef(\a).play;
Ndef(\a).clear(3);






// Der dritte Ton

Ndef(\ddt,{SinOsc.ar([1800, 2000], 0, 0.5)})

Ndef(\ddt).play(0, 2);






// Ring Modulation

(
Ndef(\ringmod, {
 var carrier, modulator, modfreq;
 carrier = SoundIn.ar(0, 0.5);
	modfreq = MouseX.kr(1,5000,'exponential').poll(2, "modfreq");
 modulator = SinOsc.ar(modfreq);
 carrier * modulator;
})
)

Ndef(\ringmod).fadeTime = 5;
Ndef(\ringmod).play(0, 1);

