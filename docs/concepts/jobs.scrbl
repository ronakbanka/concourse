#lang scribble/manual

@(require "../common.rkt")

@title[#:version version #:tag "jobs"]{Jobs}

At a high level, a job describes some actions to perform when dependent
resources change (or when manually triggered). For example, you may define a
job that runs your unit tests whenever new code is pushed to a repository.

Jobs can be thought of as functions with inputs and outputs, that
automatically run when new inputs are available. A job can depend on the
outputs of upstream jobs, which is the root of pipeline functionality.

The definition of actions to perform is done via a
@seclink["build-plans"]{Build Plan}, which is a very powerful
composition-based DSL that can express anything from running simple unit
tests to running a matrix of tasks and aggregating the result.


@section[#:tag "job-builds"]{Builds}

An instance of execution of a job's plan is called a @emph{build}. A build
can either succeed or fail, or error if something unrelated to your code goes
wrong (for example, if the resources fail to fetch).

When a build runs, the job's plan is realized. Each step described by the
job's plan is executed, and so long as all @secref{tasks} succeed, the
build succeeds. If a task fails, the build fails, and its resources do not
propagate to the rest of the pipeline.

Builds can be accessed while they're running (and also shortly after they
finish) via @seclink["fly-intercept"]{@code{fly intercept}}, which can
greatly help in debugging.

@inject-analytics[]
