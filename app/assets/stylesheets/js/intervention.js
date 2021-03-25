$(document).ready(function() {
  /*User cannot submit without picking a Customer, Building, Employee 
  and atleast a Battery, Column or Elevator*/
  $("#intervention-form").submit(function(event) {
    //Sets the required field to a variable
    var a = $(".customer_selection").val();
    var b = $(".building_selection").val();
    var c = $(".battery_selection").val();
    var d = $(".column_selection").val();
    var e = $(".elevator_selection").val();
    var f = $(".employee_selection").val();
    //Sends an alert if the specified field's value is empty
    if(a == "") 
    {
      event.preventDefault();
      alert("Select a Customer");
    } 
    else if (b == "") 
    {
      event.preventDefault();
      alert("Select a Building");
    }
    else if (c == "" && d != "" && e != "")
    {
      event.preventDefault();
      alert("Select a Battery");
    }
    else if (f == "")
    {
      event.preventDefault();
      alert("Select an Employee");
    }

  });
  //Hides the other fields on startup
  $fields = $("#building_id,#battery_id,#column_id,#elevator_id").hide();
  //Holds all the data for fields that need to change based on if a previous field changes
  $values = $(".building_selection,.battery_selection,.column_selection,.elevator_selection")
  $values2 = $(".battery_selection,.column_selection,.elevator_selection")
  $fields2 = $("#battery_id,#column_id,#elevator_id");
  $values3 = $(".battery_selection")
  //This holds the column value
  $values4 = $(".column_selection")
  //This holds the column and the elevator values
  $values5 = $(".column_selection,.elevator_selection")
  //This holds the column and elevator fields
  $fields5 = $("#column_id,#elevator_id");


  //This can get Buildings
  $(".customer_selection").change(function(){
      
    // $fields.hide();
      
    //Erases all the field choices if the customer is changed after other fields appear
    $values.empty();
    //Hides the other fields if the customer field changes
    $fields2.hide();
    // Takes the value of the selected field and saves it in variable choice
    var choice = $(this).val();
    // If the value of choice is empty hide all other fields
    if (choice == '') {
      $fields.hide();
    } else {
      //shows the building field
      $("#building_id").show();
    }
    $.ajax({
      url: "/get_buildings",
      method: "GET",
      dataType: "json",
      //Sends the info to Controller
      data: {choice: choice},
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
        //Recieves the data from the controller and saves it to the variable buildings
        var buildings = response["buildings"];
        //Empties the Building field
        $(".building_selection").empty();
        //Adds the select option into the field
        $(".building_selection").append('<option value="">None</option>');
        // Takes each value returned and adds them into the field
        for(var i=0; i< buildings.length; i++){
          $(".building_selection").append('<option value="' + buildings[i]["id"] + '">' + buildings[i]["id"] + '</option>');


          //This can get Batteries
          $(".building_selection").change(function(){
            //If this field changes it removes the battery, column and elevator values, if they were chosen
            $values2.empty();
            // This hides the battery, column, and elevator fields if they were shown
            $fields2.hide();
            var choice = $(this).val();
            // console.log(choice)
            if (choice == '') {
              $fields2.hide();
            } else {
              $("#battery_id").show();
            }
            $.ajax({
              url: "/get_batteries",
              method: "GET",
              dataType: "json",
              data: {choice: choice},
              error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
              },
              success: function (response) {
                console.log(response);
                var batteries = response["batteries"];
                $(".battery_selection").empty();
                $(".battery_selection").append('<option value="">None</option>');
                for(var i=0; i< batteries.length; i++){
                  $(".battery_selection").append('<option value="' + batteries[i]["id"] + '">' + batteries[i]["id"] + '</option>');


                  //This can get Columns          
                  $(".battery_selection").change(function(){
                    //When the field changes, it empties the values of the column and the elevator
                    $values5.empty();
                    var choice = $(this).val();
                    //This hides the elevator field if it was shown
                    $("#elevator_id").hide();
                    if (choice == '') {
                      //Hides the fields for the columns and the elevators
                      $fields5.hide();
                    } else {
                      $("#column_id").show();
                    }
                    $.ajax({
                      url: "/get_columns",
                      method: "GET",
                      dataType: "json",
                      data: {choice: choice},
                      error: function (xhr, status, error) {
                        console.error('AJAX Error: ' + status + error);
                      },
                      success: function (response) {
                        console.log(response);
                        var columns = response["columns"];
                        $(".column_selection").empty();
                        $(".column_selection").append('<option value="">None</option>');
                        for(var i=0; i< columns.length; i++){
                          $(".column_selection").append('<option value="' + columns[i]["id"] + '">' + columns[i]["id"] + '</option>');


                          //This can get elevators
                          $(".column_selection").change(function(){
                            $values3.val("");                                 
                            var choice = $(this).val();
                            console.log(choice)
                            if (choice == '') {
                              //This can stay as elevator_id because it's the only one that needs to be hidden
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
                                console.error('AJAX Error: ' + status + error);
                              },
                              success: function (response) {
                                console.log(response);
                                var elevators = response["elevators"];
                                $(".elevator_selection").empty();
                                $(".elevator_selection").append('<option value="">None</option>');
                                for(var i=0; i< elevators.length; i++){
                                  $(".elevator_selection").append('<option value="' + elevators[i]["id"] + '">' + elevators[i]["id"] + '</option>');
                                  $(".elevator_selection").change(function(){
                                    //When an elevator is selected it clears the columns
                                    $values4.val("");     
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

