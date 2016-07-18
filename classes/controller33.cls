public class controller33 {

 public List<Group> getMemb()
    {
 List<Group> membs =[SELECT DeveloperName FROM Group];
        return membs;
        }
    
}