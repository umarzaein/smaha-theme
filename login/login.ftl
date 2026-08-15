<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
       ${msg("loginAccountTitle")}
    <#elseif section = "form">
    <#if realm.password>
      <form
    id="kc-form-login"
    action="${url.loginAction}"
    method="post">
                            
                    <#if !usernameHidden??>
                        <div class="input-group">

    <span class="input-icon">

        <svg class="icon">

        <use href="#icon-user"></use>

        </svg>

    </span>

    <input
    tabindex="2"
    id="username"
    name="username"
    type="text"
    value="${(login.username!'')}"
    placeholder=" "
    autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
    autofocus
    dir="ltr"
    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">

    <label for="username">
<#if !realm.loginWithEmailAllowed>
    ${msg("username")}
<#elseif !realm.registrationEmailAsUsername>
    ${msg("usernameOrEmail")}
<#else>
    ${msg("email")}
</#if>
</label>

<#if messagesPerField.existsError('username','password')>
    <span class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
    </span>
</#if>

</div>
                    </#if>

                    <div class="input-group">

    <span class="input-icon">
        <svg class="icon">
            <use href="#icon-lock"></use>
        </svg>
    </span>

    <input
        tabindex="3"
        id="password"
        name="password"
        type="password"
        placeholder=" "
        autocomplete="current-password"
        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">

    <label for="password">
        ${msg("password")}
    </label>

    <button
    id="togglePassword"
    type="button"
    class="toggle-password"
    aria-label="${msg("showPassword")}">

    <svg class="icon">
        <use href="#icon-eye"></use>
    </svg>

</button>

</div>

                    <div class="login-options">

<#if realm.rememberMe>

    <label class="remember">

        <input
            tabindex="5"
            id="rememberMe"
            name="rememberMe"
            type="checkbox"
            <#if login.rememberMe??>checked</#if>>

        <span>${msg("rememberMe")}</span>

    </label>
</#if>

    <#if realm.resetPasswordAllowed>
        <a tabindex="6" href="${url.loginResetCredentialsUrl}">
            ${msg("doForgotPassword")}
        </a>
    </#if>

</div>

                      <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                          <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                          <button
    tabindex="7"
    id="kc-login"
    name="login"
    type="submit"
    class="login-btn">

    <span class="button-text">
        ${msg("doLogIn")}
    </span>

    <span class="spinner"></span>

</button>

<div class="divider">
    <span>Portal Terintegrasi SMA Hasyim Asy'ari</span>
</div>

                      </div>
                </form>
            </#if>

        <@passkeys.conditionalUIData />
        <#elseif section = "info" >
<div class="login-footer">

    <a href="https://smahasyimasyari.com" target="_blank">
        Website
    </a>

    <a href="#">
        Privacy
    </a>

    <a href="#">
        Help
    </a>

</div>

    <#elseif section = "socialProviders" >
        <#if realm.password && social?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h2>${msg("identity-provider-login-label")}</h2>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a data-once-link data-disabled-class="${properties.kcFormSocialAccountListButtonDisabledClass!}" id="social-${p.alias}"
                                    class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>