public class OutlookIntegration {

    public string authtoken{get;set;} 

    public string refereshtoken{get;set;}

    public string bodyprint{get;set;}

    public string Subject{get;set;}

    public list<JsonParser> ToRecipients{get;set;}

    public JsonParser Sender{get;set;}

    public static final string CLIENT_SECRET='aad6408d-88cb-4206-a4c1-22b5aaf8ca91';

    public static final string CLIENT_ID='60cca0db-8a11-4bd4-8580-1643b6e19cdf';

    public static final string REDIRECT_URL='https://cloudanalogy-3b9-dev-ed--c.vf.force.com/apex/fghj?core.apexpages.request.devconsole=1';

    public static final string OAUTH_TOKEN_URL='https://login.microsoftonline.com/common/oauth2/v2.0/token';

    public static final string OAUTH_CODE_END_POINT_URL='https://login.microsoftonline.com/common/oauth2/v2.0/authorize';

    public static final string GRANT_TYPE='grant_type=authorization_code';

    public static final string SCOPE='https://outlook.office.com/mail.read';

    public static final string STATE='/profile';

    //Approval Prompt Constant

    //public static final string APPROVAL_PROMPT='force';    

    public pagereference connect(){        

        String x=OAUTH_CODE_END_POINT_URL+'?scope='+EncodingUtil.urlEncode(SCOPE,'UTF-8')+'&state='+EncodingUtil.urlEncode(STATE,'UTF-8')+'&redirect_uri='+EncodingUtil.urlEncode(REDIRECT_URL,'UTF-8')+'&response_type=code&client_id='+CLIENT_ID;

        system.debug('———-?>>>'+x);

        pagereference p=new pagereference(x);

        system.debug('pagereference:::'+ p);

        return p;        

    }                         

    public pagereference showtoken(){

        string codeparam=apexpages.currentpage().getparameters().get('code');

        Http h = new Http();

        String body='code='+codeparam+'&client_id='+CLIENT_ID+'&client_secret='+CLIENT_SECRET+'&redirect_uri='+REDIRECT_URL+'&'+GRANT_TYPE;

        HttpRequest req = new HttpRequest();

        req.setEndpoint(OAUTH_TOKEN_URL);

        req.setHeader('Content-Type','application/x-www-form-urlencoded');

        req.setMethod('POST');

        req.setBody(body); 

        system.debug('REQUEST BODY'+body);

        HttpResponse res = h.send(req);

        system.debug('body'+res.getbody());

        getAccessToken getAccessTokenFromGmailApi = (getAccessToken)JSON.deserialize(res.getBody(), getAccessToken.class);

        system.debug('getAccessTokenFromGmailApi'+getAccessTokenFromGmailApi.access_token);

        authtoken = getAccessTokenFromGmailApi.access_token;

        system.debug('authtoken:::'+authtoken);

        bodyprint=res.getbody();

        return null;        

    } 

    public pagereference getInfo(){ 

        System.debug('authtoken>>'+authtoken);

        Http http = new Http();  

        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://outlook.office.com/api/v2.0/me/messages');

        request.setMethod('GET'); 

        request.setHeader('Authorization', 'Bearer '+authtoken);

        request.setHeader('Accept','application/json');  

        request.setHeader('Prefer', 'outlook.allow-unsafe-html');

        system.debug('req—–>>>>'+request);

        HttpResponse response = http.send(request);

        system.debug('*****response*******'+response.getBody());

        JsonParser getName = (JsonParser)JSON.deserialize(response.getBody(),JsonParser.class);

        system.debug('getName:::::'+getName);

       // List<JsonParser.value> getValue = new List<JsonParser.value>();

       // getValue = getName.value;

       // Subject=getValue[0].Subject;

       // ToRecipients=getValue[0].ToRecipients;

       // Sender=getValue[0].Sender;

        system.debug('getTo::::::::::'+ToRecipients);

        system.debug('get:::::'+Subject);

        system.debug('getEmail:::'+Sender);

        //system.debug('getEmail:::'+getValue[0].Body);

        System.debug(response);

        if (response.getStatusCode() != 201) {

            System.debug('The status code returned was not expected: ' +

                         response.getStatusCode() + ' '  + response.getStatus());   

        } else { 

            System.debug(response.getBody());

        }   

        return null; 

    }  

    public class getAccessToken {

        public String access_token {get; set;}

        public String token_type {get; set;}

        public String expires_in {get; set;}

        public String scope {get; set;}

    }

}