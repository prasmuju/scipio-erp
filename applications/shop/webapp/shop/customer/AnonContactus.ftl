<#--
This file is subject to the terms and conditions defined in the
files 'LICENSE' and 'NOTICE', which are part of this source
code package.
-->

<#include "component://shop/webapp/shop/customer/customercommon.ftl">

<@script>
    function reloadCaptcha(fieldName) {
        var captchaUri = "<@ofbizUrl>captcha.jpg?captchaCodeId=" + fieldName + "&amp;unique=_PLACEHOLDER_</@ofbizUrl>";
        var unique = Date.now();
        captchaUri = captchaUri.replace("_PLACEHOLDER_", unique);
        document.getElementById(fieldName).src = captchaUri;
    }
</@script>
<@section title=uiLabelMap.CommonContactUs>
    <form id="contactForm" method="post" action="<@ofbizUrl>submitAnonContact</@ofbizUrl>">
        <input type="hidden" name="partyIdFrom" value="${(userLogin.partyId)!}" />
        <input type="hidden" name="partyIdTo" value="${productStore.payToPartyId!}"/>
        <input type="hidden" name="contactMechTypeId" value="WEB_ADDRESS" />
        <input type="hidden" name="communicationEventTypeId" value="WEB_SITE_COMMUNICATI" />
        <input type="hidden" name="productStoreId" value="${productStore.productStoreId}" />
        <input type="hidden" name="emailType" value="CONT_NOTI_EMAIL" />
        <@table type="fields" class="${styles.table_basic!}" cellspacing="0"> <#-- orig: class="basic-table" -->
            <@tbody>
                <@tr>
                   <@td>${uiLabelMap.EcommerceSubject}</@td>
                   <@td><input type="text" name="subject" id="subject" class="required" value="${requestParameters.subject!}"/>*</@td>
                </@tr>
                <@tr>
                   <@td>${uiLabelMap.CommonMessage}</@td>
                   <@td><textarea name="content" id="message" class="required" cols="50" rows="5">${requestParameters.content!}</textarea>*</@td>
                </@tr>
                <@tr>
                   <@td>${uiLabelMap.FormFieldTitle_emailAddress}</@td>
                   <@td><input type="text" name="emailAddress" id="emailAddress" class="required" value="${requestParameters.emailAddress!}"/>*</@td>
                </@tr>
                <@tr>
                   <@td>${uiLabelMap.PartyFirstName}</@td>
                   <@td><input type="text" name="firstName" id="firstName" class="required" value="${requestParameters.firstName!}"/></@td>
                </@tr>
                <@tr>
                   <@td>${uiLabelMap.PartyLastName}</@td>
                   <@td><input type="text" name="lastName" id="lastName" class="required" value="${requestParameters.lastName!}"/></@td>
                </@tr>
                <@tr>
                   <@td>${uiLabelMap.CommonCaptchaCode}</@td>
                   <@td><div><img id="captchaImage" src="<@ofbizUrl>captcha.jpg?captchaCodeId=captchaImage&amp;unique=${nowTimestamp.getTime()}</@ofbizUrl>" alt="" /></div><a href="javascript:reloadCaptcha('captchaImage');">${uiLabelMap.CommonReloadCaptchaCode}</a></@td>
                </@tr>
                <@tr>
                   <@td>${uiLabelMap.CommonVerifyCaptchaCode}</@td>
                   <@td><input type="text" autocomplete="off" maxlength="30" size="23" name="captcha"/>*</@td>
                </@tr>
                <@tr>
                   <@td></@td>
                   <@td><input type="submit" value="${uiLabelMap.CommonSubmit}" class="${styles.link_run_sys!} ${styles.action_send!}" /></@td>
                </@tr>
            </@tbody>
        </@table>
    </form>
</@section>
