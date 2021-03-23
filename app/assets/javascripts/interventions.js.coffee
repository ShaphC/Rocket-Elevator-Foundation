$(document).ready ->
  $(".customer_selection").on "click", ->
    $.ajax
      url: "/intervention/get_buildings"
      type: "GET"
      dataType: "script"
      data:
        # customer_id: $('.customer_selection option:selected').val()
        building_id: $('.building_selection').show();