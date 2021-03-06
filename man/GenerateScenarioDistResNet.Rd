% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01.GenerateData.R
\name{GenerateScenarioDistResNet}
\alias{GenerateScenarioDistResNet}
\title{Generate ScenarioDistResNet object containing parameters for a DRN.}
\usage{
GenerateScenarioDistResNet(lstN, lstAssignCovariates, lstAlphas, lstBetas,
  lstSurvParams)
}
\arguments{
\item{lstN}{list of K sample sizes}

\item{lstAssignCovariates}{list of covariate generation functions that takes n and p as the only arguments.}

\item{lstAlphas}{list of K vectors, each of which specifies alpha parameters for the treatment assignment model.}

\item{lstBetas}{list of K vectors, each of which specifies beta parameters for the outcome assignment model.}

\item{lstSurvParams}{list of K vectors, each of which specifies survival parameters.}
}
\value{
ScenarioDistResNet object.
}
\description{
Generate a ScenarioDistResNet object, a set of parameters specifying a distributed research network data generation. The number of sites are implied by the length of parameters (K).
}
\author{
Kazuki Yoshida
}
