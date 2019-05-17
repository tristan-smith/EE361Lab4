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

Due: <++>

\thispagestyle{empty}
\clearpage
\setcounter{page}{1}

\section*{Abstract}

# Equipment and Parts

* RTL-SDR USB Receiver
* Whip Antenna
* SDR Sharp Software
* Map

# Introduction

# Experimental Design

# Results

Table: Tuning In To an FM Radio Station \ref{fm}

| Property | Value |
| ---- | --------- |
| Band (MHz) | 150.7 |
| Gain (dB) | 19.7 |
| Sample Rate (Msps) | 2.4 |
| Tuner AGC | OFF |

Table: Tuning in to KUGS \ref{kugs}

| Property | Value |
| --- | --- |
| Noise Floor (dB) | -57 |

Table: Effect of RF Gain, Measured at 88.1MHz \ref{rfgain}

| Gain (dB) | Noise Floor (dB) | Peak (dB) | SNR (dB) |
| --------- | ---------------- | --------- | -------- |
| 19.7 | -56 | -25 | 31 |
| 0 | -56 | -42 | 14 |
| 49.6 | -35 | 5 (clipping) | 40 |
| 29.7 | -50 | -12 | 38 |

# Discussion

# Conclusion

# References

::: {#refs}
:::

\appendix
\section*{Appendices}
