public class WrapperClass {
    public List<InnerWrapClass> inw{get;set;}

    public WrapperClass() {
        wc = new List<InnerWrapClass>();
        for(Account acw : [SELECT id, name, phone, industry FROM Account LIMIT 10]){
            wc.add(new InnerWrapClass(acw));
        }
    }

    public class InnerWrapClass {
        public Boolean flag {get;set;}
        public Account acc {get; set;}
        public InnerWrapClass(Account ac){
            flag = false;
            acc = ac;
        }      
    }
}
