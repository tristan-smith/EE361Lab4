---
title: Measuring Received Signal Power
subtitle: EE361 Lab 4
author: Tristan Smith & Arick Grootveld
documentclass: article
numbersections: true
header-includes: |
  \usepackage{amsmath}
  \usepackage{tabularx}
references: 
- 
---

\vspace*{\fill}

Performed: May 10th, 2019

Due: May 21st, 2019

\thispagestyle{empty}
\clearpage
\setcounter{page}{1}

\section*{Abstract}
This document outlines a procedure to qualitatively measure radio frequency (RF) signals in the real world, and to increase intuition when working with antennas and radio receivers. In these experiments, we use an affordable software defined radio (SDR) to tune in to public radio stations as far away as Vancouver, BC, as well as pick up public service bands used by emergency workers. Finally, we used the receiver to locate a hidden transmitter on campus.

# Equipment and Parts

* RTL-SDR USB Receiver
* Whip Antenna
* SDR Sharp Software
* Map

# Introduction
Wireless Communication is a large part of the modern world, from cellphones to routers, more and more technology is moving to RF communication.
How these RF signals travel through the world was the primary focus of this lab, with emphasis on determining what it takes to recieve digital and analog signals.
Factors like distance, multipath, signal strength, and SNR all play key roles in deciding what and how you can communicate, as the primary issue that we face with communication systems is bitrate. Higher SNR means you can pack more levels of signals into a signal, more bandwidth means you can get more bits into every second of transmission.
Higher SNR in our case came from increasing the amount of received power that we were getting, as the noise power is dependent on your gain settings and hardware specifications.


Electromagnetic signals traverse mediums by creating changing electric and magnetic fields. These fields have particular properties that can have a large influence on how much power you are receiving. The first property that can heavily influence how much received power you are getting is distance from transmitter to receiver, since for an isotropic receiver and transmitter you are radiating equal power out in all directions, the power of the signal is equally spread out over the surface of a sphere, which leads to a squared power loss over a distance. This means that if you were to go twice as far from the transmitter as you had been, you should receive four times less power. 
Another factor that can heavily effect how much power you receive is the polarization of your antenna. As waves propagate out from the transmitter, they oscillate either vertically or horizontally, and on the receiver side if your antenna is not matched with the correct orientation then your received power will drop heavily. 
One final component that effects the received power of your signal is the multipath of the signals propagation. 
Multipath happens when a signal bounces off of a piece of terrain like a building, but takes still finds it's way to the receiver. This can cause distortions in the signal, as 
you can get either constructive or destructive interference based on the phase change that is introduced from the different amount of time that the two signals take to 
reach the receiver.
Antenna polarization is another subject that is important to radio transmissions, because it can heavily effect the received power. Antenna polarization is the orientation of the antenna with respect to the wave. Because Electromagnetic waves can either travel horizontally or vertically, if your antenna is not oriented in the same direction you will not be giving the signal its full potential to travel down your antenna, and therefore limit the amount of power that you can receive.  

# Experimental Design

## Tuning In To FM Radio \label{design-fm-radio}
First, we used our SDR receiver to tune in to an FM radio station.
We adjusted the RF gain of the device to 19.7dB, and set the sample rate to 2.4 megasamples per second.
We selected the "WFM" option to enable wideband FM, then listened in at 88.1MHz.
Terry O'Reilly, of CBC/2's Under the Influence joined us for the duration of our measurements.

## Antenna Placement and Orientation\label{design-orientation}
Next, we developed a strategy for measuring received power.
We noticed that the relative power shown in the spectrum viewer varied widely over time, so we turned the decay of the spectrum up to about 50%.
With a higher decay, we saw a more consistently shaped spectrum over a window of time.

You will observe two main shapes: a rounded triangular shape, and a rectangular shape.
In the case of the rectangular shape, we measured both the width and height, and compute the area to measure received power.
In the case of the rounded triangular shape, we reflected that a triangular shape in logarithmic scale is very close to an impulse in linear scale.
So, we recorded the peak value, which was at the center frequency for each transmitter.

We also recorded estimates of the signal-to-noise ratio, and noticed that antenna orientation had a large effect on the relative received power of the signal.

## Effect of RF Gain
Again, we tuned to 88.1MHz CBC/2 (Under the Influence, with Terry O'Reilly), and measured the following as we adjusted the RF gain of the SDR:

- Noise Floor
- SNR
- Relative Received Power

## Received Power Measurements of FM Radio Stations\label{design-fm}
Next, we developed a method to measure the relative received power of FM radio stations.
First, we turned up the "S-Decay" on our spectrogram viewer.
This allowed us to smooth out the changes in power due to volume changes in the audio being transmitted.
As a result of this smoothing, we developed two strategies of measurement based on the two shapes mentioned in Section \ref{design-orientation}.
As discussed in Section \ref{design-orientation}, for rectangular frequency content (Section \ref{design-digital}), we measured the width and height.
For rounded triangular frequency content, we measured the peak value.
We measured the relative received power of three different stations, and recorded the following details for each:

- Call Letters
- Frequency
- Distance from Campus
- Relative Receive Power
- Effective Radiated Power (ERP)

## Received Power Measurements of Digital FM Radio Stations\label{design-digital}
We repeated the procedure in Section \ref{design-fm} but for the digital transmissions located in the adjacent bands to some analog radio stations.

## Public Service Frequencies
There are also several frequency bands used by the government and public service organizations.
We switched our SDR's demodulation settings to narrowband FM (NFM) to match public service handheld transmitters.
We also turned the "squelch" setting up to silence the noise during periods of silence.
We recorded the following details:

- Frequencies
- Public service names
- relative received power

## Foxhunting and Path-Loss Modeling
Finally, we used the method of measuring relative received power previously developed to locate a hidden transmitter on campus.
We switched our SDR back to wide-band FM, and tuned into 146.565MHz.
We took periodic measurements of the signal's strength around campus, and walked in the direction of increasing received power.
We recorded ten points on a map as we searched for the transmitter, and more measurements in close range of the transmitter once we were extremely close to it.

# Results

## FM Radio
After adjusting our SDR as specified in Section \ref{design-fm-radio}, we picked up a station at 150.7MHz (Table \ref{fm}).
Then, we tuned in to Western Washington University KUGS, as shown in Figure \ref{kugs}.
We found that there were many random spikes that occurred around our band of interest. 

Table: Tuning In To an FM Radio Station \label{fm}

| Property | Value |
| ---- | --------- |
| Band (MHz) | 150.7 |
| Gain (dB) | 19.7 |
| Sample Rate (Msps) | 2.4 |
| Tuner AGC | OFF |

![KUGS Radio Station\label{kugs}](./KUGS.PNG)

After a few songs, we measured the noise floor (Table \ref{kugs}).

Table: Tuning in to KUGS \label{kugs-table}

| Property | Value |
| --- | --- |
| Noise Floor (dB) | -57 |

## Antenna Placement and Orientation

Next, we observed the effect of antenna orientation on the relative received power and the noise floor (Figures \ref{angle1}, \ref{angle2}, \ref{angle3}).
As a part of these measurements, we noticed several sources of noise. There were several bands containing sharp spikes of interference.
One of these spikes can be seen clearly in Figure \ref{angle1}.
The noise floor was dependent on our location and direction as well.
By moving the antenna, we were able to increase our SNR drastically, or even decrease it to almost zero (Figure \ref{angle3}).

![Antenna Angle 1\label{angle1}](./angle1.PNG)

![Antenna Angle 2\label{angle2}](./angle2.PNG)

![Antenna Angle 3\label{angle3}](./angle3.PNG)

## Effect of RF Gain

Still tuned in to KUGS, we adjusted the RF gain and measured the corresponding noise floor and peak relative received power.
Using this data, we could calculate the SNR (Equation (@snrdb)).
The most useable range of SNR without clipping was around 20dB to 30dB (Table \ref{rfgain}).

(@snrdb) $$ SNR_dB = Peak_dB - Noise Floor_dB $$

Table: Effect of RF Gain, Measured at 88.1MHz \label{rfgain}

| Gain (dB) | Noise Floor (dB) | Peak (dB) | SNR (dB) |
| --------- | ---------------- | --------- | -------- |
| 19.7 | -56 | -25 | 31 |
| 0 | -56 | -42 | 14 |
| 49.6 | -35 | 5 (clipping) | 40 |
| 29.7 | -50 | -12 | 38 |

## Received Power Measurements of FM Radio Stations

Next, we measured the relative received power of three analog FM radio stations, as described in Section \ref{design-fm}.
We recorded the details of each station in Table \ref{t-fm}

Table: Relative Received Power of Three Analog FM Radio Stations\label{t-fm}

| Frequency (MHz) | Call Sign | Strength | Distance (mi) | Measured Relative Received Power (dB) | Effective Radiated Power (kW) |
| --- | --- | --- | --- | --- | --- |
| 88.1 | CBU/2 | Relatively peaky | 46.8 | -22dB | 97.6 |
| 89.3 | KUGS |  | 1.0 | -30 | 0.95 |
| 91.7 | KZAZ |  | 3.8 | -45 | 0.12 |

## Received Power Measurements of Digital FM Radio Stations

We also measured the relative received power of three digital FM radio stations. We performed this measurement by finding the area of each rectangular frequency content band.

$$ Area = Height (dB) * Width (MHz) $$

Then, we 

Table: Relative Received Power of Three Digital FM Radio Stations

\begin{table}[h]
	\centering
	\begin{tabularx}{\textwidth}{X X X X X X}
		\hline
		Frequency (MHz) & Call Sign & Distance (mi) & Height x Width (dB x MHz)
		& Measured Relative Received Power (dB) & Radiated Power \\ \hline 
		
		92.9 & KISM & 16.7 & -35 x 0.075 &  &  \\
		103.5 & CHQM & 46.9 & -38.5 x 0.125 &  & \\
		104.1 & KAFE & 16.7 & -54 x 0.070 & & \\ [1ex] \hline
	\end{tabularx}
\end{table}

## Public Service Frequencies

Table: Public Service Frequencies

| Frequency (MHz) | Public Service | Relative Received Power (dB) | RF Gain (dB) |
| --- | --- | --- | --- |
| 453.225 | Police | -5 | 12.7 |
| 453.55 | Unknown | Not Recorded | 12.5 |

## Foxhunting and Path-Loss Modeling

\begin{figure}
	\centering
	\includegraphics{./WWUCampusMapWithMarkers.PNG}
	\caption{Signal Map}
	\label{signalMap}
\end{figure}

# Discussion

## FM Radio 
In \ref{design-fm-radio} we began to measure signals from external sources. We started out by receiving from KUGS, Westerns local radio station, because it was a signal that we were guaranteed to be able to receive. This was a wideband FM radio signal, which came through extremely clearly in our audio tests. 
The other radio stations were much harder tune into, but this probably had something to do with our ability to navigate the application we were using. 
The small spikes we were seeing in our spectrum was most likely from other radio stations or transmitters that were around our target frequency.

## Antenna Placement and Orientation
In \ref{design-orientation} we found that turning the decay down to about 50% was the most effective way to estimate power, because this was performing more averaging on the signal, which gave us a better picture of the signals average power over time. 
We also found that measuring the peak value of the non-square signals was the best way to estimate their power, because the peak value was where the majority of the power was concentrated. This may not be apparent from the figures shown, but that is because they are on a dB scale, where as on a linear scale the center peak would be many times larger than any of the sidelobes. However for a rectangular pulse shape this would not work, because the whole rectangle has a constant height, which means that the power is distributed over the whole band. This means that we needed to take the total area of the rectangles to get the power of the signal, which simply requires us to convert the frequency spectrum to a dB scale and then you can simply add the width and height to get the power contained inside the signal. 
We found that the effect of antenna orientation was significant when trying to pick up signals. This is because of the polarization of the travelling waves.
If our antenna matched the polarization of the transmitted signal then we would see additional power received. 

## Effect of RF Gain
In this section of the lab we fiddled with the RF gain quite a bit in order to test the effect it had on several parameters.  
We found that the noise floor did not get changed much when we increased the gain, with a gain in the range of 0 to 30 keeping te noise floor around the -50 dB range. However when we increased our gain up to the maximum it could go to, we found that the noise floor was actually significantly increased. But increasing the gain most certainly corresponded with an increase in the noise floor level. 

We believe that the non-linear noise floor must be highly related to the hardware itself, since the noise floor does not scale very heavily with the gain itself, meaning that a large portion of the noise must be being introduced after the gain stage, which could only happen inside the hardware itself.
If we were to take any two data points with different gains, and get the noise floor at each of those points, we would be able to estimate the noise introduced by the hardware by subtracting one value from the other, and then dividing by the gain adjustment that we made. The noise difference value would likely be the portion of the noise that is actually introduced by the rf spectrum (if we assume the amplifier is completely linear). 

Because the noise is not as correlated to the gain as the power is, increasing the RF gain increased the SNR of our signal by a very large amount. The only real limitation to increasing the RF gain all the way up was that it would introduce clipping in our signal, which is a non-linearity that we do not want introduced into our signal. Too small of a gain could mean that our SNR was not high enough for us to distinguish our signal from noise.

A good SNR value that we found was somewhere between 20 and 30 dB, because this meant that we would not see clipping, but still have our noise be relatively low compared to the signal. But because the noise floor was so much lower than the signals we were looking at, really any gain above 10 and below 40 would probably have worked. 


## Received Power Measurements of FM Radio Stations
We measured the relative received power from the FM stations by tuning into the specific frequency and then grabbing a peak.
We then used the peak value of the FM broadcast signal to approximate the power of the signal, for reasons stated earlier. 
We found that some of the received power values did not correspond with transmit towers in the way that we expected, with the received power corresponding inversely with distance to the transmitter, and corresponding positively with the amount of radiated power.

## Received Power Measurements of Digital FM Radio Stations


## Public Service Frequencies


## Foxhunting and Path-Loss Modeling



# Conclusion

# References

::: {#refs}
:::

\appendix
\section*{Appendices}
