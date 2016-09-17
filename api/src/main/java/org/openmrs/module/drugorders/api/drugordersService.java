/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.drugorders.api;

import java.util.List;
import org.openmrs.Concept;
import org.openmrs.Patient;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.drugorders.drugorders;
import org.springframework.transaction.annotation.Transactional;

/**
 * This service exposes module's core functionality. It is a Spring managed bean which is configured in moduleApplicationContext.xml.
 * <p>
 * It can be accessed only via Context:<br>
 * <code>
 * Context.getService(${module-name-no-spaces}Service.class).someMethod();
 * </code>
 * 
 * @see org.openmrs.api.context.Context
 */
@Transactional
public interface drugordersService extends OpenmrsService {

    public int getLastGroupID();
    
    public List<drugorders> getAllDrugOrders();
    
    public drugorders getDrugOrderByID(Integer id);
    
    public void deleteDrugOrder(drugorders drugOrder);
    
    public drugorders getDrugOrderByOrderID(Integer id);
    
    public drugorders saveDrugOrder(drugorders drugOrder);
    
    public List<drugorders> getDrugOrdersByGroupID(Integer id);
    
    public List<drugorders> getDrugOrdersByStatus(String status);
    
    public List<drugorders> getNewTablesByPatient(Patient patient);
    
    public drugorders getDrugOrderByDrugAndPatient(Concept drugname,String patientID);
    
}