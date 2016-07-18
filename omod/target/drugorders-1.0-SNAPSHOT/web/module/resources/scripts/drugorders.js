/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready( function() {
    jq("#singleOrderWindow").hide();
    jq("#medicationPlanWindow").hide();
    jq("#showDrugOrderView").hide();
    jq("#editOrderWindow").hide();
    jq("#renewOrderWindow").hide();
    jq("#nonActiveOrdersLinkHide").hide();
    jq("#nonActiveOrdersWindow").hide();
    jq("#showDiscontinueOrderView").hide();
});

function showIndividualDrugOrderWindow(){
    jq("#medicationPlanWindow").hide();
    jq("#singleOrderWindow").show();
}

function hideIndividualDrugOrderWindow(){
    jq("#singleOrderWindow").hide();
}

function showMedicationPlanOrderWindow(){
    jq("#singleOrderWindow").hide();
    jq("#medicationPlanWindow").show();
}

function hideMedicationPlanOrderWindow(){
    jq("#medicationPlanWindow").hide();
}

function showAllergicDrugOrderDetailsWindow(){
    jq("#allergicOrderWindow").hide();
}

function hideAllergicDrugOrderWindow(){
    jq("#allergicOrderWindow").hide();
    jq("#singleOrderWindow").show();
}

function showIndividualOrderDetailsWindow(){
    jq("#singleOrderWindow").hide();
    jq("#allergicOrderWindow").hide();
}

function hideIndividualOrderDetailsWindow(){
    jq("#singleOrderDetailsWindow").hide();
    $("#drugNameEntered").val("");
}

function showDrugOrderViewWindow(givenName,lastName,startdate,drugname,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,patientinstructions,pharmacistinstructions){
    jq("#showDiscontinueOrderView").hide();
    $("#patient_name").text(givenName+" "+lastName);
    $("#start_date").text(startdate);
    $("#order_details").text(drugname +" "+dose+" "+doseUnits+" "+route+" "+duration+" "+durationUnits+" "+quantity+" "+quantityUnits+" "+frequency);
    $("#patient_instructions").text(patientinstructions);
    $("#pharmacist_instructions").text(pharmacistinstructions);
    jq("#showDrugOrderView").show();
}

function hideDrugOrderViewWindow(){
    jq("#showDrugOrderView").hide();
}

function showEditIndividualDrugOrderWindow(orderId,drugName,startDate,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,patientinstructions,pharmacistinstructions){
    jq("#editOrderWindow").show();
    $("#edit_order_id").val(orderId);
    $("#drug_name").text(drugName);
    $("#SelectedOrderDate").text(startDate);
    $("#SelectedDrugRoute").text(route);
    $("#editDrugDose").val(dose);
    $("#SelectedDrugDoseUnits").text(doseUnits);
    $("#editDrugQuantity").val(quantity);
    $("#SelectedDrugQuantityUnits").text(quantityUnits);
    $("#editDrugDuration").val(duration);
    $("#SelectedDrugDurationUnits").text(durationUnits);
    $("#SelectedDrugFrequency").text(frequency);
    $("#editPatientInstructions").val(patientinstructions);
    $("#editPharmacistInstructions").val(pharmacistinstructions);
}

function showRenewIndividualDrugOrderWindow(orderId,drugName,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,associateddiagnosis,patientinstructions,pharmacistinstructions){
    jq("#renewOrderWindow").show();
    $("#renew_order_id").val(orderId);
    $("#renew_drug_name").text(drugName);
    $("#renew_DrugRoute").text(route);
    $("#renewDrugDose").val(dose);
    $("#renew_DrugDoseUnits").text(doseUnits);
    $("#renewDrugQuantity").val(quantity);
    $("#renew_DrugQuantityUnits").text(quantityUnits);
    $("#renewDrugDuration").val(duration);
    $("#renew_DrugDurationUnits").text(durationUnits);
    $("#renew_DrugFrequency").text(frequency);
    $("#renewDiagnosis").val(associateddiagnosis);
    $("#renewPatientInstructions").val(patientinstructions);
    $("#renewPharmacistInstructions").val(pharmacistinstructions);
}

function hideEditOrderWindow(){
    jq("#editOrderWindow").hide();
}

function hideRenewOrderWindow(){
    jq("#renewOrderWindow").hide();
}

function showDiscontinueIndividualDrugOrderWindow(orderid,givenName,lastName,startdate,drugname,dose,doseUnits,route,duration,durationUnits,quantity,quantityUnits,frequency,patientinstructions,pharmacistinstructions){
    $("#dis_order_id").val(orderid);
    $("#patient_name").text(givenName+" "+lastName);
    $("#start_date").text(startdate);
    $("#order_details").text(drugname +" "+dose+" "+doseUnits+" "+route+" "+duration+" "+durationUnits+" "+quantity+" "+quantityUnits+" "+frequency);
    $("#patient_instructions").text(patientinstructions);
    $("#pharmacist_instructions").text(pharmacistinstructions);
    jq("#showDiscontinueOrderView").show();
    jq("#showDrugOrderView").show();
}

function showDiscontinuedFulfilledOrders(){
    jq("#nonActiveOrdersWindow").show();
    jq("#nonActiveOrdersLinkView").hide();
    jq("#nonActiveOrdersLinkHide").show();
}
   
function hideDiscontinuedFulfilledOrders(){
    jq("#nonActiveOrdersWindow").hide();
    jq("#nonActiveOrdersLinkHide").hide();
    jq("#nonActiveOrdersLinkView").show();
}
    