<%--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
--%>
<%@ page import="org.wso2.carbon.validate.domain.ui.clients.ValidateDomainClient" %>
<%@ page import="org.wso2.carbon.validate.domain.ui.utils.Util" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String domain = request.getParameter("domain");
    String validationSuccessKey;

    try {
        ValidateDomainClient client = Util.getValidateDomainClient(request, config, session);
        validationSuccessKey = client.validateByTextInRoot(domain);
    } catch (Exception e) {
        validationSuccessKey = null;
    }

    if (validationSuccessKey == null || validationSuccessKey.equals("") ||
            validationSuccessKey.equals("false") || validationSuccessKey.equals("null")) {
        validationSuccessKey = "----false----";
    }
    else if (validationSuccessKey.equals("unavailable")) {
        validationSuccessKey = "----unavailable----";
    }
%><%=validationSuccessKey%>
