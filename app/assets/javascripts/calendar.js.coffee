class @calendar
  options =
    month: "short"
    day: "numeric"
    year: "numeric"

  constructor: (timestamps, starting_year, starting_month, calendar_activities_path) ->
    cal = new CalHeatMap()
    cal.init
      itemName: ["commit"]
      data: timestamps
      start: new Date(starting_year, starting_month)
      domainLabelFormat: "%b"
      id: "cal-heatmap"
      domain: "month"
      subDomain: "day"
      range: 12
      tooltip: true
      label:
        position: "top"
      legend: [
        0
        1
        4
        7
      ]
      legendCellPadding: 3
      onClick: (date, count) ->
        formated_date = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate()
        $(".calendar_commit_activity").fadeOut 400
        $.ajax
          url: calendar_activities_path
          data:
            date: formated_date
          cache: false
          dataType: "html"
          success: (data) ->
            $(".user-calendar-activities").html data
            $(".calendar_commit_activity").find(".js-toggle-content").hide()
            $(".calendar_commit_activity").fadeIn 400

