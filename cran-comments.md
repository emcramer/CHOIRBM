## Resubmission

This resubmission updates the maintainer email address, as requested by
CRAN (Kurt Hornik) because mail to the previous address
(emcramer@stanford.edu) was bouncing. See
https://github.com/emcramer/CHOIRBM/issues/5.

The maintainer address in DESCRIPTION is now:

    Eric Cramer <dev.emc503@gmail.com>

I no longer have access to the previous emcramer@stanford.edu address and
am therefore unable to send the usual confirmation from it. I have emailed
CRAN separately to explain this and to offer alternative verification of
my identity as maintainer (GitHub repository and ORCID).

Aside from the maintainer email, the only other change is documentation:
the man/*.Rd files were regenerated with roxygen2 so that all function
arguments are documented (fixing the previously undocumented `method` and
`p.method` arguments). There are no changes to package functionality.

## Test environments
* local macOS (aarch64-apple-darwin20), R 4.4.3

## R CMD check results

0 errors | 0 warnings | 2 notes

* checking CRAN incoming feasibility ... NOTE
  New maintainer:
    Eric Cramer <dev.emc503@gmail.com>
  Old maintainer(s):
    Eric Cramer <emcramer@stanford.edu>
  This is the intended maintainer email change described above.

* checking for future file timestamps ... NOTE
  unable to verify current time
  This note is environmental (the check host could not reach the time
  server) and is unrelated to the package.
