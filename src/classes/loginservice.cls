//Generated by wsdl2apex

public class loginservice {
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class DebuggingHeader_element {
        public loginservice.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/logindemo',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class checkloginResponse_element {
        public String result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class checklogin_element {
        public String uname;
        public String pwd;
        private String[] uname_type_info = new String[]{'uname','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','true'};
        private String[] pwd_type_info = new String[]{'pwd','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'uname','pwd'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/logindemo',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class logindemo {
        public String endpoint_x = 'https://cs17.salesforce.com/services/Soap/class/logindemo';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public loginservice.CallOptions_element CallOptions;
        public loginservice.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public loginservice.DebuggingHeader_element DebuggingHeader;
        public loginservice.DebuggingInfo_element DebuggingInfo;
        public loginservice.SessionHeader_element SessionHeader;
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/logindemo';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/logindemo';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/logindemo';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/logindemo';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/logindemo';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/logindemo', 'loginservice'};
        public String checklogin(String uname,String pwd) {
            loginservice.checklogin_element request_x = new loginservice.checklogin_element();
            request_x.uname = uname;
            request_x.pwd = pwd;
            loginservice.checkloginResponse_element response_x;
            Map<String, loginservice.checkloginResponse_element> response_map_x = new Map<String, loginservice.checkloginResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/logindemo',
              'checklogin',
              'http://soap.sforce.com/schemas/class/logindemo',
              'checkloginResponse',
              'loginservice.checkloginResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}