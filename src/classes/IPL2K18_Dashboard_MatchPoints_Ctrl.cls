public class IPL2K18_Dashboard_MatchPoints_Ctrl 
{
    public List<Cricket_Actual_Team__c> listCricketAT{get;set;}
    public List<wrapClass> listWrap{get;set;}
    
    public IPL2K18_Dashboard_MatchPoints_Ctrl()
    {
        listCricketAT = new List<Cricket_Actual_Team__c>();
        listWrap = new List<wrapClass>();
    }
    
    @AuraEnabled
    public static String getDashbaordMatchDetails()
    {
        Map<String,Integer> mapCAT = new Map<String,Integer>();
        List<Cricket_Actual_Team__c> listCricketAT = new List<Cricket_Actual_Team__c>();
        listCricketAT = [SELECT Id,Name,Match_Points__c
                        FROM Cricket_Actual_Team__c];
        
        for(Cricket_Actual_Team__c CAT : listCricketAT)
        {
            system.debug('mapCAT++'+mapCAT);    
            if(mapCAT != NULL)
                mapCAT.put(CAT.Name,Integer.valueOf(CAT.Match_Points__c));
        }
        
        wrapClass wrap = new wrapClass();
        for(String str : mapCAT.keySet())
        {
            wrap.teamNameStr.add(str);
            wrap.teamPointsInt.add(mapCAT.get(str));
        }
        system.debug('wrap++'+wrap+' '+System.json.serialize(wrap));
        return System.json.serialize(wrap);
    }
     
    public class wrapClass
    {
        public List<String> teamNameStr{get;set;}
        public List<Integer> teamPointsInt{get;set;}
        public wrapClass()
        {
            teamNameStr = new List<String>();
            teamPointsInt = new List<Integer>();
        }
    }
}