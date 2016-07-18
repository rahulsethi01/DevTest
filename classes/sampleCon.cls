public class sampleCon {
        String[] countries = new String[]{};
            
        public PageReference test() {
            return null;
        }
            
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('10','10'));
            options.add(new SelectOption('15','15'));
            options.add(new SelectOption('20','20'));
            return options;
        }
            
        public String[] getCountries() {
            return countries;
        }
            
        public void setCountries(String[] countries) {
            this.countries = countries;
        }
    }