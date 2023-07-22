public class Amazon_SendAttach{
    public static void sendAttach(){

Attachment attach = [select Body,ContentType,Name from Attachment limit 1];
String attachmentBody = EncodingUtil.base64Encode(attach.Body);
String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
String key = '******************’'; //AWS key
String secret = '*****************'; //AWS Secret key
String bucketname = 'bucketName'; //AWS bucket name
String host = 's3-us-west-1.amazonaws.com';
String method = 'PUT';
String filename = attach.Id + '-' + attach.Name;

HttpRequest req = new HttpRequest();
req.setMethod(method);
req.setEndpoint('https://' + bucketname + '.' + host + '/' + filename);
req.setHeader('Host', bucketname + '.' + host);
req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
req.setHeader('Content-Encoding', 'UTF-8');
req.setHeader('Content-type', attach.ContentType);
req.setHeader('Connection', 'keep-alive');
req.setHeader('Date', formattedDateString);
req.setHeader('ACL', 'public-read-write');
req.setBodyAsBlob(attach.Body);

String stringToSign = 'PUT\n\n' + attach.ContentType + '\n' + formattedDateString + '\n' + '/' + bucketname + '/' + filename;
String encodedStringToSign = EncodingUtil.urlEncode(stringToSign, 'UTF-8');
Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
String signedKey  = EncodingUtil.base64Encode(mac);
String authHeader = 'AWS' + ' ' + key + ':' + signedKey ;

req.setHeader('Authorization',authHeader);

String decoded = EncodingUtil.urlDecode(encodedStringToSign , 'UTF-8');

Http http = new Http();
HTTPResponse res = http.send(req);
    
}
}