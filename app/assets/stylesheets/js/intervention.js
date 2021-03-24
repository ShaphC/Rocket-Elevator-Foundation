$(document).ready(function() {
  $values = $("#building_id,#battery_id,#column_id,#elevator_id").hide()
  $values2 = $(".building_selection,.battery_selection,.column_selection,.elevator_selection")
  $values3 = $(".battery_selection,.column_selection,.elevator_selection")
  $values4 = $(".column_selection,.elevator_selection")
  $values5 = $(".battery_selection")
  $values6 = $(".column_selection")
  //This is for Buildings
  $(".customer_selection").change(function(){
      $values.hide();
      $values2.empty();
      console.log("test #2")
      var choice = $(this).val();
      console.log(choice)
      if (choice == '') {
        $values.hide();
      } else {
        $("#building_id").show();
      }
      $.ajax({
        url: "/get_buildings",
        method: "GET",
        dataType: "json",
        data: {choice: choice},
        error: function (xhr, status, error) {
          console.log("test #4")
          console.error('AJAX Error: ' + status + error);
        },
        success: function (response) {
          console.log("test #5")
          console.log(response);
          var buildings = response["buildings"];
          $(".building_selection").empty();
          console.log("test #6")
          $(".building_selection").append('<option>Select a Building</option>');
          console.log("test #7")
          for(var i=0; i< buildings.length; i++){
            $(".building_selection").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');
            console.log("test #8")
            //This is for Batteries
            $(".building_selection").change(function(){
              $values3.empty();
              console.log("test #9")
              var choice = $(this).val();
              console.log(choice)
              if (choice == '') {
                $("#battery_id").hide();
              } else {
                $("#battery_id").show();
              }
              $.ajax({
                url: "/get_batteries",
                method: "GET",
                dataType: "json",
                data: {choice: choice},
                error: function (xhr, status, error) {
                  console.log("test #10")
                  console.error('AJAX Error: ' + status + error);
                },
                success: function (response) {
                  console.log("test #11")
                  console.log(response);
                  var batteries = response["batteries"];
                  $(".battery_selection").empty();
                  console.log("test #12")
                  $(".battery_selection").append('<option>Select a Battery</option>');
                  console.log("test #13")
                  for(var i=0; i< batteries.length; i++){
                    $(".battery_selection").append('<option value="' + batteries[i]["id"] + '">' + batteries[i]["id"] + '</option>');
                    console.log("test #14")
                    //This is for Columns
                    $(".battery_selection").change(function(){
                      $values4.empty();
                      console.log("test #2")
                      var choice = $(this).val();
                      console.log(choice)
                      if (choice == '') {
                        $("#column_id").hide();
                      } else {
                        $("#column_id").show();
                      }
                      $.ajax({
                        url: "/get_columns",
                        method: "GET",
                        dataType: "json",
                        data: {choice: choice},
                        error: function (xhr, status, error) {
                          console.log("test #4")
                          console.error('AJAX Error: ' + status + error);
                        },
                        success: function (response) {
                          console.log("test #5")
                          console.log(response);
                          var columns = response["columns"];
                          $(".column_selection").empty();
                          console.log("test #6")
                          $(".column_selection").append('<option>Select a Column</option>');
                          console.log("test #7")
                          for(var i=0; i< columns.length; i++){
                            $(".column_selection").append('<option value="' + columns[i]["id"] + '">' + columns[i]["id"] + '</option>');
                            console.log("test #8")
                            $values5.val("");                                 
                            //This is for elevators
                            $(".column_selection").change(function(){
                              console.log("test #2")
                              var choice = $(this).val();
                              console.log(choice)
                              if (choice == '') {
                                $("#elevator_id").hide();
                              } else {
                                $("#elevator_id").show();
                              }
                              $.ajax({
                                url: "/get_elevators",
                                method: "GET",
                                dataType: "json",
                                data: {choice: choice},
                                error: function (xhr, status, error) {
                                  console.log("test #4")
                                  console.error('AJAX Error: ' + status + error);
                                },
                                success: function (response) {
                                  console.log("test #5")
                                  console.log(response);
                                  var elevators = response["elevators"];
                                  $(".elevator_selection").empty();
                                  console.log("test #6")
                                  $(".elevator_selection").append('<option>Select an Elevator</option>');
                                  console.log("test #7")
                                  for(var i=0; i< elevators.length; i++){
                                    $(".elevator_selection").append('<option value="' + elevators[i]["id"] + '">' + elevators[i]["id"] + '</option>');
                                    console.log("test #8")  
                                    $(".elevator_selection").change(function(){
                                      console.log("column test")
                                      $values6.val("");     
                                    });                            
                                  }
                                }
                              });
                            });
                          }
                        }
                      });
                    });
                  }
                }
              });
            });
          }
        }
      });
    });
  });