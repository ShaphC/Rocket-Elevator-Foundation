$(document).ready(function() {
  // $values = $("#building_id,#battery_id,#column_id,#elevator_id").hide()
  //This is for Buildings
  $(".customer_selection").change(function(){
      console.log("test #2")
      var choice = $(this).val();
      console.log(choice)
      // if (choice == '') {
      //   $values.hide();
      // } else {
      //   $("#building_id").show();
      // }
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
          $(".building_selection").append('<option>Select Building</option>');
          console.log("test #7")
          for(var i=0; i< buildings.length; i++){
            $("#building_selection").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');
            console.log("test #8")
            //This is for Batteries
            $(".building_selection").change(function(){
              console.log("test #9")
              var choice2 = $(this).val();
              console.log(choice2)
              // if (choice == '') {
              //   $values.hide();
              // } else {
              //   $("#building_id").show();
              // }
              $.ajax({
                url: "/get_batteries",
                method: "GET",
                dataType: "json",
                data: {choice2: choice2},
                error: function (xhr, status, error) {
                  console.log("test #10")
                  console.error('AJAX Error: ' + status + error);
                },
                success: function (response) {
                  console.log("test #11")
                  console.log(response);
                  var buildings = response["buildings"];
                  $(".battery_selection").empty();
                  console.log("test #12")
                  $(".battery_selection").append('<option>Select Building</option>');
                  console.log("test #13")
                  for(var i=0; i< buildings.length; i++){
                    $(".battery_selection").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');
                    console.log("test #14")
                    //This is for Columns
                    $(".battery_selection").change(function(){
                      console.log("test #2")
                      var choice = $(this).val();
                      console.log(choice)
                      // if (choice == '') {
                      //   $values.hide();
                      // } else {
                      //   $("#building_id").show();
                      // }
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
                          var buildings = response["buildings"];
                          $(".column_selection").empty();
                          console.log("test #6")
                          $(".column_selection").append('<option>Select Building</option>');
                          console.log("test #7")
                          for(var i=0; i< buildings.length; i++){
                            $(".column_selection").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');
                            console.log("test #8")
                            //This is for elevators
                            $(".column_selection").change(function(){
                              console.log("test #2")
                              var choice = $(this).val();
                              console.log(choice)
                              // if (choice == '') {
                              //   $values.hide();
                              // } else {
                              //   $("#building_id").show();
                              // }
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
                                  var buildings = response["buildings"];
                                  $(".elevator_selection").empty();
                                  console.log("test #6")
                                  $(".elevator_selection").append('<option>Select Building</option>');
                                  console.log("test #7")
                                  for(var i=0; i< buildings.length; i++){
                                    $(".elevator_selection").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');
                                    console.log("test #8")                                   
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