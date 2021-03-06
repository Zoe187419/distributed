% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01.GenerateData.R
\name{AssignCovariatesNormBinDefault}
\alias{AssignCovariatesNormBinDefault}
\title{Create independent covariates by default method}
\usage{
AssignCovariatesNormBinDefault(n, p)
}
\arguments{
\item{n}{number of individuals to create}

\item{p}{number of covariates}
}
\value{
n x (p+1) data frame including ID and p covariates
}
\description{
The first covariate is a Normal(0,1) random variable, whereas the other covariates are Bernoulli(p) random variables where p's are specified by the elements of the pp vector.
}
\author{
Kazuki Yoshida
}
