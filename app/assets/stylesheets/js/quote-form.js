
// Show-Hide //
const residentialInputs = $(
  "#number-of-apartments,#number-of-floors,#number-of-basements"
);
const residentialInvert = $(
  "#number-of-companies,#number-of-parking-spots,#number-of-elevators,#number-of-corporations,#maximum-occupancy,#business-hours"
);
const commercialInputs = $(
  "#number-of-floors,#number-of-basements,#number-of-companies,#number-of-parking-spots,#number-of-elevators"
);
const commercialInvert = $(
  "#number-of-apartments,#number-of-corporations,#maximum-occupancy,#business-hours"
);
const corporateInputs = $(
  "#number-of-floors,#number-of-basements,#number-of-parking-spots,#number-of-corporations,#maximum-occupancy"
);
const corporateInvert = $(
  "#number-of-apartments,#number-of-companies,#business-hours,#number-of-elevators"
);
const hybridInputs = $(
  "#number-of-floors,#number-of-basements,#number-of-companies,#number-of-parking-spots,#maximum-occupancy,#business-hours"
);
const hybridInvert = $("#number-of-corporations");
const resultsFeild = $("#elevator-amount,#elevator-unit-price,#installation-fees,#elevator-total-price,#final-price")

// Show-Hide //

// Shorcut Variables for jQuery
// number-of-apartments,  number-of-floors, number-of-basements,
// number-of-companies, number-of-parking-spots, number-of-elevators,
// number-of-corporation, maximum-occupancy, business-hours

// Input Field
const $apart = $("#number-of-apartments>input");
const $floor = $("#number-of-floors>input");
const $basements = $("#number-of-basements>input");
const $companies = $("#number-of-companies>input");
const $parking = $("#number-of-parking-spots>input");
const $elevators = $("#number-of-elevators>input");
const $corporation = $("#number-of-corporation>input");
const $maximum = $("#maximum-occupancy>input");
const $hours = $("#business-hours>input");

let totalElevator = 0;

// OUTPUT FIELDS
const $elevatorResults = $("#elevator-amount>input");
const $unitPrice = $("#elevator-unit-price>input");
const $installationFees = $("#installation-fees>input");
const $elevatorPrice = $("#elevator-total-price>input");
const $finalPrice = $("#final-price>input");


/////
function find_type() {
     
    if ($('#quote_product_line_standard').prop("checked")) {
        resultsFeild.show();
        $unitPrice.val(currency(7565, {pattern: `# !`}).format());
        t_e_p = totalElevator * 7565
        $elevatorPrice.val(currency(t_e_p, {pattern: `# !`}).format())
        i_f = t_e_p*0.10
        $installationFees.val(currency(i_f, {pattern: `# !`}).format());
        $finalPrice.val(currency(i_f + t_e_p, {pattern: `# !`}).format())

    } else if ($('#quote_product_line_premium').prop("checked")) {
        resultsFeild.show();
        $unitPrice.val(currency(12345, {pattern: `# !`}).format());
        t_e_p = totalElevator * 12345
        $elevatorPrice.val(currency(t_e_p, {pattern: `# !`}).format());
        i_f = t_e_p * 0.13
        $installationFees.val(currency(i_f, {pattern: `# !`}).format())
        $finalPrice.val(currency(i_f + t_e_p, {pattern: `# !`}).format())

    } else if ($('#quote_product_line_excelium').prop("checked")) {
        resultsFeild.show();
        $unitPrice.val(currency(15400, {pattern: `# !`}).format());
        t_e_p = totalElevator * 15400
        $elevatorPrice.val(currency(t_e_p, {pattern: `# !`}).format());
        i_f = t_e_p * 0.16
        $installationFees.val(currency(i_f, {pattern: `# !`}))
        $finalPrice.val(currency(i_f + t_e_p, {pattern: `# !`}).format())
    }
}

///////////////////////// Reset
function resetField() {
    totalElevator = 0;
    $elevatorResults.val('')
}
////////////////////////////////// Residential
function resCalc() {
    residentialInputs.on('keyup', () => {
        let avrgDoor = $apart.val() / $floor.val();
        let nb_shaft = Math.ceil(avrgDoor / 6);
        totalElevator = (Math.ceil($floor.val() / 20) * nb_shaft);

        $elevatorResults.val(totalElevator);

        find_type();
    });
}


///////////////////////////////////////////// Corp/Hybrid
function corpCalc() {
    corporateInputs.on('keyup', () => {
        let base = parseInt($basements.val());
        let floor = parseInt($floor.val());
        let occ = parseInt($maximum.val());

        let totalOccupant = floor * occ;
        totalElevator = Math.ceil(totalOccupant / 1000);
        let column = Math.ceil((floor + base) / 20);
        let elevatorPerColumn = Math.ceil(totalElevator / column);
        totalElevator = elevatorPerColumn * column;

        $elevatorResults.val(totalElevator);
    });
}



// Show/Hide Function
$(() => {
    $('#package').on("click", () => {
        find_type();
    });
//////////////////////////
    // when document ready => do function
    $("#quote_building_type").change(function () {

        resetField();
        resultsFeild .hide();
        $("#standard_input").checked = false;
        $("#premium_input").checked = false;
        $("#excelium_input").checked = false;
     
        type = $('#quote_building_type :selected').val();

        // assigning #building-type value to type
        if (type === "residential") {
            residentialInputs.show(); // .show/.hide jquery method
            residentialInvert.hide();
            resCalc();

        } else if (type === "commercial") {
            commercialInputs.show();
            commercialInvert.hide();
            commercialInputs.on('keyup', () => {

                $elevatorResults.val($elevators.val());
                totalElevator = $elevators.val();
                find_type();
            })

        } else if (type === "corporate") {
            corporateInputs.show();
            corporateInvert.hide();
            corpCalc();
        } else if (type === "hybrid") {
            hybridInputs.show();
            hybridInvert.hide();
            corpCalc();
        }
    });
});

function calculateCorporateHybridEquipment(){
    var totalOccupancy = quote.maximumOccupancy * quote.numberOfFloors;
    var numberOfElevators = Math.ceil(totalOccupancy / 1000);
    var numberOfColumns = Math.ceil((parseInt(quote.numberOfFloors) + parseInt(quote.numberOfBasements)) / 20);
    var numberOfElevatorsPerColumn = Math.ceil(numberOfElevators / numberOfColumns);
    quote.numberOfElevatorsRequired = numberOfElevatorsPerColumn * numberOfColumns;
}