/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders;

import org.openmrs.Concept;
import java.io.Serializable;
import org.openmrs.BaseOpenmrsObject;

/**
 *
 * @author harini-geek
 */
public class drugordersdiseases extends BaseOpenmrsObject implements Serializable{
    
    private Integer id;
    private Integer planid;
    private Integer orderid;
    private Concept diseaseid;
    private String patientid;
    
    public drugordersdiseases(){
        
    }
    
    @Override
    public Integer getId() {
            return id;
    }

    @Override
    public void setId(Integer id) {
            this.id = id;
    }
    
    public Integer getPlanid() {
        return planid;
    }

    public void setPlanid(Integer planid) {
        this.planid = planid;
    }
    
    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }
    
    public Concept getDiseaseid() {
            return diseaseid;
    }

    public void setDiseaseid(Concept diseaseid) {
            this.diseaseid = diseaseid;
    }
    
    public String getPatientid() {
            return patientid;
    }

    public void setPatientid(String patientid) {
            this.patientid = patientid;
    }
}
