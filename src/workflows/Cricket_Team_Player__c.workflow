<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>On_update_to_Total_Point_update_Crick</fullName>
        <description>On update to &quot;Total Point&quot;, update Crick</description>
        <field>Total_Points_Recalculated__c</field>
        <formula>Total_Points__c</formula>
        <name>On update to &quot;Total Point&quot;, update Crick</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>On update to %22Total Point%22%2C update Cricket Team%2E</fullName>
        <actions>
            <name>On_update_to_Total_Point_update_Crick</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cricket_Team_Player__c.In_Playing_XI__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>On update to &quot;Total Point&quot;, update Cricket Team : &apos;Total Points&apos;.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
