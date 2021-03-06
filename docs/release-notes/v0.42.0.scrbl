#lang scribble/manual

@title[#:style '(quiet unnumbered)]{v0.42.0}

@itemlist[
  @item{
    Debugging and detecting misconfigured or failing resource checks has been
    improved.

    Resources that are failing to check will now be shown as errored in the
    pipeline view. When viewing the resource, the check status will be shown
    on its page, and the last check error will be shown if the user is
    authenticated.
  }

  @item{
    Viewing an already completed build is now much less painful. Rather than
    streaming the events in and drawing the page live, we now process all
    events and @emph{then} render the build. This greatly improves the
    responsiveness of the UI and cuts the overall rendering time by ~6x.
  }

  @item{
    We have fixed a few sources of potential resource leaks in the ATC. If you
    noticed your deployment getting slower over time before, you may want to
    try upgrading. Symptoms include high CPU and high memory use.
  }

  @item{
    Blackbox can now deliver metrics from the ATC to Datadog. To configure
    this, colocate the Blackbox job on your web VMs (be sure to list it as
    the first job template), and set the following property:

    @codeblock|{
      blackbox:
        expvar:
          datadog:
            api_key: blahblahblah
    }|

    Currently emitted metrics are mainly focused on identifying resource
    leaks. If you're noticing your deployment get slower over time, having
    metrics would greatly help in reporting the bug.
  }
]
