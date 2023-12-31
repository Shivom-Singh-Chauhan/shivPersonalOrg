//Generated by wsdl2apex

public class AsyncCalculatorExternalService {
    public class DivideResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            CalculatorExternalService.DivideResponse_element response = (CalculatorExternalService.DivideResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.DivideResult;
        }
    }
    public class AddResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            CalculatorExternalService.AddResponse_element response = (CalculatorExternalService.AddResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.AddResult;
        }
    }
    public class MultiplyResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            CalculatorExternalService.MultiplyResponse_element response = (CalculatorExternalService.MultiplyResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.MultiplyResult;
        }
    }
    public class SubtractResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            CalculatorExternalService.SubtractResponse_element response = (CalculatorExternalService.SubtractResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.SubtractResult;
        }
    }
    public class AsyncCalculatorSoap {
        public String endpoint_x = 'http://dneonline.com/calculator.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://tempuri.org/', 'CalculatorExternalService'};
        public AsyncCalculatorExternalService.DivideResponse_elementFuture beginDivide(System.Continuation continuation,Integer intA,Integer intB) {
            CalculatorExternalService.Divide_element request_x = new CalculatorExternalService.Divide_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncCalculatorExternalService.DivideResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorExternalService.DivideResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Divide',
              'http://tempuri.org/',
              'Divide',
              'http://tempuri.org/',
              'DivideResponse',
              'CalculatorExternalService.DivideResponse_element'}
            );
        }
        public AsyncCalculatorExternalService.AddResponse_elementFuture beginAdd(System.Continuation continuation,Integer intA,Integer intB) {
            CalculatorExternalService.Add_element request_x = new CalculatorExternalService.Add_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncCalculatorExternalService.AddResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorExternalService.AddResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Add',
              'http://tempuri.org/',
              'Add',
              'http://tempuri.org/',
              'AddResponse',
              'CalculatorExternalService.AddResponse_element'}
            );
        }
        public AsyncCalculatorExternalService.MultiplyResponse_elementFuture beginMultiply(System.Continuation continuation,Integer intA,Integer intB) {
            CalculatorExternalService.Multiply_element request_x = new CalculatorExternalService.Multiply_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncCalculatorExternalService.MultiplyResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorExternalService.MultiplyResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Multiply',
              'http://tempuri.org/',
              'Multiply',
              'http://tempuri.org/',
              'MultiplyResponse',
              'CalculatorExternalService.MultiplyResponse_element'}
            );
        }
        public AsyncCalculatorExternalService.SubtractResponse_elementFuture beginSubtract(System.Continuation continuation,Integer intA,Integer intB) {
            CalculatorExternalService.Subtract_element request_x = new CalculatorExternalService.Subtract_element();
            request_x.intA = intA;
            request_x.intB = intB;
            return (AsyncCalculatorExternalService.SubtractResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorExternalService.SubtractResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://tempuri.org/Subtract',
              'http://tempuri.org/',
              'Subtract',
              'http://tempuri.org/',
              'SubtractResponse',
              'CalculatorExternalService.SubtractResponse_element'}
            );
        }
    }
}