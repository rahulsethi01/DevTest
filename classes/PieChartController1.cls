public class PieChartController1 {
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        integer i=0;
        for(Opportunity opp:[select id,name,stagename,amount from Opportunity limit 5]){
            data.add(new PieWedgeData(opp.name,i++));      
       }
        return data;
    }

    // Wrapper class
   
    public class PieWedgeData {

        public String name { get; set; }
        public integer data { get; set; }

        public PieWedgeData(String name, integer data) {
            this.name = name;
            this.data = data;
        }
    }
}