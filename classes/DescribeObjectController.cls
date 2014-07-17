public class DescribeObjectController {

   
       private Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
       public String selectedObject {get; set;}
       public List<String> entities{get; set;}
       public List<SelectOption> objNames{get;set;}
       public String SelectObject{get;set;}
       Public List<fieldvalues> allfieldnames{get;set;}                     
       public String selectdataType{get;set;}             
       public List<SelectOption> datatypes{get;set;}                     
       public  List<Schema.SObjectField> sobject_Field{get;set;}
       public Map<String, Schema.SObjectField> field_map{get;set;}
       public Set<String> Field_Name {get;set;}                    
       
                
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
                
                
             public List<SelectOption> getDatatypes(){
           
                      datatypes = new List<SelectOption>();  
                                                                                
                      datatypes.add(new SelectOption('None','--Select DataType--'));
                      datatypes.add(new SelectOption(Schema.DisplayType.String.Name(),'STRING'));
                      datatypes.add(new SelectOption(Schema.DisplayType.PHONE.Name(),'PHONE'));
                      datatypes.add(new SelectOption(Schema.DisplayType.PICKLIST.Name(),'PICKLIST'));
                      datatypes.add(new SelectOption(Schema.DisplayType.DATE.Name(),'DATE'));
                      datatypes.add(new SelectOption(Schema.DisplayType.TEXTAREA.Name(),'TEXTAREA'));
                      datatypes.add(new SelectOption(Schema.DisplayType.REFERENCE.Name(),'REFERENCE'));
                      datatypes.add(new SelectOption(Schema.DisplayType.BOOLEAN.Name(),'BOOLEAN'));
                      datatypes.add(new SelectOption(Schema.DisplayType.DATETIME.Name(),'DATETIME'));
                      datatypes.add(new SelectOption(Schema.DisplayType.CURRENCY.Name(),'CURRENCY'));
                      datatypes.add(new SelectOption(Schema.DisplayType.URL.Name(),'URL'));
                      datatypes.add(new SelectOption(Schema.DisplayType.MULTIPICKLIST.Name(),'MULTIPICKLIST'));
                      
                         return datatypes;
                
                }
        
        public DescribeObjectController(){
                                     
              getDatatypes();              
              allfieldnames=new List<fieldvalues>();              
              selectdataType=null;
                
                }
                                       
             public void FieldDescribe()
             
                 {
                     try
                        {
                         allfieldnames.clear();                         
                         
                       if(SelectObject!='None')
                       {  
                         field_map=schemaMap.get(SelectObject).getDescribe().fields.getMap();                        
                         Field_Name=field_map.keyset();
                         
                      for(Schema.SObjectField fil:field_map.values())
                        {
                                                                       
                            fieldvalues fvalues=new fieldvalues();                            
                            schema.describefieldresult results=fil.getDescribe();
                                                      
                          if(selectdataType!='None'){
                              
                              
                              if(results.getType().Name()==selectdataType){
                                     fvalues.Ftype=results.getType();
                                     fvalues.Fname=results.getName();
                                     fvalues.Label=results.getLabel();
                                     fvalues.Length=results.getLength();                            
                                     fvalues.Precision=results.getPrecision();
                                     fvalues.Scale=results.getScale();                             
                                     allfieldnames.add(fvalues);                               
                              }
                                                           
                          }else{           
                                                                         
                                     fvalues.Ftype=results.getType();
                                     fvalues.Fname=results.getName();
                                     fvalues.Label=results.getLabel();
                                     fvalues.Length=results.getLength();                            
                                     fvalues.Precision=results.getPrecision();
                                     fvalues.Scale=results.getScale();                             
                                     allfieldnames.add(fvalues);                              
                              }                                                                               
                       }
                       
                      }                       
                     }catch(Exception e){                     
                     }
                                  
                 }
  
                public class fieldvalues{
                                   
                   public String Fname{get;set;}
                   public String Label{get;set;}
                   public Schema.DisplayType FType {get;set;}
                   public Integer Length {get;set;}
                   public Integer Scale {get;set;}
                   public Integer Precision {get;set;}                                         
                
                }                                
}