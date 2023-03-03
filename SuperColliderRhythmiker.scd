// A little Rhythmical Organ
(
SynthDef(\rhythmiker, { |out|
	// Channel for the Resulting Signa
	var sig,
	// Channels for the Cacluated Durations
	ffr1, ffr2, ffr3, ffr4, ffr5,
	// Channels for the Calculated Pitche
	no1, no2, no3, no4, no5,
	// Channels for the intermediated Signals
	fr1, fr2, fr3, fr4, fr5;

	// Start Values
	// Start Value for Dutration
	ffr1 = 0.3;
	// Start Value for Pitch
	no1 = 440;

	// Starting Impulse Generator
	fr1 = Impulse.kr(ffr1);

	// Intermediated Calculation Steps
	// First Layer
	// Choose a Duration
	ffr2 = TRand.kr(ffr1*2, ffr1*3, fr1);
	// Choose a Pitch
	no2 = TRand.kr(no1/(3/2), no1*(3/2), fr1);
	// Generate a Impulse Signal
	fr2 = Impulse.kr(ffr2);

	// Second Layer see first Layer
	ffr3 = TRand.kr(ffr2*2, ffr2*3, fr2);
	no3 = TRand.kr(no2/(4/3), no2*(4/3), fr2);
	fr3 = Impulse.kr(ffr3);

	// Third Layer see first Layer
	ffr4 = TRand.kr(ffr3*2, ffr3*3, fr3);
	no4 = TRand.kr(no3/(5/4), no3*(5/4), fr3);
	fr4 = Impulse.kr(ffr4);

	// Last Calculation for Pitch
	no5 = TRand.kr(no4/(6/5), no4*(6/5), fr4);

	// PLays a Sinus Pipe with the calculated Oitch
	sig = SinOsc.ar(no5);
	Out.ar(out, sig
	)
}).add;
)

// Plays our little Rhythmical Organ
a = Synth(\rhythmiker);