% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/02.ParepareDataWithinSites.R
\name{SiteRegression}
\alias{SiteRegression}
\title{Run site-specific regression analyses}
\usage{
SiteRegression(df)
}
\arguments{
\item{df}{data frame for a single data center preapred by \code{\link{SitePrepareHelperVariables}}. It must have class \code{ResSiteReady}.}
}
\value{
list containing one list for the binary analyses (see \code{\link{SiteRegressionBin}}) and another for the survival analyses (see \code{\link{SiteRegressionSurv}}).
}
\description{
Run site-specific regression analyses and return a data frame.
}
\author{
Kazuki Yoshida
}
