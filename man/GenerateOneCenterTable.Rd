% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01.GenerateData.R
\name{GenerateOneCenterTable}
\alias{GenerateOneCenterTable}
\title{Generate one data center and its table}
\usage{
GenerateOneCenterTable(n, AssignCovariates, alphas, betas, survParams, ...)
}
\arguments{
\item{n}{study site-specific sample size}

\item{AssignCovariates}{covariate generation functions that takes n and p as the only arguments.}

\item{alphas}{parameter vector for treatment model including c(alpha0, alphaX)}

\item{betas}{parameter vector for outcome model shared among binary and survival outcome models including \code{c(beta0, betaX, betaA, betaXA)}.}

\item{survParams}{vector of two. The first element is the baseline hazard of events in the exponential event time outcome model (\code{lambda}). The second element is the baseline hazard of censoring in the exponential censoring time model (\code{lambda_c}).}

\item{...}{parameters for tableone::CreateTableOne function}
}
\value{
ParamsTableOne object containing parameter values and TableOne object defined in \code{tableone}. The true one-year survival variable is added to the variables already in the generated dataset.
}
\description{
Generate one data center with information of n patients, and then generate a baseline characteristics table using the \code{tableone} package.
}
\author{
Kazuki Yoshida
}
