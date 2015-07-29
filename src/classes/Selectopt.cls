public class Selectopt{
    String[] countries = new String[]{};

    public PageReference test() {
        return null;
    }

    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('CANADA','Canada'));
        options.add(new SelectOption('MEXICO','Mexico'));

        return options;
    }

    public String[] getCountries() {
    system.debug('getter method :'+countries);
        return countries;
    }

    public void setCountries(String[] countries) {
        this.countries = countries;
            system.debug('setter method :'+countries);
    }
}