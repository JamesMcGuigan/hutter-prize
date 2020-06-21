# Hutter Prize for Compressing Human Knowledge - 500'000€

http://prize.hutter1.net/

**Compress the 1GB file enwik9 to less than the current record of about 116MB**

Being able to compress well is closely related to intelligence as explained below. While intelligence is a slippery concept, file sizes are hard numbers. Wikipedia is an extensive snapshot of Human Knowledge. If you can compress the first 1GB of Wikipedia better than your predecessors, your (de)compressor likely has to be smart(er). The intention of this prize is to encourage development of intelligent compressors/programs as a path to AGI.
Interview with Lex Fridman (26.Feb'20) ([Video](https://www.youtube.com/watch?v=E1AxVXt2Gv4), [Audio](https://lexfridman.com/marcus-hutter), [Tweet](https://twitter.com/lexfridman/status/1232726312206393344))

## The Task

Losslessly compress the 1GB file enwik9 to less than 116MB. More precisely:

- Create a Linux or Windows compressor comp.exe of size S1 that compresses enwik9 to archive.exe of size S2 such that S:=S1+S2 &lt; L := 116'673'681 = [previous record](http://prize.hutter1.net/#prev).
- If run, archive.exe produces (without input from other sources) a 10^9 byte file that is identical to enwik9.
- If we can verify your claim, you are eligible for a prize of [500'000€×(1-S/L)](http://prize.hutter1.net/hfaq.htm#money). Minimum claim is 5'000€ (1% improvement).
- Restrictions: Must run in ≲100 hours using a single CPU core and &lt;10GB RAM and &lt;100GB HDD on our [test machine](http://browser.primatelabs.com/v4/cpu/145066).

Remark: You can download the zipped version [enwik9.zip](http://mattmahoney.net/dc/enwik9.zip) of enwik9 here (≈300MB). Please find more details including constraints and relaxations at http://prize.hutter1.net/hrules.htm.

## Motivation

This compression contest is motivated by the fact that being able to compress well is closely related to acting intelligently, thus reducing the slippery concept of intelligence to hard file size numbers. In order to compress data, one has to find regularities in them, which is intrinsically difficult (many researchers live from analyzing data and finding compact models). So compressors beating the current "dumb" compressors need to be smart(er). Since the prize wants to stimulate developing "universally" smart compressors, we need a "universal" corpus of data. Arguably the online encyclopedia Wikipedia is a good snapshot of the Human World Knowledge. So the ultimate compressor of it should "understand" all human knowledge, i.e. be really smart. enwik9 is a hopefully representative 1GB extract from Wikipedia.


## Download
```
mkdir -p ./input/
wget http://mattmahoney.net/dc/enwik9.zip -O input/enwik9.zip
unzip input/enwik9.zip -d input  
```
