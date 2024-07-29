public class GetQuoteData {
    public List<QuoteLineItemWrapper> quoteLineItems { get; set; }
    public String paramName { get; set; } 
     public String currentDate { get; set; }
    public string name { get; set;}
    public GetQuoteData() {
		paramName = ApexPages.currentPage().getParameters().get('paramName');
         currentDate = Date.today().format();
string name;        
        system.debug('paramValue :::' +  paramName);
        quoteLineItems = new List<QuoteLineItemWrapper>();
        Integer counter = 1;
        for (QuoteLineItem qli : [SELECT Id, Product2.Name, Description,Product2.ProductCode,Quote.Account.Name, Quantity, Subtotal FROM QuoteLineItem WHERE QuoteId =:paramName]) {
            quoteLineItems.add(new QuoteLineItemWrapper(counter, qli));
           this.name=qli.Quote.Account.Name;
            counter++;
        }
    }
    
    public class QuoteLineItemWrapper {
        public Integer serialNumber { get; set; }
        public QuoteLineItem qli { get; set; }
        
        public QuoteLineItemWrapper(Integer sn, QuoteLineItem item) {
            serialNumber = sn;
            qli = item;
        }
    }
}