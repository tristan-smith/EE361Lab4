---
title: Measuring Received Signal Power
subtitle: EE361 Lab 4
author: Tristan Smith & Arick Grootveld
documentclass: article
numbersections: true
header-includes: |
  \usepackage{amsmath}
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
Another factor that can heavily effect how much power you receive is the polarization of your antenna. As waves propogate out from the transmitter, they oscillate either vertically or horizontally, and on the receiver side if your antenna is not matched with the correct orientation then your received power will drop heavily. One final component that effects the received power of your signal is the multipath of the signals propogation. 
Multipath happens when a signal bounces off of a peice of terrain like a building, but takes still finds it's way to the receiver. This can cause distortions in the signal, as 
you can get either constructive or destructive interference based on the phase change that is introduced from the different amount of time that the two signals take to 
reach the receiver.

# Experimental Design

## Tuning In To FM Radio \label{design-fm-radio}
First, we used our SDR receiver to tune in to an FM radio station.
We adjusted the RF gain of the device to 19.7dB, and set the sample rate to 2.4 megasamples per second.
We selected the "WFM" option to enable wideband FM, then listened in at 88.1MHz.
Terry O'Reilly, of CBC/2's Under the Influence joined us for the duration of our measurements.

## Antenna Placement and Orientation
Next, we developed a strategy for measuring received power.
We noticed that the relative power shown in the spectrum viewer varied widely over time, so we turned the decay of the spectrum up to about 50%.
With a higher decay, we saw a more consistently shaped spectrum over a window of time.

We saw two main shapes: a rounded triangular shape, and a rectangular shape.
In the case of the rectangular shape, we measure both the width and height, and compute the area to measure received power.
In the case of the rounded triangular shape, we reflected that a triangular shape in logarithmic scale is very close to an impulse in linear scale.
So, we recorded the peak value, which was at the center frequency for each transmitter.

We also recorded estimates of the signal-to-noise ratio, and noticed that antenna orientation had a large effect on the relative received power of the signal.

## Effect of RF Gain
Again, we tuned to 88.1MHz CBC/2 (Under the Influence, with Terry O'Reilly), and measured the following as we adjusted the RF gain of the SDR:

- Noise Floor
- SNR
- Relative Received Power

## Received Power Measurements of FM Radio Stations


## Received Power Measurements of Digital FM Radio Stations


## Public Service Frequencies


## Foxhunting and Path-Loss Modeling

# Results

## FM Radio
After adjusting our SDR as specified in Section \ref{design-fm-radio}, we picked up a station at 150.7MHz (Table \ref{fm}).
Then, we tuned in to Western Washington University KUGS, as shown in Figure \ref{kugs}.

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

Table: Relative Received Power of Three Analog FM Radio Stations

| Frequency (MHz) | Call Sign | Strength | Distance (mi) | Measured Relative Received Power (dB) | Effective Radiated Power |
| --- | --- | --- | --- | --- | --- |
| 88.1 | CBU/2 | Relatively peaky | 46.8 | -22dB |  |
| 89.3 | KUGS |  | 1.0 | -30 |  |
| 91.7 | KZAZ |  | 3.8 | -45 |  |

## Received Power Measurements of Digital FM Radio Stations


Table: Relative Received Power of Three Digital FM Radio Stations

| Frequency (MHz) | Call Sign | Distance (mi) | Height x Width (dB x MHz) | Measured Relative Received Power (dB) | Effective Radiated Power |
| --- | --- | --- | --- | --- | --- |
| 92.9 | KISM | 16.7 | -35 x 0.075 | |
| 103.5 | CHQM | 46.9 | -38.5 x 0.125 | |
| 104.1 | KAFE | 16.7 | -54 x 0.070 | |

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

# Conclusion

# References

::: {#refs}
:::

\appendix
\section*{Appendices}
