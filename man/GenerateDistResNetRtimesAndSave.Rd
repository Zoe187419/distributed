% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01.GenerateData.R
\name{GenerateDistResNetRtimesAndSave}
\alias{GenerateDistResNetRtimesAndSave}
\title{Generate R distributed research network iterations for a single scenario}
\usage{
GenerateDistResNetRtimesAndSave(ScenarioDistResNet, R, scenarioCount, partCount)
}
\arguments{
\item{ScenarioDistResNet}{A ScenarioDistResNet object contained in a Scenarios object generated by \code{\link{GenerateScenarios}}.}

\item{R}{scalar value. Data are generated R times.}

\item{scenarioCount}{scalar value. Indicate the scenario count. Used for data file name.}

\item{partCount}{scalar value. Indicates which subpart of}
}
\value{
Use for its side effect. No return value. Save a data file in the working directory. The data file contains \code{ScenarioDistResNet}, \code{scenarioCount}, \code{R}, and \code{lstIter}. \code{lstIter} is a list of length \code{R}. Each element is a list of \code{K} centers.
}
\description{
Given a parameter set for a single scenario, generate R iterations of distributed research network. Each distributed research network is generated by \code{\link{GenerateDistResNet}} and within-site data preparation is also conducted by \code{\link{RequestSiteDataPreparation}}.
}
\author{
Kazuki Yoshida
}
