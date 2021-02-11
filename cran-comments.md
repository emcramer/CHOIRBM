## Resubmission notes
Addressing the following feedback:  
"Found the following (possibly) invalid URLs:
     URL: http://www.choir.stanford.edu
       From: README.md
       Status: Error
       Message: libcurl error code 6:
                Could not resolve host: www.choir.stanford.edu
Well, there is:
https://choir.stanford.edu/
Please fix and resubmit."

I changed the http to https in the CHOIR url and the host resolves now with R CMD check and on rhub.

## Initial submission notes
This is a new package that makes it easier for researchers to visualize and analyze
human body map data using the [CHOIR Body Map](https://journals.lww.com/10.1097/PR9.0000000000000880) (an instrument for recording the anatomical location of patients' pain).

## Test environments
* local R installation, R 4.0.3
* ubuntu 16.04 (on travis-ci), R 4.0.3
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
