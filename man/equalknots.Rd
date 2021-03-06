\name{equalknots}
\alias{equalknots}

\title{ Define Knots at Equally-Spaced Values }

\description{
This function defines the position of knot or cut-off values at equally-spaced values for spline or strata functions, respectively.
}

\usage{
equalknots(x, nk=NULL, fun="ns", df=1, degree=3, intercept=FALSE)
}

\arguments{
  \item{x }{ a vector variable.}
  \item{nk }{ number of knots or cut-offs.}
  \item{fun }{ character scalar with the name of the function for which the knots or cut-offs must be created. See Details below.}
  \item{df }{ degree of freedom.}
  \item{degree }{ degree of the piecewise polynomial. Only for \code{fun="bs"}.}
  \item{intercept }{ logical. If an intercept is included in the basis function.}
}

\details{
The number of knots is set with the argument \code{nk}, or otherwise determined by the choice of function and number of degrees of freedom through the arguments \code{fun} and \code{df}. Specifically, the number of knots is set to \code{df-1-intercept} for \code{"ns"}, \code{df-degree-intercept} for \code{"bs"}, or \code{df-intercept} for \code{"strata"}.
}

\value{
A numeric vector of knot or cut-off values.
}

\author{Antonio Gasparrini <\email{antonio.gasparrini@lshtm.ac.uk}>}

\seealso{
\code{\link{logknots}} for placing the knots at equally-spaced log values. \code{\link{crossbasis}} to generate cross-basis matrices.

See \code{\link{dlnm-package}} for an introduction to the package and for links to package vignettes providing more detailed information.
}

\examples{
### setting 3 knots for range 0-20
equalknots(20, 3)

### setting knots and cut-offs for different functions
equalknots(20, fun="ns", df=4)
equalknots(20, fun="bs", df=4, degree=2)
equalknots(20, fun="strata", df=4)

### with and without without intercept
equalknots(20, fun="ns", df=4)
equalknots(20, fun="ns", df=4, intercept=TRUE)
}

\keyword{smooth}
