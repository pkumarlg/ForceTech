public class Picklist2radiobuttoncontroller {


    private Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public List<SelectOption> objNames{get;set;}
    public List<String> entities{get; set;}
    public String selectedObject {get; set;}
    public List<SelectOption> picklistfileds{get;set;}
    public String selectedfield {get; set;}
    Map<String, Schema.SObjectField> field_map=new Map<String, Schema.SObjectField>();
    public string singleselectvalue{get;set;}
    public List<SelectOption> picklistvalues{get;set;}
    public String datatype{get;set;}
    public List<SelectOption> multipicklistvalues{get;set;}
    public List<String> multiselectvalues{get;set;}
    
    public Picklist2radiobuttoncontroller(){
        picklistfileds=new List<SelectOption>();
        picklistfileds.add(new SelectOption('None','--Select Picklist Filed--'));
        picklistvalues=new List<SelectOption>();
        multipicklistvalues=new List<SelectOption>();
        multiselectvalues=new List<String>();
    }
    public List<SelectOption> getObjectNames(){
           
              objNames = new List<SelectOption>();
              entities = new List<String>(schemaMap.keySet());
              entities.sort();
              objNames.add(new SelectOption('None','--Select Object--'));
             for(String name :entities)              
                   {
                       objNames.add(new SelectOption(name,name));
                   }                
                        return objNames;                
                }
       
          Public void AllPicklistfileds(){             
          field_map=schemaMap.get(selectedobject).getDescribe().fields.getMap();
          
          for(Schema.SObjectField fieldinfo: field_map.values()){                       
              if(fieldinfo.getDescribe().getType().Name()==Schema.DisplayType.PICKLIST.Name()||fieldinfo.getDescribe().getType().Name()==Schema.DisplayType.MULTIPICKLIST.Name()){                  
                  picklistfileds.add(new SelectOption(fieldinfo.getDescribe().getName(),fieldinfo.getDescribe().getLabel()));
              }          
          }              
        } 
        
        Public void describepicklistfield(){
        
            for(Schema.PicklistEntry picklistval: field_map.get(selectedfield).getDescribe().getPicklistValues()){
                datatype=field_map.get(selectedfield).getDescribe().getType().Name();
                
                if(field_map.get(selectedfield).getDescribe().getType().Name()==Schema.DisplayType.PICKLIST.Name()){
                    picklistvalues.add(new SelectOption(picklistval.getValue(),picklistval.getLabel()));
                }
                if(field_map.get(selectedfield).getDescribe().getType().Name()==Schema.DisplayType.MULTIPICKLIST.Name()){               
                    multipicklistvalues.add(new SelectOption(picklistval.getValue(),picklistval.getLabel()));
                }
                
            }
            
        }
                
}