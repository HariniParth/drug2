<%
    ui.includeCss("drugorders", "drugorders.css")
    ui.includeJavascript("drugorders", "dataTables.js")
    def default_prio = "";
%>

<div id="currentMedPlansTableWrapper">
    <table id="currentMedPlansTable">
        <thead>
            <tr>
                <th>Plan Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if(ActivePlanMain.size() == 0) { %>
                <tr><td colspan="3" align="center">No Orders Found</td></tr>
            <% } %>

            <% ActivePlanMain.each { drugOrderMain -> %>
                <tr>
                    <td class="fields">
                        <div><strong>${ drugOrderMain.key.getDisplayString().toUpperCase() }</strong></div><br/>

                        <div class="orderDetails">
                            <% drugOrderMain.value.each { drugOrderMn -> %>

                                <% if(ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).priority != null) { %>
                                    <% default_prio = ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).priority.getDisplayString(); %>
                                <% } %>

                                <div class="detailsLink <% if(ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).discontinued == 1) { %> discontinued <% } %> <% if(ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).onHold == 1) { %> onhold <% } %>" title="${ ui.message(ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).comments) }">

                                    <div class="fields" id="order_value" onclick="showDrugOrderViewWindow('VIEW ORDER','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).startdate.format('yyyy-MM-dd') }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).drugname.getDisplayString() }','${ drugOrderMn.value.dose }','${ drugOrderMn.value.doseUnits.getDisplayString() }','${ drugOrderMn.value.route.getDisplayString() }','${ drugOrderMn.value.duration }','${ drugOrderMn.value.durationUnits.getDisplayString() }','${ drugOrderMn.value.quantity }','${ drugOrderMn.value.quantityUnits.getDisplayString() }','${ drugOrderMn.value.frequency }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).refill }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).isallergicorderreasons }','${ default_prio }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).patientinstructions }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).pharmacistinstructions }')">   
                                        <div>${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).drugname.getDisplayString().toUpperCase() } <span class="itemSummary">Start Date: ${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).startdate.format('yyyy-MM-dd') }</span></div>
                                        <div><span class="itemSummary">${ drugOrderMn.value.dose } ${ drugOrderMn.value.doseUnits.getDisplayString() }, ${ drugOrderMn.value.duration } ${ drugOrderMn.value.durationUnits.getDisplayString() }</span></div>
                                    </div>

                                    <div id="button" class="pull-right">
                                        <i class="icon-edit edit-action" title="${ ui.message("Edit") }" onclick="showEditIndividualDrugOrderWindow('EDIT DRUG ORDER','PLAN','${ drugOrderMn.value.orderId }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).drugname.getDisplayString() }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).startdate }','${ drugOrderMn.value.dose }','${ drugOrderMn.value.doseUnits.getDisplayString() }','${ drugOrderMn.value.route.getDisplayString() }','${ drugOrderMn.value.duration }','${ drugOrderMn.value.durationUnits.getDisplayString() }','${ drugOrderMn.value.quantity }','${ drugOrderMn.value.quantityUnits.getDisplayString() }','${ drugOrderMn.value.frequency }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).refill }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).refillinterval }','${drugOrderMain.key.getDisplayString()}','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).isallergicorderreasons }','${ default_prio }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).patientinstructions }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).pharmacistinstructions }')"></i>
                                        <i class="icon-trash delete-action" title="${ ui.message("Delete") }" onclick="showDiscontinueIndividualDrugOrderWindow('DISCONTINUE ORDER','${ drugOrderMn.value.orderId }','${ ui.format(patient.givenName) }','${ ui.format(patient.familyName) }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).startdate.format('yyyy-MM-dd') }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).drugname.getDisplayString() }','${ drugOrderMn.value.dose }','${ drugOrderMn.value.doseUnits.getDisplayString() }','${ drugOrderMn.value.route.getDisplayString() }','${ drugOrderMn.value.duration }','${ drugOrderMn.value.durationUnits.getDisplayString() }','${ drugOrderMn.value.quantity }','${ drugOrderMn.value.quantityUnits.getDisplayString() }','${ drugOrderMn.value.frequency }','${ default_prio }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).patientinstructions }','${ ActivePlanExtension.get(drugOrderMain.key).get(drugOrderMn.key).pharmacistinstructions }')"></i>
                                    </div><br/>
                                </div>
                                
                            <% } %>
                        </div>
                    </td>
                    
                    <td class="planDiscardButton">
                        <span id="button">
                            <i class="icon-trash delete-action" title="${ ui.message("Discard") }" onclick="discardMedPlanOrder('DISCONTINUE PLAN','${drugOrderMain.key.getDisplayString()}')"></i>
                        </span>
                    </td>
                </tr>
            <% } %>

        </tbody>
    </table>
</div>

<script>
    jq('#currentMedPlansTable').dataTable({
        "sPaginationType": "full_numbers",
        "bPaginate": true,
        "bAutoWidth": false,
        "bLengthChange": true,
        "bSort": true,
        "bJQueryUI": true,
        "bInfo": false,
        "bFilter": false

    });
</script>

<script type="text/javascript">    
    jq(".detailsLink").click(function(){
        jq(this).children('div > *').slice(0, 1).css({"background": "#75b2f0","color": "white"});
    });
</script>

<script type="text/javascript">    
    jq(".planDiscardButton > span > i").hover(function(event){
        if(event.type == 'mouseenter'){
            jq(this).parent().parent().parent().children('td').slice(0, 1).children(".orderDetails").children(".detailsLink").css({"background": "#75b2f0","color": "white"});
        } else {
            jq(this).parent().parent().parent().children('td').slice(0, 1).children(".orderDetails").children(".detailsLink").css({"background": "","color": ""});
        }
    });
</script>