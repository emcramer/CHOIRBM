% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_concurrence.R
\name{plot_concurrence}
\alias{plot_concurrence}
\title{Plot a concurrence matrix}
\usage{
plot_concurrence(con_mat, ...)
}
\arguments{
\item{con_mat}{a long form data frame or matrix produced by the
plot_concurrence function, with every combination of
locations and the number of times each combination occurs.}

\item{...}{additional parameters for plotting}
}
\value{
a ggplot heatmap of the concurrence.
}
\description{
Generates a concurrence matrix as a heatmap to show which CBM locations are
commonly endorsed together.
}
\examples{
\dontrun{
set.seed(123)
sampled_data <- validation[sample(1:nrow(validation), 100, replace = FALSE),]
con_mat <- comp_concurrence(sampled_data)
plot_concurrence(con_mat)
}
}
