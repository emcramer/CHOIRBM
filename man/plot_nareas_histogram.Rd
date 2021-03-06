% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_nareas_histogram.R
\name{plot_nareas_histogram}
\alias{plot_nareas_histogram}
\title{Plots a histogram of the number of CBM areas indicated}
\usage{
plot_nareas_histogram(cbms, ...)
}
\arguments{
\item{cbms}{a list of delimited CBM strings}

\item{...}{additional arguments passed to geom_histogram}
}
\value{
a histogram of the number of CBM areas endorsed by individuals in
the dataset.
}
\description{
This is a wrapper for ggplot2's histogram function that incorporates
calculating the number of CBM areas each individual indicates.
}
\examples{
\dontrun{
data(validation)
below20 <- validation[
 sapply(validation$bodymap_regions_csv, num_areas) < 20
 , ]
plot_nareas_histogram(
 below20$bodymap_regions_csv
 , binwidth = 1
 , fill = "grey"
 , color = "white")
}
}
