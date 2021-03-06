% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bagEarth.R
\name{bagEarth}
\alias{bagEarth}
\alias{print.bagEarth}
\alias{bagEarth.default}
\alias{bagEarth.formula}
\alias{bagEarth.default}
\alias{bagEarth.formula}
\alias{print.bagEarth}
\title{Bagged Earth}
\usage{
bagEarth(x, ...)

\method{bagEarth}{default}(x, y, weights = NULL, B = 50, summary = mean,
  keepX = TRUE, ...)

\method{bagEarth}{formula}(formula, data = NULL, B = 50, summary = mean,
  keepX = TRUE, ..., subset, weights = NULL, na.action = na.omit)

\method{print}{bagEarth}(x, ...)
}
\arguments{
\item{x}{matrix or data frame of 'x' values for examples.}

\item{\dots}{arguments passed to the \code{earth} function}

\item{y}{matrix or data frame of numeric values outcomes.}

\item{weights}{(case) weights for each example - if missing defaults to 1.}

\item{B}{the number of bootstrap samples}

\item{summary}{a function with a single argument specifying how the bagged predictions should be summarized}

\item{keepX}{a logical: should the original training data be kept?}

\item{formula}{A formula of the form \code{y ~ x1 + x2 + ...}}

\item{data}{Data frame from which variables specified in  'formula' are
preferentially to be taken.}

\item{subset}{An index vector specifying the cases to be used in the
training sample.  (NOTE: If given, this argument must be
named.)}

\item{na.action}{A function to specify the action to be taken if 'NA's are
found. The default action is for the procedure to fail.  An
alternative is na.omit, which leads to rejection of cases
with missing values on any required variable.  (NOTE: If
given, this argument must be named.)}
}
\value{
A list with elements
\item{fit }{a list of \code{B} Earth fits}
\item{B }{the number of bootstrap samples}
\item{call }{the function call}
\item{x }{either \code{NULL} or the value of \code{x}, depending on the
  value of \code{keepX}}
\item{oob}{a matrix of performance estimates for each bootstrap sample}
}
\description{
A bagging wrapper for multivariate adaptive regression
splines (MARS) via the \code{earth} function
}
\details{
The function computes a Earth model for each bootstap sample.
}
\examples{
\dontrun{
library(mda)
library(earth)
data(trees)
fit1 <- earth(x = trees[,-3], y = trees[,3])
set.seed(2189)
fit2 <- bagEarth(x = trees[,-3], y = trees[,3], B = 10)
}

}
\references{
J. Friedman, ``Multivariate Adaptive Regression Splines'' (with
discussion) (1991).  Annals of Statistics, 19/1, 1-141.
}
\seealso{
\code{\link[earth]{earth}}, \code{\link{predict.bagEarth}}
}
\author{
Max Kuhn (\code{bagEarth.formula} is based on Ripley's \code{nnet.formula})
}
\keyword{regression}
