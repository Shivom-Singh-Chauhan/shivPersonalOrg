public class Amazon_AWS {
    public static void amazonS3(){
        
         Xmlstreamwriter xmlW = new Xmlstreamwriter();
        xmlW.writeStartElement(null,'ADRESS_LINE_1',null);
        xmlW.writeAttribute(null,null,'id','2');
        xmlW.writeCharacters('4 rue de rocher');
        xmlW.writeEndElement();
        
        xmlW.writeStartElement(null,'CITY',null);
        xmlW.writeAttribute(null,null,'id','3');
        xmlW.writeCharacters('Paris');
        xmlW.writeEndElement();
        
        xmlW.writeEndElement();
        xmlW.writeEndElement();
        xmlW.writeEndElement();
        xmlW.writeEndDocument();
        
        String xmlStringxmlRes = xmlW.getXmlString();
        xmlW.close();
        Blob xmlContentBlob = Blob.valueOf(xmlStringxmlRes);
        
        String attachmentBody = EncodingUtil.base64Encode(xmlContentBlob);
        String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        String key = 'AKIA26Y45RCR2WGSEL6J'; 
        String secret = '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'; 
        String bucketname = 'aws-sf-test1';
        String host = 's3.us-east-1.amazonaws.com';
        String method = 'PUT';
        String filename = 'Upload-Test-3.xml';
        String fileType = 'text/xml';
        
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setEndpoint('callout:AWS_S3L' + '/' + filename);
        req.setHeader('Host', bucketname + '.' + host);
        req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
        req.setHeader('Content-Encoding', 'UTF-8');
        req.setHeader('Content-type', fileType);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString);
        req.setHeader('ACL', 'public-read-write');
        req.setBodyAsBlob(EncodingUtil.base64Decode(attachmentBody));
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        System.debug('>>>> The response');
        System.debug(res);
        System.debug('>>>> The body');
        System.debug(res.getBody());
        System.debug('>>>> Status code');
        System.debug(res.getStatusCode());
        System.debug('>>>> Finished method');
        
        
        
      /*  HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:AWS_S3/');
        req.setMethod('GET');
        // req.setBody('"[{\"Name\":\"NewCompanyCo.\",\"Description\":\"Thisisdummycompany\",\"AccountNumber\":\"ABC15797532\"}]"');
        
        req.setHeader('Content-Type','application/xml');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        System.debug(res.getStatusCode());
        System.debug(res.getStatus()); */
    }
    
}