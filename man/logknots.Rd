\name{logknots}
\alias{logknots}

\title{ Define Knots for Lag Space at Equally-Spaced Log-Values }

\description{
This function defines the position of knot or cut-off values at equally-spaced log-values for spline or strata functions, respectively. It is expressely created for lag-response functions to set the knots or cut-offs placements accordingly with the default of versions of \pkg{dlnm} earlier than 2.0.0.
}

\usage{
logknots(x, nk=NULL, fun="ns", df=1, degree=3, intercept=TRUE)
}

\arguments{
  \item{x }{ an integer scalar or vector of length 2, defining the the maximum lag or the lag range, respectively, or a vector variable.}
  \item{nk }{ number of knots or cut-offs.}
  \item{fun }{ character scalar with the name of the function for which the knots or cut-offs must be created. See Details below.}
  \item{df }{ degree of freedom.}
  \item{degree }{ degree of the piecewise polynomial. Only for \code{fun="bs"}.}
  \item{intercept }{ logical. If an intercept is included in the basis function.}
}

\details{
This functions has been included for consistency with versions of \pkg{dlnm} earlier than 2.0.0, where the default knots or cut-off placements in the lag space for functions \code{ns}, \code{bs} and \code{strata} used to be at equally-spaced values in the log scale. Since version 2.0.0 on, the default is equally-spaced quantiles, similarly to functions defined for the space of predictor. This function can be used to replicate the results obtained with old versions.

The argument \code{x} is usually assumed to represent the maximum lag (if a scalar) or the lag range (if a vector of length 2). Otherwise is interpreted as a vector variable for which the range is computed internally.

The number of knots is set with the argument \code{nk}, or otherwise determined by the choice of function and number of degrees of freedom through the arguments \code{fun} and \code{df}. Specifically, the number of knots is set to \code{df-1-intercept} for \code{"ns"}, \code{df-degree-intercept} for \code{"bs"}, or \code{df-intercept} for \code{"strata"}.

An intercept is included by default (\code{intercept=TRUE}), consistently with the default for the lag space.
}

\value{
A numeric vector of knot or cut-off values, to be used in the \code{arglag} list argument of \code{\link{crossbasis}} for reproducing the default of versions of \pkg{dlnm} earlier than 2.0.0.
}

\author{Antonio Gasparrini <\email{antonio.gasparrini@lshtm.ac.uk}>}

\seealso{
\code{\link{equalknots}} for placing the knots at equally-spaced values. \code{\link{crossbasis}} to generate cross-basis matrices.

See \code{\link{dlnm-package}} for an introduction to the package and for links to package vignettes providing more detailed information.
}

\examples{
### setting 3 knots for lag 0-20
logknots(20, 3)
logknots(c(0,20), 3)

### setting knots and cut-offs for different functions
logknots(20, fun="ns", df=4)
logknots(20, fun="bs", df=4, degree=2)
logknots(20, fun="strata", df=4)

### with and without without intercept
logknots(20, fun="ns", df=4)
logknots(20, fun="ns", df=4, intercept=FALSE)

### replicating an old example in time series analysis
lagknots <- logknots(30, 3)
cb <- crossbasis(chicagoNMMAPS$temp, lag=30, argvar=list(fun="bs",df=5,
  degree=2), arglag=list(knots=lagknots))
summary(cb)
library(splines)
model <- glm(death ~  cb + ns(time, 7*14) + dow, 
  family=quasipoisson(), chicagoNMMAPS)
pred <- crosspred(cb, model, cen=21, by=1)
plot(pred, xlab="Temperature", col="red", zlab="RR", shade=0.6,
  main="3D graph of temperature effect")
}

\keyword{smooth}

