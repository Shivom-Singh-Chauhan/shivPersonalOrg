//Generated by wsdl2apex

public class AsyncTempuriOrg {
    public class DivideResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            tempuriOrg.DivideResponse_element response = (tempuriOrg.DivideResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.DivideResult;
        }
    }
    public class AddResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            tempuriOrg.AddResponse_element response = (tempuriOrg.AddResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.AddResult;
        }
    }
    public class MultiplyResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            tempuriOrg.MultiplyResponse_element response = (tempuriOrg.MultiplyResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.MultiplyResult;
        }
    }
    public class SubtractResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            tempuriOrg.SubtractResponse_element response = (tempuriOrg.SubtractResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.SubtractResult;
        }
    }
    public class AsyncCalculatorSoap {
        public String endpoint_x = 'http://dneonline.com/calculator.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://tempuri.org/', 'tempuriOrg'};
        public AsyncTempuriOrg.DivideResponse_elementFuture beginDivide(System.Continuation continuation,Integer intA,Integer intB) {
            tempuriOrg.Divide_element request_x = new tempuriOrg.Divide_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncTempuriOrg.DivideResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncTempuriOrg.DivideResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Divide',
              'http://tempuri.org/',
              'Divide',
              'http://tempuri.org/',
              'DivideResponse',
              'tempuriOrg.DivideResponse_element'}
            );
        }
        public AsyncTempuriOrg.AddResponse_elementFuture beginAdd(System.Continuation continuation,Integer intA,Integer intB) {
            tempuriOrg.Add_element request_x = new tempuriOrg.Add_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncTempuriOrg.AddResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncTempuriOrg.AddResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Add',
              'http://tempuri.org/',
              'Add',
              'http://tempuri.org/',
              'AddResponse',
              'tempuriOrg.AddResponse_element'}
            );
        }
        public AsyncTempuriOrg.MultiplyResponse_elementFuture beginMultiply(System.Continuation continuation,Integer intA,Integer intB) {
            tempuriOrg.Multiply_element request_x = new tempuriOrg.Multiply_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncTempuriOrg.MultiplyResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncTempuriOrg.MultiplyResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Multiply',
              'http://tempuri.org/',
              'Multiply',
              'http://tempuri.org/',
              'MultiplyResponse',
              'tempuriOrg.MultiplyResponse_element'}
            );
        }
        public AsyncTempuriOrg.SubtractResponse_elementFuture beginSubtract(System.Continuation continuation,Integer intA,Integer intB) {
            tempuriOrg.Subtract_element request_x = new tempuriOrg.Subtract_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncTempuriOrg.SubtractResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncTempuriOrg.SubtractResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Subtract',
              'http://tempuri.org/',
              'Subtract',
              'http://tempuri.org/',
              'SubtractResponse',
              'tempuriOrg.SubtractResponse_element'}
            );
        }
    }
}