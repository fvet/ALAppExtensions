// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Azure.Identity;

using System;

/// <summary>
/// Exposes functionality to manage Microsoft Entra users.
/// </summary>
codeunit 9010 "Azure AD User Management"
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    var
        [NonDebuggable]
        AzureADUserMgmtImpl: Codeunit "Azure AD User Mgmt. Impl.";

    trigger OnRun()
    begin
        Codeunit.Run(Codeunit::"Azure AD User Mgmt. Impl.");
    end;

    /// <summary>
    /// Retrieves all the users from Microsoft Entra. If the users already exist in the database,
    /// they are updated to match the ones from Microsoft Entra; otherwise new users are inserted in the database.
    /// </summary>
    [Scope('OnPrem')]
    [NonDebuggable]
    procedure CreateNewUsersFromAzureAD()
    begin
        AzureADUserMgmtImpl.CreateNewUsersFromAzureAD();
    end;

    /// <summary>    
    /// Creates a new user from a Microsoft Entra user.
    /// </summary>
    /// <param name="GraphUserInfo">The Microsoft Entra user.</param>
    [Scope('OnPrem')]
    [NonDebuggable]
    procedure CreateNewUserFromGraphUser(GraphUserInfo: DotNet UserInfo)
    begin
        AzureADUserMgmtImpl.CreateNewUserFromGraphUser(GraphUserInfo);
    end;

    /// <summary>    
    /// Synchronizes a user with the Microsoft Entra user corresponding to the authentication 
    /// email that is passed as a parameter. If the user record does not exist, it gets created.
    /// </summary>
    /// <param name="AuthenticationEmail">The user's authentication email.</param>
    /// <returns>True if there is a user in Microsoft Entra corresponding to the authentication email; otherwise false.</returns>
    [NonDebuggable]
    procedure SynchronizeLicensedUserFromDirectory(AuthenticationEmail: Text): Boolean
    begin
        AzureADUserMgmtImpl.SynchronizeLicensedUserFromDirectory(AuthenticationEmail);
    end;

    /// <summary>    
    /// Synchronizes all the users from the database with the ones from Microsoft Entra.
    /// Microsoft Entra users that do not exist in the database are created.
    /// </summary>
    [NonDebuggable]
    procedure SynchronizeAllLicensedUsersFromDirectory()
    begin
        AzureADUserMgmtImpl.SynchronizeAllLicensedUsersFromDirectory();
    end;

    /// <summary>    
    /// Checks if the user is a tenant admin.
    /// </summary>
    /// <returns>True if the user is a tenant admin; otherwise false.</returns>
    [NonDebuggable]
    procedure IsUserTenantAdmin(): Boolean
    begin
        exit(AzureADUserMgmtImpl.IsUserTenantAdmin());
    end;

    /// <summary>
    /// Checks whether custom permissions are assigned to the user.
    /// </summary>
    /// <param name="UserSecurityId">The security ID of the user to check for.</param>
    /// <returns>True if the user with the given user security ID has custom permissions; false otherwise.</returns>
    [NonDebuggable]
    procedure ArePermissionsCustomized(UserSecurityId: Guid): Boolean
    begin
        exit(AzureADUserMgmtImpl.ArePermissionsCustomized(UserSecurityId));
    end;

    /// <summary>    
    /// Checks if the user is a delegated user.
    /// </summary>
    /// <returns>True if the user is a delegated user; otherwise false.</returns>
    [NonDebuggable]
    procedure IsUserDelegated(UserSecID: Guid): Boolean
    begin
        exit(AzureADUserMgmtImpl.IsUserDelegated(UserSecID));
    end;

    /// <summary>
    /// Integration event, raised from "Azure AD User Update Wizard" page when the changes are applied.
    /// </summary>
    /// <param name="UserSecurityID">The ID of the user whose permission sets will be restored.</param>
    [IntegrationEvent(false, false)]
    [NonDebuggable]
    internal procedure OnRestoreDefaultPermissions(UserSecurityID: Guid)
    begin
    end;
}

